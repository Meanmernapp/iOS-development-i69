//
//  IntrestedViewController.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import UIKit

protocol IntrestedViewControllerProtocol: AnyObject {
}


class IntrestedViewController: BaseViewController {
    
    
    var presenter: IntrestedViewPresenterProtocol?
    
    
    @IBOutlet weak var tbIntrestedOption: UITableView!
    @IBOutlet weak var btnBack: UIButton!
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnSaveAction(_ sender: Any) {
        SignUpHelper.shared.intrestedIns = [Int]()
        for option in SignUpHelper.shared.intrestedOptions {
            let id = option.man && option.woman ? 3 : (option.man ? 1 :(option.woman ? 2 : 0) )
            if id > 0
            {
                SignUpHelper.shared.intrestedIns.append(id + option.id)
            }
            
        }
        if SignUpHelper.shared.intrestedIns.count == 0
        {
            showErrorMessage("Pleae select atleast 1 option")
        }
        else{
            self.presenter?.navigateToTagModule()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        SignUpHelper.shared.setDefaultIntrestedOptions()
        
        IntrestedOptionTableViewCell.registerNib(tableView: tbIntrestedOption)
        
        tbIntrestedOption.delegate = self
        tbIntrestedOption.dataSource = self
        
        btnBack.imageView?.contentMode = UIView.ContentMode.scaleAspectFit
//        btnBack.imageView?.contentMode = .scaleToFill
        // Do any additional setup after loading the view.
    }
    

}
extension IntrestedViewController : IntrestedViewControllerProtocol
{
    
}
extension IntrestedViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SignUpHelper.shared.intrestedOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = IntrestedOptionTableViewCell.getCell(tableView: tableView)
        cell.initialise(option: SignUpHelper.shared.intrestedOptions[indexPath.row])
        return cell
    }
    
    
}
