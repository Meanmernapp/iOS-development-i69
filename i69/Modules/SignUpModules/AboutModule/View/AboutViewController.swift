//
//  AboutViewController.swift
//  i69
//
//  Created by The Mac Store on 11/04/2022.
//

import UIKit

protocol AboutViewControllerProtocol: AnyObject {
}
class AboutViewController: BaseViewController {
    
    
    var presenter: AboutViewPresenterProtocol?
    @IBOutlet weak var tvAbout: UITextView!
    
    @IBAction func btnNextAction(_ sender: Any) {
        self.presenter?.navigateToCompleteProfileModule()
    }
    @IBAction func btnBackPressed(_ sender: Any) {
        if let text = tvAbout.text
        {
            if text.count == 0
            {
                showErrorMessage("Please tell us about your self")
                return
            }
            SignUpHelper.shared.about = text
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
extension AboutViewController : AboutViewControllerProtocol
{
    
}
