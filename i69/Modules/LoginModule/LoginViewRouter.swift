//
//  LoginRouter.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import Foundation
import UIKit

protocol LoginViewRouterProtocol: AnyObject {
    func navigateToIntrestedSignUpModule(view: LoginViewControllerProtocol)
    func navigateToTabbarModule(view: LoginViewControllerProtocol)
}

class LoginViewRouter: NSObject {

    weak var presenter: LoginViewPresenterProtocol?

    static func setupModule() -> LoginViewController {
        let controller = LoginViewController()
        let interactor = LoginViewInteractor()
        let router = LoginViewRouter()
        
        let presenter = LoginViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension LoginViewRouter: LoginViewRouterProtocol {
    func navigateToIntrestedSignUpModule(view: LoginViewControllerProtocol)
    {
        if let controller = view as? LoginViewController {
            
            controller.push(viewController: IntrestedViewRouter.setupModule(), animated: true)
        }
    }
    
    func navigateToTabbarModule(view: LoginViewControllerProtocol)
    {
        if let controller = view as? LoginViewController {
            
            controller.push(viewController: DashBoardTabbarViewRouter.setupModule(), animated: true)
        }
    }
}
