//
//  InputFiledsTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 15/04/2022.
//

import UIKit

class InputFiledsTableViewCell: UITableViewCell {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var tfField: UITextField!
    @IBOutlet weak var vLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    var key = ""
    var section = 0
    var set : CompleteProfileDataSet?
    func initialise(section : Int,key : String,set : CompleteProfileDataSet)
    {
        self.set = set
        self.section = section
        self.key = key
        
        self.lbName.text = key
//        self.tfField.text = SignUpHelper.shared.completeTbDataSet[section].dic[key]?.text
        self.tfField.text = set.dic[key]?.text
        tfField.addTarget(self, action: #selector(textChangeListner(textField:)), for: .editingChanged)
        
        
        self.tfField.attributedPlaceholder = NSAttributedString(
            string: set.dic[key]?.placeholderText ?? "",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.white]
        )
        
        
    }
    @objc func textChangeListner(textField: UITextField) {
        set?.dic[key]?.text = textField.text ?? ""
    }
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "InputFiledsTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "InputFiledsTableViewCell")
    }
    static func getCell(tableView : UITableView) -> InputFiledsTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InputFiledsTableViewCell") as! InputFiledsTableViewCell
        cell.selectionStyle = .none
        return cell
    }
}
