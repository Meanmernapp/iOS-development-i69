//
//  WelcomeViewController.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//

import UIKit

protocol WelcomeViewControllerProtocol: AnyObject {
}
class WelcomeViewController: BaseViewController {
    
    var presenter: WelcomeViewPresenterProtocol?
    
    @IBAction func btnClickHereAction(_ sender: Any) {
        SharedPreference.setLoggedInUserId(SignUpHelper.shared.user.id)
        SharedPreference.setLoggedInUserToken(SignUpHelper.shared.token)
        self.presenter?.navigateToTabbarModule()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
extension WelcomeViewController : WelcomeViewControllerProtocol
{}
