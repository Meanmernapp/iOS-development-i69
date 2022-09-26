//
//  AddIntrestItemViewController.swift
//  i69
//
//  Created by The Mac Store on 16/04/2022.
//

import UIKit

protocol AddIntrestItemViewControllerProtocol: AnyObject {
}
class AddIntrestItemViewController: BaseViewController {
    
    var presenter: AddIntrestItemViewPresenterProtocol?
    var selectedTag = "Music"
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbSubtitle: UILabel!
    
    @IBOutlet weak var tfField: UITextField!
    
    @IBAction func btnSaveAction(_ sender: Any) {
        if let text = tfField.text
        {
            if text.count == 0
            {
                showErrorMessage("Please input some value")
                return
            }
            
            SignUpHelper.shared.intrest[selectedTag]?.append(text)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lbTitle.text = "Add \(selectedTag)".uppercased()
        lbSubtitle.text = selectedTag
        
        // Do any additional setup after loading the view.
    }
         

}
extension AddIntrestItemViewController : AddIntrestItemViewControllerProtocol
{}
