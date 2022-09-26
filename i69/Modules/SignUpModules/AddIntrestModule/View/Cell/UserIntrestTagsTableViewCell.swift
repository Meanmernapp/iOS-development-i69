//
//  UserIntrestTagsTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 16/04/2022.
//AddIntrestItem

import UIKit

class UserIntrestTagsTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lbTitle: UILabel!
    
    
    var deleteCallback : (()->())?
    @IBAction func btnDeleteAction(_ sender: Any) {
        deleteCallback?()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "UserIntrestTagsTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "UserIntrestTagsTableViewCell")
    }
    static func getCell(tableView : UITableView) -> UserIntrestTagsTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserIntrestTagsTableViewCell") as! UserIntrestTagsTableViewCell
        cell.selectionStyle = .none
        return cell
    }
}
