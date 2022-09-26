//
//  SimpleTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 01/05/2022.
//

import UIKit

class SimpleTableViewCell: UITableViewCell {
    @IBOutlet weak var lbContent: UILabel!
    @IBOutlet weak var lbTimeStamp: UILabel!
    
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
        lbContent.text = message.content
        lbTimeStamp.text = message.timeStamp.getRelativeTime()
    }
    
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "SimpleTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "SimpleTableViewCell")
    }
    static func getCell(tableView : UITableView) -> SimpleTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableViewCell") as! SimpleTableViewCell
        cell.selectionStyle = .none
        return cell
    }
}
