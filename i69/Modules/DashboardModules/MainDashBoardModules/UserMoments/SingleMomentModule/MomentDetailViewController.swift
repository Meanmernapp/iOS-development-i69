//
//  MomentDetailViewController.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 07/06/2022.
//

import UIKit

class MomentDetailViewController: BaseViewController {
    
    @IBOutlet weak var tfData: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var momentImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var commentBtn: UIButton!
    @IBOutlet weak var commentUSerImage: UIImageView!
    
    @IBOutlet weak var commentTFViewHeight: NSLayoutConstraint!
    var momentData =  MomentListModel()
    var commentData : [FetchCommentQuery.Data.AllComment?]?
    var replyID = ""
    var ID = ""
    var isReplying = false
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        self.ID = "\(self.momentData.id)"
        GraphQLClient.shared.fetchQuery(query: FetchCommentQuery(momentID: "\(self.momentData.id)")) { res, err in
            
            self.commentData?.removeAll()
            self.commentData = res?.allComments
            self.tableView.reloadData()
            self.scrolTOBottom()
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardDidHideNotification,
            object: nil
        )
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification , object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification , object: nil)
        
    }
    
    @IBAction func giftAction(_ sender: Any) {
        let vc = GiftViewController(nibName: "GiftViewController", bundle: nil)
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        vc.isAllGifts = true
        vc.senderId = momentData.userID
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func likeAction(_ sender: Any) {
        GraphQLClient.shared.performMutation(mutation: LikeMomentMutation(momentID: "\(self.momentData.id)")) { result, err in
            let currentLike = Int(self.likeBtn.title(for: .normal) ?? "0") ?? 0
            self.likeBtn.setTitle("\(currentLike+1)", for: .normal)
            GraphQLClient.shared.apollo.clearCache()
        }
    }
    
    @IBAction func commentAction(_ sender: Any) {
        
    }
    
    @IBAction func sendCommentAction(_ sender: Any) {
        if !isReplying {
            if self.tfData.text != ""  {
                showLoadingIndicator()
                GraphQLClient.shared.performMutation(mutation: CommentMomentMutation(momentID: "\(self.ID)", commentDescription: self.tfData.text ?? "")) { result, err in
                    GraphQLClient.shared.apollo.clearCache()
                    GraphQLClient.shared.fetchQuery(query: FetchCommentQuery(momentID: "\(self.momentData.id)")) { res, err in
                        self.hideLoadingIndicator()
                        self.tfData.text = ""
                        self.commentData?.removeAll()
                        self.commentData = res?.allComments
                        self.tableView.reloadData()
                        self.scrolTOBottom()
                    }
                }
            }
            
        }
        else {
            GraphQLClient.shared.performMutation(mutation: CommentMomentReplyMutation(momentID: "\(self.ID)", commentDescription: self.tfData.text ?? "",replyTo : self.replyID )) { result, err in
                GraphQLClient.shared.apollo.clearCache()
                GraphQLClient.shared.fetchQuery(query: FetchCommentQuery(momentID: "\(self.momentData.id)")) { res, err in
                    self.hideLoadingIndicator()
                    if err == nil {
                        self.tfData.text = ""
                        self.commentData?.removeAll()
                        self.commentData = res?.allComments
                        self.commentBtn.setTitle("\(res?.allComments?.count ?? 0)", for: .normal)
                        GraphQLClient.shared.apollo.clearCache()
                        self.tableView.reloadData()
                        self.scrolTOBottom()
                    }
                }
            }
        }
    }
    
    
    //MARK: - Functions
    
    func setupView() {
        self.likeBtn.setTitle("\(self.momentData.likeCount ?? 0)", for: .normal)
        self.commentBtn.setTitle("\(self.momentData.commentCount ?? 0)", for: .normal)
        self.nameLbl.text = momentData.fullName
        self.timeLbl.text = momentData.createdDate?.getRelativeTime()
        self.titleLbl.text = momentData.fullName ?? "" + "Moment"
        self.momentImg.loadImage(url: momentData.url ?? "")
        self.commentUSerImage.image = StorageHelper.shared.userImage
        let url = "\(ApiKeys.baseUrl)media/\(momentData.file ?? "")"
        print("found_image --- \(url)")
        if let image = self.momentData.image
        {
            print("found image --- \(url)")
            imgView.image = image
        }
        else{
            if url.contains(".mp4")
            {
                imgView.downloadAndLoad(moment: self.momentData, url: url)
            }
            else{
                imgView.loadImage(url: url,moment: self.momentData)
            }
        }
        var commentDescription = ""
        if let descriptions = momentData.momentDescriptionPaginated
        {
            for description in descriptions {
                if let val = description
                {
                    if val.count > 0
                    {
                        commentDescription = "\(commentDescription)\(commentDescription.count > 0 ? " " : "")\(val)"
                    }
                }
            }
        }
        self.descriptionLbl.text = commentDescription
        
        
    }
    func scrolTOBottom() {
        if self.commentData?.count ?? 0 > 0 {
            self.tableView.scrollToRow(at: IndexPath(row: (self.commentData?.count ?? 0) - 1, section: 0), at: .bottom, animated: true)
        }
    }
    
}
extension MomentDetailViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commentData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.register(CommentTableViewCell.self, indexPath: indexPath)
        cell.likeBtn.tag = indexPath.row
        cell.config(commentData: self.commentData?[indexPath.row])
        cell.replyCallBack = { name , ID ,replyID in
            self.tfData.becomeFirstResponder()
            self.tfData.text = "@\(name ?? "")"
            self.isReplying = true
            self.replyID = "\(replyID ?? 0)"
        }
        
        cell.likeCallBack = { id,index,previousLikes in
            GraphQLClient.shared.performMutation(mutation: LikeCommentMutation(commentID: id ?? "")) { result, error in
                let indexPath = IndexPath(row: index!, section: 0)
                var comment = self.commentData
                comment?[index!]?.like = previousLikes! + 1
                self.commentData = comment
                cell.likeCount.text = "\(previousLikes!+1)"
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
        
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.commentTFViewHeight.constant = keyboardHeight
        }
    }
    @objc func keyboardWillHide(_ notification: Notification) {
        self.commentTFViewHeight.constant = 0
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
        }
    }
    
    
}


extension MomentDetailViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

extension MomentDetailViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        
    }
}
