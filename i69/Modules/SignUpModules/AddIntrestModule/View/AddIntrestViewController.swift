//
//  AddIntrestViewController.swift
//  i69
//
//  Created by The Mac Store on 16/04/2022.
//

import UIKit

protocol AddIntrestViewControllerProtocol: AnyObject {
}
class AddIntrestViewController: BaseViewController {
    
    var presenter: AddIntrestViewPresenter?
    var selectedTag = "Music"
    
    
    @IBOutlet weak var btnTitle: UIButton!
    @IBOutlet weak var lbSubTitle: UILabel!
    @IBOutlet weak var tbData: UITableView!
    
    
    @IBAction func btnSaveAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnAddAction(_ sender: Any) {
        self.push(viewController: AddIntrestItemViewRouter.setupModule(selectedTag: selectedTag), animated: true)
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tbData.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        SignUpHelper.shared.setTextFieldDic()
        
        UserIntrestTagsTableViewCell.registerNib(tableView: tbData)
        tbData.dataSource = self
        tbData.delegate = self
        
        
        btnTitle.setTitle("Add \(selectedTag) Tags".uppercased(), for: .normal)
        lbSubTitle.text = selectedTag

        // Do any additional setup after loading the view.
    }
         

}
extension AddIntrestViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = SignUpHelper.shared.intrest[selectedTag]?.count ?? 0
        return count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UserIntrestTagsTableViewCell.getCell(tableView: tableView)
        cell.lbTitle.text = SignUpHelper.shared.intrest[selectedTag]?[indexPath.row] ?? ""
        cell.deleteCallback = {
            SignUpHelper.shared.intrest[self.selectedTag]?.remove(at: indexPath.row)
            tableView.reloadData()
        }
        return cell
    }
    
    
}
extension AddIntrestViewController : AddIntrestViewControllerProtocol
{}
