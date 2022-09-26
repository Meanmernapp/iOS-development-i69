//
//  SettingViewController.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 11/06/2022.
//

import UIKit

class SettingViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

extension SettingViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.register(SettingTableViewCell.self, indexPath: indexPath)
        cell.selectionStyle = .none
        if indexPath.row == 0 {
            cell.config(option: .Coins, index: indexPath.row)
        }
        else if indexPath.row == 5 {
            cell.config(option: .Logout, index: indexPath.row)
        }
        else {
            cell.config(option: .Simple, index: indexPath.row)
        }
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 120
        }
        else {
            return 80
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = CoinsViewController(nibName: "CoinsViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: false)
        case 1:
            let vc = BlockingViewController(nibName: "BlockingViewController", bundle: nil)
            self.navigationController?.pushViewController(vc, animated: false)
        case 2:

            print("privacy")
            if let url = URL(string: "https://i69app.com/policy") {
              if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
              } else {
                UIApplication.shared.openURL(url)
              }
            }
        case 3:
            if let url = URL(string: "https://i69app.com/terms") {
              if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
              } else {
                UIApplication.shared.openURL(url)
              }
            }
        case 4:
            
            SharedPreference.removeLoggedInUserId()
            let loginViewController = LoginViewRouter.setupModule()
            let navController = BaseNavigationController(rootViewController: loginViewController)
            navController.setNavigationBarHidden(true, animated: false)
            navController.setViewControllers([loginViewController], animated: true)
            
        default :
            print("Default")
        }
        
    }
    
}


