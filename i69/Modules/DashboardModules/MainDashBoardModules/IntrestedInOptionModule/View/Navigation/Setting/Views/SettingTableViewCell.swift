//
//  SettingTableViewCell.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 11/06/2022.
//

import UIKit
enum Options {
    case Coins
    case Simple
    case Logout
}

class SettingTableViewCell: UITableViewCell {
    
    
    //MARK: - IBOutlets

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var largeImage: UIImageView!
    @IBOutlet weak var smallImage: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var lineView: UIView!
    
    
    //MARK: - Variables
    let titleArray = ["BUY COINS","Blocked Accounts","Privacy","Terms and Conditions","Logout"]
    
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    //MARK: - IBAction
    
    
    @IBAction func nextButtonAction(_ sender: Any) {
        
    }
    
    
    //MARK: - Functions
    
    func config(option:Options,index:Int) {
        self.titleLbl.text = titleArray[index]
        if option == .Coins {
            mainImage.image = UIImage(named: "topbar")
            largeImage.image = UIImage(named: "app_icon")
            smallImage.isHidden = true
            lineView.isHidden = true
            titleLbl.textColor = .black
            nextBtn.tintColor = .black
        }
        
        else if option == .Simple {
            self.smallImage.image = UIImage(named: "setting\(index)")
            mainImage.isHidden = true
            smallImage.isHidden = false
            largeImage.isHidden = true
        }
        
        else if option == .Logout {
            self.smallImage.image = UIImage(named: "setting\(index)")
            mainImage.isHidden = true
            largeImage.isHidden = true
            smallImage.isHidden = false
        }
    }
    
}
