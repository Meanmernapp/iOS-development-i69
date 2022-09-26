//
//  ChatListViewController.swift
//  i69
//
//  Created by The Mac Store on 30/04/2022.
//

import UIKit

protocol ChatListViewControllerProtocol: AnyObject {
    func getUserChatListResponse(data : GetAllRoomsQuery.Data?,error : Error?)
}
class ChatListViewController: BaseTabBarViewController {
    var presenter: ChatListViewPresenterProtocol?
    var data = [GetAllRoomsQuery.Data.Room.Edge]()
    @IBOutlet weak var vHeader: UIView!
    @IBOutlet weak var tbChat: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addHeaderMain(view: vHeader, title: "Messages",SignUpHelper.shared.notificationCount)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ChatListRowTableViewCell.registerNib(tableView: tbChat)
        
        tbChat.dataSource = self
        tbChat.delegate = self
        
        
        showLoadingIndicator()
        self.presenter?.getUserChatList()
    }
    
    
    //MARK: - Functions
    
    
}
extension ChatListViewController : UITableViewDelegate,UITableViewDataSource
{
    
    func getName(edge : GetAllRoomsQuery.Data.Room.Edge) -> String?
    {
        return (edge.node?.userId.id ?? "").compare(StorageHelper.shared.user?.id ?? "--").rawValue == 0 ? edge.node?.target.fullName : edge.node?.userId.fullName
    }
    
    func getId(edge : GetAllRoomsQuery.Data.Room.Edge) -> String?
    {
        return (edge.node?.userId.id ?? "").compare(StorageHelper.shared.user?.id ?? "--").rawValue == 0 ? edge.node?.target.id : edge.node?.userId.id
    }
    
    func getUrl(edge : GetAllRoomsQuery.Data.Room.Edge) -> String?
    {
        return (edge.node?.userId.id ?? "").compare(StorageHelper.shared.user?.id ?? "--").rawValue == 0 ? edge.node?.target.avatar?.url : edge.node?.userId.avatar?.url
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChatListRowTableViewCell.getCell(tableView: tableView)
        cell.initialise(edge: data[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var roomId = -1
        if let chatRoom = Int(data[indexPath.row].node?.id ?? "0")
        {
            roomId = chatRoom
        }
        print(roomId)
        
        ProfileStorageHelper.shared.user = GetUserProfileByIdQuery.Data.User()
        
        ProfileStorageHelper.shared.user?.id = getId(edge: data[indexPath.row])
        ProfileStorageHelper.shared.user?.fullName = getName(edge: data[indexPath.row])
        let avatar = GetUserProfileByIdQuery.Data.User.AvatarPhoto(id: "", url: getUrl(edge: data[indexPath.row]))
        
        ProfileStorageHelper.shared.user?.avatarPhotos = [avatar]
        
        ProfileStorageHelper.shared.newChatId = roomId
        self.navigationController?.tabBarController?.navigationController?.pushViewController(ChatViewRouter.setupModule(), animated: true)
    }
}
extension ChatListViewController : ChatListViewControllerProtocol
{
    func getUserChatListResponse(data : GetAllRoomsQuery.Data?,error : Error?)
    {
        self.hideLoadingIndicator()
        self.data = [GetAllRoomsQuery.Data.Room.Edge]()
        if let edges = data?.rooms?.edges
        {
            for edge in edges {
                if let edg = edge
                {
                    self.data.append(edg)
                }
            }
        }
        tbChat.reloadData()
    }
}

