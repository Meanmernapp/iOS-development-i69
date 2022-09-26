//
//  OwnImageMessageTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 01/05/2022.
//

import UIKit

class OwnImageMessageTableViewCell: UITableViewCell {
    @IBOutlet weak var messageContent: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initialise(message : ChatMessage)
    {
        
        messageContent.text = message.content
        lbTime.text = message.timeStamp.getRelativeTime()
    }
    
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "OwnImageMessageTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "OwnImageMessageTableViewCell")
    }
    static func getCell(tableView : UITableView) -> OwnImageMessageTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OwnImageMessageTableViewCell") as! OwnImageMessageTableViewCell
        cell.selectionStyle = .none
        return cell
    }
}
