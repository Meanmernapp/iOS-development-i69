//
//  AddIntrestItemViewRouter.swift
//  i69
//
//  Created by The Mac Store on 16/04/2022.
//

import Foundation
import UIKit

protocol AddIntrestItemViewRouterProtocol: AnyObject {
}

class AddIntrestItemViewRouter: NSObject {

    weak var presenter: AddIntrestItemViewPresenterProtocol?

    static func setupModule(selectedTag : String) -> AddIntrestItemViewController {
        let controller = AddIntrestItemViewController()
        let interactor = AddIntrestItemViewInteractor()
        let router = AddIntrestItemViewRouter()
        
        controller.selectedTag = selectedTag
        let presenter = AddIntrestItemViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension AddIntrestItemViewRouter: AddIntrestItemViewRouterProtocol {
    
}
