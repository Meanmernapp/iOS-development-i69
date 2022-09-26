//
//  CompleteProfileSectionHeaderTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 15/04/2022.
//

import UIKit

class CompleteProfileSectionHeaderTableViewCell: UITableViewCell {
    @IBOutlet weak var btnOpenClose: UIButton!
    @IBOutlet weak var lbTitle: UILabel!
    var openCloseClicked : (()->())?
    
    @IBAction func btnOpenCloseAction(_ sender: Any) {
        openCloseClicked?()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setImage(open : Bool)
    {
        btnOpenClose.setImage(UIImage(named: open ? "arrow_up" : "arrow_down"), for: .normal)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "CompleteProfileSectionHeaderTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "CompleteProfileSectionHeaderTableViewCell")
    }
    static func getCell(tableView : UITableView) -> CompleteProfileSectionHeaderTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompleteProfileSectionHeaderTableViewCell") as! CompleteProfileSectionHeaderTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
}
