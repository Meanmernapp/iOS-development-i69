//
//  IntrestOptionController.swift
//  i69
//
//  Created by The Mac Store on 20/04/2022.
//

import UIKit

protocol IntrestOptionControllerProtocol: AnyObject {
}
class IntrestOptionController: BaseTabBarViewController {
    var viewTitle = ""
    var menus = [MenuModel]()
    var presenter: IntrestOptionPresenterProtocol?
    @IBOutlet weak var tbOptions: UITableView!
    @IBOutlet weak var vHeader: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus.append(MenuModel(title: "Men", image: "men"))
        menus.append(MenuModel(title: "women", image: "women"))
        menus.append(MenuModel(title: "both", image: "both"))
        MenuOptionTableViewCell.registerNib(tableView: tbOptions)
        tbOptions.dataSource = self
        tbOptions.delegate = self
        
        
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addHeaderMain(view: vHeader, title: viewTitle,SignUpHelper.shared.notificationCount)
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

extension IntrestOptionController : UITableViewDelegate,UITableViewDataSource
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
        StorageHelper.shared.selectedInterestId = 1 + (3 * StorageHelper.shared.interestId) + indexPath.row
        
        self.presenter?.navigateToSearchView()
//        self.push(viewController: SearchUserFilterViewController(), animated: true)
    }
    
    
}
extension IntrestOptionController : IntrestOptionControllerProtocol
{}
