//
//  DashboardViewRouter.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//

import Foundation
import UIKit

protocol IntrestedInOptionViewRouterProtocol: AnyObject {
    func navigateToIntrestOptionModule(title : String,view: IntrestedInOptionViewControllerProtocol)
}

class IntrestedInOptionViewRouter: NSObject {

    weak var presenter: IntrestedInOptionViewPresenterProtocol?

    static func setupModule() -> IntrestedInOptionViewController {
        let controller = IntrestedInOptionViewController()
        let interactor = IntrestedInOptionViewInteractor()
        let router = IntrestedInOptionViewRouter()
         
        let presenter = IntrestedInOptionViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension IntrestedInOptionViewRouter: IntrestedInOptionViewRouterProtocol {
    func navigateToIntrestOptionModule(title : String,view: IntrestedInOptionViewControllerProtocol)
    {
        if let controller = view as? IntrestedInOptionViewController {
            
            controller.push(viewController: IntrestOptionRouter.setupModule(title: title), animated: true)
        }
    }
}
