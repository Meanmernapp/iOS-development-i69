//
//  ChatListRowTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 30/04/2022.
//

import UIKit

class ChatListRowTableViewCell: UITableViewCell {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbLastMessageContent: UILabel!
    @IBOutlet weak var lbLastMessageDate: UILabel!
    @IBOutlet weak var imProfile: UIImageView!
    @IBOutlet weak var vOnline: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getName(edge : GetAllRoomsQuery.Data.Room.Edge) -> String?
    {
        return (edge.node?.userId.id ?? "").compare(StorageHelper.shared.user?.id ?? "--").rawValue == 0 ? edge.node?.target.fullName : edge.node?.userId.fullName
    }
    func getOnlineStatus(edge : GetAllRoomsQuery.Data.Room.Edge) -> Bool
    {
        return (edge.node?.userId.id ?? "").compare(StorageHelper.shared.user?.id ?? "--").rawValue == 0 ? edge.node?.target.isOnline ?? false : edge.node?.userId.isOnline ?? false
    }
    
    func getUrl(edge : GetAllRoomsQuery.Data.Room.Edge) -> String?
    {
        return (edge.node?.userId.id ?? "").compare(StorageHelper.shared.user?.id ?? "--").rawValue == 0 ? edge.node?.target.avatar?.url : edge.node?.userId.avatar?.url
    }
    func initialise(edge : GetAllRoomsQuery.Data.Room.Edge)
    {
        let url : String = getUrl(edge: edge) ?? ""
        
        
        lbName.text = getName(edge: edge)
        
        
        vOnline.backgroundColor = getOnlineStatus(edge : edge) ? UIColor.green : UIColor.yellow
        
        let message : GetAllRoomsQuery.Data.Room.Edge.Node.MessageSet.Edge.Node? = (edge.node?.messageSet.edges.count ?? 0) > 0 ? edge.node?.messageSet.edges[0]?.node : nil
        if let msge = message
        {
            
            lbLastMessageDate.text = (msge.timestamp).getRelativeTime()
            if   url.contains(".mp4") {
                lbLastMessageContent.text = "🎥 Video"

            }
            else if verifyUrl(urlString: msge.content) {
                lbLastMessageContent.text = "📷 Photo"
            }
            else {
                lbLastMessageContent.text = msge.content
            }
            
            
        }
        else{
            lbLastMessageDate.text = ""
            lbLastMessageContent.text = ""
        }
        
        imProfile.loadImage(url: url)
    }
    
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "ChatListRowTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "ChatListRowTableViewCell")
    }
    static func getCell(tableView : UITableView) -> ChatListRowTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatListRowTableViewCell") as! ChatListRowTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
}
