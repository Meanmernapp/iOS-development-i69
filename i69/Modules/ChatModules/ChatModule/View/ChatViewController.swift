//
//  ChatViewController.swift
//  i69
//
//  Created by The Mac Store on 30/04/2022.
//

import UIKit
import Apollo
import Alamofire
import ObjectMapper
import AVKit

protocol ChatViewControllerProtocol: AnyObject {
    func sendChatMessageResponse(data : SendChatMessageMutationMutation.Data?,error : Error?)
    func getChatMessageByRoomIdResponse(data : GetChatMessagesByRoomIdQuery.Data?,error : Error?)
    func sendImageResponse(data : SendChatMessageMutationMutation.Data?,error : Error?)
    func sendVideoResponse(data : SendChatMessageMutationMutation.Data?,error : Error?)
    func getChatMessagesSubscription()
}
struct Response: Codable {
    let img: String?
    let success: Bool?
}
//MARK: - Enum

class ChatViewController: BaseViewController {
    
    
    //MARK: - Variables
    
    var presenter: ChatViewPresenterProtocol?
    var data = [ChatMessage]()
    var fileURL : URL?
    lazy var imagePicker = UIImagePickerController()
    var subscription: Cancellable?
    var imSelectedPicture : UIImage?
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imUserProfile: UIImageView!
    @IBOutlet weak var imUserName: UILabel!
    @IBOutlet weak var tbChat: UITableView!
    @IBOutlet weak var tfMessage: UITextField!
    
    
    //MARK: - IBAction
    
    
    @IBAction func btnActionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnAttachmentAction(_ sender: Any) {
        showImagePickerSheet()
    }
    @IBAction func giftAction(_ sender: Any) {
        let vc = GiftViewController(nibName: "GiftViewController", bundle: nil)
            vc.modalPresentationStyle = .custom
            vc.transitioningDelegate = self
            vc.isAllGifts = true
            vc.senderId = ProfileStorageHelper.shared.user?.id ?? ""
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func btnSendAction(_ sender: Any) {
        let message = tfMessage.text ?? ""
        if message.count == 0
        {
            showErrorMessage("Please input some message")
            return
        }
        showLoadingIndicator()
        GraphQLClient.shared.apollo.clearCache()
        self.presenter?.sendChatMessage(message: message)
    }
    
    @IBAction func blockUser(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "Are you sure to block \(ProfileStorageHelper.shared.user?.fullName ?? "") !", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
            self.showLoadingIndicator()
            GraphQLClient.shared.performMutation(mutation: BlockingUserMutation(UserID: SignUpHelper.shared.user.id, BlockUserID: ProfileStorageHelper.shared.user?.id ?? "")) { result, err in
                self.hideLoadingIndicator()
                GraphQLClient.shared.apollo.clearCache()
                self.navigationController?.popViewController(animated: true)
            }
        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { _ in
            print("No")
        }))
       self.present(alert, animated: true, completion: nil)

    }
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getChatMessagesSubscription()
        let url : String = (ProfileStorageHelper.shared.user?.avatarPhotos?.count ?? 0) > 0 ? ProfileStorageHelper.shared.user?.avatarPhotos?[0]?.url ?? "" : ""
        imUserProfile.loadImage(url: url)
        imUserName.text = ProfileStorageHelper.shared.user?.fullName ?? ""
        OwnImageMessageTableViewCell.registerNib(tableView: tbChat)
        ChatImageTableViewCell.registerNib(tableView: tbChat)
        SimpleTableViewCell.registerNib(tableView: tbChat)
        tbChat.dataSource = self
        tbChat.delegate = self
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        showLoadingIndicator()
        self.presenter?.getChatMessagesByRoomId()
    }
    deinit {
        ProfileStorageHelper.shared.newChatId = -1
        self.subscription?.cancel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    //MARK: - Functions

    
    func uploadImage(image:UIImage,name:String,completion: @escaping (_ fileUrl:String?,_ success:Bool?) -> Void) {
        print(self.getDay())
       
        let imgData:Data = image.jpegData(compressionQuality: 0.5)!
        let token = self.getDay()
        let url = "https://api.chatadmin-mod.click/chat/image_upload"
        let parameters = ["token":token] as [String : Int]
        let headers: HTTPHeaders = ["Authorization": "Token \(SignUpHelper.shared.token)"]
        self.showLoadingIndicator()
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(imgData, withName: "image" , fileName: "file.jpeg", mimeType: "image/jpeg")
                for (key, value) in parameters {
                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
                }
            },
            to: url, method: .post , headers: headers)
        .validate().responseDecodable(of: Response.self) { response in
            self.hideLoadingIndicator()
            print(response.result)
            switch response.result {
            case .success(let resp):
                GraphQLClient.shared.apollo.clearCache()
                completion(resp.img,resp.success)
            case .failure(_):
                completion(nil,false)
            }
        }
    }
    func uploadVideo(video:Data,name:String,completion: @escaping (_ fileUrl:String?,_ success:Bool?) -> Void) {
        
        print(self.getDay())
        let token = self.getDay()
        let url = "https://api.chatadmin-mod.click/chat/image_upload"
        let parameters = ["token":token] as [String : Int]
        let headers: HTTPHeaders = ["Authorization": "Token \(SignUpHelper.shared.token)"]
        self.showLoadingIndicator()
        AF.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(video, withName: "image" , fileName: "\(name).mp4", mimeType: "video/mp4")
                for (key, value) in parameters {
                    multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key)
                }
            },
            to: url, method: .post , headers: headers)
        .validate().responseDecodable(of: Response.self) { response in
            self.hideLoadingIndicator()
            print(response.result)
            switch response.result {
            case .success(let resp):
                GraphQLClient.shared.apollo.clearCache()
                completion(resp.img,resp.success)
            case .failure(_):
                completion(nil,false)
            }
        }
    }
}

