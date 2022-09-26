//
//  AboutViewRouter.swift
//  i69
//
//  Created by The Mac Store on 13/04/2022.
//

import Foundation
import UIKit

protocol AboutViewRouterProtocol: AnyObject {
    func navigateToCompleteProfileModule(view: AboutViewControllerProtocol)
}

class AboutViewRouter: NSObject {

    weak var presenter: AboutViewPresenterProtocol?

    static func setupModule() -> AboutViewController {
        let controller = AboutViewController()
        let interactor = AboutViewInteractor()
        let router = AboutViewRouter()
        
        let presenter = AboutViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension AboutViewRouter: AboutViewRouterProtocol {
    
    func navigateToCompleteProfileModule(view: AboutViewControllerProtocol)
    {
        if let controller = view as? AboutViewController {
            
            controller.push(viewController: CompleteProfileViewRouter.setupModule(), animated: true)
        }
    }
}
