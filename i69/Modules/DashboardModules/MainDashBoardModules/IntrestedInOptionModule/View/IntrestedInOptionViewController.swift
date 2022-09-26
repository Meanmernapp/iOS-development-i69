//
//  DashboardIntrestInViewController.swift
//  i69
//
//  Created by The Mac Store on 20/04/2022.
//

import UIKit

protocol IntrestedInOptionViewControllerProtocol: AnyObject {
}
class IntrestedInOptionViewController: BaseTabBarViewController {
    
    var menus = [MenuModel]()
    var presenter: IntrestedInOptionViewPresenterProtocol?
    @IBOutlet weak var vHeader: UIView!
    @IBOutlet weak var tbOptions: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus.append(MenuModel(title: "serious relationship", image: "relationship"))
        menus.append(MenuModel(title: "casual dating", image: "casual_dating"))
        menus.append(MenuModel(title: "new friends", image: "new_friend"))
        menus.append(MenuModel(title: "room mates", image: "roommate"))
        menus.append(MenuModel(title: "Business contacts", image: "business_contact"))
        MenuOptionTableViewCell.registerNib(tableView: tbOptions)
        tbOptions.dataSource = self
        tbOptions.delegate = self
        

        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addHeaderMain(view: vHeader, title: "INTERESTED IN",SignUpHelper.shared.notificationCount)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension IntrestedInOptionViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = MenuOptionTableViewCell.getCell(tableView: tableView)
        cell.initialise(menu: menus[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        StorageHelper.shared.interestId = indexPath.row
        self.presenter?.navigateToIntrestOptionModule(title: menus[indexPath.row].title)
    }
    
}
extension IntrestedInOptionViewController : IntrestedInOptionViewControllerProtocol
{}