//MARK: - Extentions


extension ChatViewController : UITableViewDelegate,UITableViewDataSource,playButton
{
    func buttonUrl(tag: Int) {
        if let url = URL(string: self.data[tag].content)  {
            let player = AVPlayer(url: url)
            let controller = AVPlayerViewController()
            controller.player = player
            present(controller, animated: true) {
                player.play()
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if data[indexPath.row].own
        {
            
            if data[indexPath.row].videoType {
                let cell = ChatImageTableViewCell.getCell(tableView: tableView)
                cell.config(message: data[indexPath.row])
                cell.playButton.tag = indexPath.row
                cell.delegate = self
                cell.leftConstant.constant = 60
                cell.rightConstant.constant = 5
                cell.mainView.backgroundColor = UIColor(named: "golden")
                return cell
            }
            else {
                
                let cell = SimpleTableViewCell.getCell(tableView: tableView)
                cell.initialise(message: data[indexPath.row])
                return cell
            }
            
        }
        else {
            if data[indexPath.row].videoType {
                let cell = ChatImageTableViewCell.getCell(tableView: tableView)
                cell.playButton.tag = indexPath.row
                cell.delegate = self
                cell.config(message: data[indexPath.row])
                cell.leftConstant.constant = 5
                cell.rightConstant.constant = 60
                cell.mainView.backgroundColor = .white
                return cell
            }
            else {
                let cell = OwnImageMessageTableViewCell.getCell(tableView: tableView)
                cell.initialise(message: data[indexPath.row])
                return cell
            }
        }
        
    }
}

extension ChatViewController : ChatViewControllerProtocol
{
    func sendImageResponse(data: SendChatMessageMutationMutation.Data?, error: Error?) {
        if data != nil
        {
            self.data.append(ChatMessage(content: data?.sendMessage?.message?.content ?? "", timeStamp: getCurrentTimeStampWOMiliseconds(), own: true, videoType: true))
            
            tbChat.reloadData()
            DispatchQueue.main.async {
                if self.data.count > 0 {
                    let indexPath = IndexPath(row: self.data.count-1, section: 0)
                    self.tbChat.scrollToRow(at: indexPath, at: .bottom, animated: false)
                    
                }
            }
            tfMessage.text = ""
        }
        if let error = error as NSError? {
            if error.debugDescription.contains("Not enough coins") {
                showErrorMessage("Not enough coins")
            }
            else
            {
                showErrorMessage(error.localizedDescription)
            }
            
        }
    }
    
    func sendVideoResponse(data: SendChatMessageMutationMutation.Data?, error: Error?) {
        if data != nil
        {
            self.data.append(ChatMessage(content: data?.sendMessage?.message?.content ?? "", timeStamp: getCurrentTimeStampWOMiliseconds(), own: true, videoType: true))
            
            tbChat.reloadData()
            DispatchQueue.main.async {
                if self.data.count > 0 {
                    let indexPath = IndexPath(row: self.data.count-1, section: 0)
                    self.tbChat.scrollToRow(at: indexPath, at: .bottom, animated: false)
                    
                }
            }
            tfMessage.text = ""
        }
        if let error = error as NSError? {
            if error.debugDescription.contains("Not enough coins") {
                showErrorMessage("Not enough coins")
            }
            else
            {
                showErrorMessage(error.localizedDescription)
            }
            
        }
    }
    
    
    
    
    //MARK: - Functions
    
    func getChatMessageByRoomIdResponse(data : GetChatMessagesByRoomIdQuery.Data?,error : Error?)
    {
        self.hideLoadingIndicator()
        self.data = [ChatMessage]()
        if let edges = data?.messages?.edges
        {
            for edge in edges {
                if let message = edge {
                    self.data.insert(ChatMessage(message: message),at: 0)
                }
            }
        }
        
        
        tbChat.reloadData()
        if self.data.count > 0 {
            
            self.tbChat.scrollToRow(at: IndexPath(row: self.data.count-1, section: 0), at: .bottom, animated: false)
        }
    }
    
    func sendChatMessageResponse(data : SendChatMessageMutationMutation.Data?,error : Error?)
    {
        self.hideLoadingIndicator()
        if data != nil
        {
            self.data.append(ChatMessage(content: tfMessage.text ?? "", timeStamp: getCurrentTimeStampWOMiliseconds()))
            
            tbChat.reloadData()
            DispatchQueue.main.async {
                if self.data.count > 0 {
                    let indexPath = IndexPath(row: self.data.count-1, section: 0)
                    self.tbChat.scrollToRow(at: indexPath, at: .bottom, animated: false)
                    
                }
            }
            tfMessage.text = ""
        }
        if let error = error as NSError? {
            if error.debugDescription.contains("Not enough coins") {
                showErrorMessage("Not enough coins")
            }
            else
            {
                showErrorMessage(error.localizedDescription)
            }
            
        }
    }
    
    func getCurrentTimeStampWOMiliseconds() -> String {
        let objDateformat: DateFormatter = DateFormatter()
        objDateformat.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let strTime: String = objDateformat.string(from: Date())
        return strTime
//        return Date().relativeDateAsString()
    }
    
    func getDay() -> Int {
        let objDateformat: DateFormatter = DateFormatter()
        objDateformat.dateFormat = "dd"
        let strTime: String = objDateformat.string(from: Date())
        return Int((Int(strTime) ?? 01)*(33333333/222))
    }
}

extension ChatViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

