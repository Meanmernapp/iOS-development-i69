//
//  TagsViewRouter.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import Foundation
import UIKit

protocol TagsViewRouterProtocol: AnyObject {
    func navigateToAboutModule(view: TagsViewControllerProtocol)
}

class TagsViewRouter: NSObject {

    weak var presenter: TagsViewPresenterProtocol?

    static func setupModule() -> TagsViewController {
        let controller = TagsViewController()
        let interactor = TagsViewInteractor()
        let router = TagsViewRouter()
        
        let presenter = TagsViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension TagsViewRouter: TagsViewRouterProtocol {
    
    func navigateToAboutModule(view: TagsViewControllerProtocol)
    {
        if let controller = view as? TagsViewController {
            
            controller.push(viewController: AboutViewRouter.setupModule(), animated: true)
        }
    }
}
