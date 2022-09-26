//
//  LeftNavMenuTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//

import UIKit

class LeftNavMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var imImage: UIImageView!
    @IBOutlet weak var vLine: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initialise(menu : MenuModel)
    {
        lbTitle.text = menu.title.uppercased()
        imImage.image = UIImage(named: menu.image)
    }
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "LeftNavMenuTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "LeftNavMenuTableViewCell")
    }
    static func getCell(tableView : UITableView) -> LeftNavMenuTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeftNavMenuTableViewCell") as! LeftNavMenuTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
}
