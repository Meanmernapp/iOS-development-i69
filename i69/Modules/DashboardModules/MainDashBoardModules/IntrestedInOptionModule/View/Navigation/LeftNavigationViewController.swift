//
//  LeftNavigationViewController.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//

import UIKit

class LeftNavigationViewController: UIViewController {
    
    @IBOutlet weak var tbOptions: UITableView!
    weak var dashboardController: DashBoardTabbarViewController?
    var leftNavMenuOptions = [MenuModel]()
    @IBAction func btnCloseAction(_ sender: Any) {
        dashboardController?.sideMenu?.toggleMenu()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        leftNavMenuOptions.append(MenuModel(title: "Search", image: "search"))
        leftNavMenuOptions.append(MenuModel(title: "Contact Us", image: "email"))
        leftNavMenuOptions.append(MenuModel(title: "Buy Coins", image: "buy_coin"))
        leftNavMenuOptions.append(MenuModel(title: "Privacy", image: "privacy"))
        leftNavMenuOptions.append(MenuModel(title: "Settings", image: "settings"))
        LeftNavMenuTableViewCell.registerNib(tableView: tbOptions)
        tbOptions.dataSource = self
        tbOptions.delegate = self
        // Do any additional setup after loading the view.
    }

}
extension LeftNavigationViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leftNavMenuOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LeftNavMenuTableViewCell.getCell(tableView: tableView)
        cell.initialise(menu: leftNavMenuOptions[indexPath.row])
        cell.vLine.isHidden = indexPath.row == (leftNavMenuOptions.count - 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.dashboardController?.selectedIndex = 0
            dashboardController?.sideMenu?.toggleMenu()
        case 1:
            let email = "admin@i69app.com"
            if let url = URL(string: "mailto:\(email)") {
              if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
              } else {
                UIApplication.shared.openURL(url)
              }
            }
        case 2:
            let vc = CoinsViewController(nibName: "CoinsViewController", bundle: nil)
            self.dashboardController?.navigationController?.pushViewController(vc, animated: false)
            print("Coins")
        case 3:
            //https://i69app.com/terms
            print("privacy")
            if let url = URL(string: "https://i69app.com/policy") {
              if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
              } else {
                UIApplication.shared.openURL(url)
              }
            }
        case 4:
            let vc = SettingViewController(nibName: "SettingViewController", bundle: nil)
            self.dashboardController?.navigationController?.pushViewController(vc, animated: false)
            default :
            print("Default")
        }
        
    }
}
