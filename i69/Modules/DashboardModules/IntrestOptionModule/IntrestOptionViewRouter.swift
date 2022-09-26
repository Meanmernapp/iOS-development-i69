//
//  IntrestOptionRouter.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//

import Foundation
import UIKit

protocol IntrestOptionRouterProtocol: AnyObject {
    func navigateToSearchView(view : IntrestOptionControllerProtocol)
}

class IntrestOptionRouter: NSObject {

    weak var presenter: IntrestOptionPresenterProtocol?

    static func setupModule(title : String) -> IntrestOptionController {
        let controller = IntrestOptionController()
        let interactor = IntrestOptionInteractor()
        let router = IntrestOptionRouter()
         
        controller.viewTitle = title
        let presenter = IntrestOptionPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension IntrestOptionRouter: IntrestOptionRouterProtocol {
    func navigateToSearchView(view : IntrestOptionControllerProtocol)
    {
        if let controller = view as? IntrestOptionController {
            
            controller.push(viewController: SearchUserFilterViewRouter.setupModule(), animated: true)
        }
    }
}
