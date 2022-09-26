//
//  AddIntrestViewRouter.swift
//  i69
//
//  Created by The Mac Store on 16/04/2022.
//

import Foundation
import UIKit

protocol AddIntrestViewRouterProtocol: AnyObject {
}

class AddIntrestViewRouter: NSObject {

    weak var presenter: AddIntrestViewPresenter?

    static func setupModule(selectedTag : String) -> AddIntrestViewController {
        let controller = AddIntrestViewController()
        let interactor = AddIntrestViewInteractor()
        let router = AddIntrestViewRouter()
        
        controller.selectedTag = selectedTag
        let presenter = AddIntrestViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension AddIntrestViewRouter: AddIntrestViewRouterProtocol {
    
}
