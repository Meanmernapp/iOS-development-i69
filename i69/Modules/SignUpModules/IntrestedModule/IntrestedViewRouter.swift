//
//  IntrestedRouter.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import Foundation
import UIKit

protocol IntrestedViewRouterProtocol: AnyObject {
    func navigateToTagModule(view: IntrestedViewControllerProtocol)
}

class IntrestedViewRouter: NSObject {

    weak var presenter: IntrestedViewPresenterProtocol?

    static func setupModule() -> IntrestedViewController {
        let controller = IntrestedViewController()
        let interactor = IntrestedViewInteractor()
        let router = IntrestedViewRouter()
        
        let presenter = IntrestedViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension IntrestedViewRouter: IntrestedViewRouterProtocol {
    
    func navigateToTagModule(view: IntrestedViewControllerProtocol)
    {
        if let controller = view as? IntrestedViewController {
            
            controller.push(viewController: TagsViewRouter.setupModule(), animated: true)
        }
    }
}
