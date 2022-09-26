//
//  CommentTableViewCell.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 07/06/2022.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    

    
    
    //MARK: - IBOutlets

    @IBOutlet weak var likeCount: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var commentLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var likeBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var replyBtn: UIButton!
    @IBOutlet weak var constTableViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var commentLikesView: UIView!
    
    @IBOutlet weak var heightForRemoving: NSLayoutConstraint!
    //MARK: - Variables
    
    var commentData  : FetchCommentQuery.Data.AllComment?
    var replyCallBack : ((String?,Int?,Int?)->())?
    var likeCallBack : ((String?,Int?,Int?)->())?
    
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?)
    {
        print("observeValue called in tableview cell")
        
        if keyPath == "contentSize"
        {
            if let newvalue = change?[.newKey]{
                let updatedVal  = newvalue as! CGSize
                let viewHeight  = updatedVal.height
                constTableViewHeight.constant = viewHeight
                DispatchQueue.main.async {
                    self.tableView.layoutIfNeeded()
                    self.layoutIfNeeded()
                }
            }
            else {
                
            }
        }
        else {
            
        }
    }
    
    deinit {
        tableView.removeObserver(self, forKeyPath: "contentSize")
    }
    
    @IBAction func replyAction(_ sender: Any) {
        self.replyCallBack?(self.nameLbl.text,Int(commentData?.pk ?? 0),commentData?.pk)
    }
    
    @IBAction func heartAction(_ sender: UIButton) {
        self.likeCallBack?("\(self.commentData?.pk ?? 0)", sender.tag,commentData?.like )
    }
    
    
    //MARK: - Functions
    
    func config(commentData:FetchCommentQuery.Data.AllComment?) {
        self.commentData  = commentData
        self.nameLbl.text = commentData?.user.fullName
        self.dateLbl.text = commentData?.createdDate?.getRelativeTime()
        self.commentLbl.text = commentData?.commentDescription
        let url = commentData?.user.avatar?.url ?? ""
        self.likeCount.text = "\(commentData?.like ?? 0)"
        self.imgView.loadImage(url: url)
        tableView.reloadData()
    }
    func configReply(commentData : FetchCommentQuery.Data.AllComment.Reply?) {
        self.nameLbl.text = commentData?.user.fullName
        self.commentLbl.text = commentData?.commentDescription
        let url = commentData?.user.avatarPhotos?.first??.url ?? ""
        self.imgView.loadImage(url: url)
        self.dateLbl.text = commentData?.createdDate?.getRelativeTime()
    }
    
}

extension CommentTableViewCell : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commentData?.replys?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.register(CommentTableViewCell.self, indexPath: indexPath)
        cell.replyBtn.isHidden = true
        cell.likeBtn.isHidden = true
        cell.likeCount.isHidden = true
        cell.constTableViewHeight.constant = 0
        cell.heightForRemoving.constant = 0
        cell.configReply(commentData: self.commentData?.replys?[indexPath.row])
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


