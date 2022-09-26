//
//  IntrestedOptionTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import UIKit

class IntrestedOptionTableViewCell: UITableViewCell {

    @IBOutlet weak var btnWoman: UIButton!
    @IBOutlet weak var btnMan: UIButton!
    
    @IBOutlet weak var lbTitle: UILabel!
    
    
    @IBAction func btnManAction(_ sender: Any) {
        option.man = !option.man
        updateButton()
    }
    @IBAction func btnWomanAction(_ sender: Any) {
        
        option.woman = !option.woman
        updateButton()
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    var option = IntrestedOptionModel()
    
    func initialise(option : IntrestedOptionModel)
    {
        self.option = option
        lbTitle.text = option.title.uppercased()
        updateButton()
    }
    func updateButton()
    {
        updateButtonBackgroundAndTint(button: btnMan, clicked: option.man)
        updateButtonBackgroundAndTint(button: btnWoman, clicked: option.woman)
    }
    func updateButtonBackgroundAndTint(button : UIButton,clicked : Bool)
    {
        removeGradiantLayer(button: button)
        if !clicked
        {
            button.applySocialGradient()
        }
        else{
            button.applySocialGradientGolden()
//            button.backgroundColor = UIColor(named: "golden")
        }
//        lbTitle.textColor = clicked ? .white : UIColor(named: "golden")
        let tintColor = !clicked ? UIColor(named: "golden") : .black
        button.tintColor = tintColor
    }
    func removeGradiantLayer(button : UIButton)
    {
        while button.layer.sublayers?.count ?? 0 > 2
        {
            button.layer.sublayers?.remove(at: 0)
        }
    }
    
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "IntrestedOptionTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "IntrestedOptionTableViewCell")
    }
    static func getCell(tableView : UITableView) -> IntrestedOptionTableViewCell
    {
        let cell : IntrestedOptionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "IntrestedOptionTableViewCell") as! IntrestedOptionTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
}
