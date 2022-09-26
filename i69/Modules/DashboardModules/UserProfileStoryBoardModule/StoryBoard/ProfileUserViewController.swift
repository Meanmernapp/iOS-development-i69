//
//  ProfileUserViewController.swift
//  i69
//
//  Created by The Mac Store on 27/04/2022.
//

import UIKit

class ProfileUserViewController: pagerViewController {

    @IBOutlet weak var tbData: UITableView!
    var pagerMainController : ProfilePageViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        AboutTableViewCell.registerNib(tableView: tbData)
        InterestedProfileTableViewCell.registerNib(tableView: tbData)
        tbData.dataSource = self
        tbData.delegate = self
        tbData.isScrollEnabled =  pagerMainController?.parentController?.svScroll.isScrollEnabled ?? false
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        pagerMainController?.indexSelected(self.controllerIndex)
    }

}

extension ProfileUserViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return controllerIndex == 0 ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && controllerIndex == 0
        {
            let cell = AboutTableViewCell.getCell(tableView: tableView)
            cell.lbName.text = ProfileStorageHelper.shared.user?.fullName ?? ""
            cell.lbAbout.text = ProfileStorageHelper.shared.user?.about ?? ""
            cell.initialise(tags: ProfileStorageHelper.shared.user?.tags)
            return cell
        }
        let cell = InterestedProfileTableViewCell.getCell(tableView: tableView)
        cell.initialise(music: ProfileStorageHelper.shared.user?.music ?? [String?](), movies: ProfileStorageHelper.shared.user?.movies ?? [String?](), books: ProfileStorageHelper.shared.user?.books ?? [String?](), sports: ProfileStorageHelper.shared.user?.sportsTeams ?? [String?]())
        cell.lbName.text = ProfileStorageHelper.shared.user?.fullName ?? ""
        return cell
    }
}
