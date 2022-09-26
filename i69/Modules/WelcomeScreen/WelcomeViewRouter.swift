//
//  WelcomeViewRouter.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//

import Foundation
import UIKit

protocol WelcomeViewRouterProtocol: AnyObject {
    func navigateToTabbarModule(view: WelcomeViewControllerProtocol)
}

class WelcomeViewRouter: NSObject {

    weak var presenter: WelcomeViewPresenterProtocol?

    static func setupModule() -> WelcomeViewController {
        let controller = WelcomeViewController()
        let interactor = WelcomeViewInteractor()
        let router = WelcomeViewRouter()
         
        let presenter = WelcomeViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension WelcomeViewRouter: WelcomeViewRouterProtocol {
    
    func navigateToTabbarModule(view: WelcomeViewControllerProtocol)
    {
        if let controller = view as? WelcomeViewController {
            
            controller.push(viewController: DashBoardTabbarViewRouter.setupModule(), animated: true)
        }
    }
}
