//
//  CompleteProfileViewRouter.swift
//  i69
//
//  Created by The Mac Store on 14/04/2022.
//

import Foundation
import UIKit

protocol CompleteProfileViewRouterProtocol: AnyObject {
    func navigateToWelcomeModule(view: CompleteProfileViewControllerProtocol)
    func navigateToAddTagsModule(tag :String,view: CompleteProfileViewControllerProtocol)
}

class CompleteProfileViewRouter: NSObject {

    weak var presenter: CompleteProfileViewPresenterProtocol?

    static func setupModule() -> CompleteProfileViewController {
        let controller = CompleteProfileViewController()
        let interactor = CompleteProfileViewInteractor()
        let router = CompleteProfileViewRouter()
      
        let presenter = CompleteProfileViewPresenter(interactor: interactor, router: router, view: controller)
        controller.isCommingFoeEditing = true
        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
      
        return controller
    }
}

extension CompleteProfileViewRouter: CompleteProfileViewRouterProtocol {
    func navigateToAddTagsModule(tag :String,view: CompleteProfileViewControllerProtocol)
    {
        if let controller = view as? CompleteProfileViewController {
            
            controller.push(viewController: AddIntrestViewRouter.setupModule(selectedTag: tag), animated: true)
        }
    }
    func navigateToWelcomeModule(view: CompleteProfileViewControllerProtocol)
    {
        if let controller = view as? CompleteProfileViewController {
            
            controller.push(viewController: WelcomeViewRouter.setupModule(), animated: true)
        }
    }
}
