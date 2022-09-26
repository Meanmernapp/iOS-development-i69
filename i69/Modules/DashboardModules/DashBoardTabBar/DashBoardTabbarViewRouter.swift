//
//  DashBoardTabbarViewRouter.swift
//  i69
//
//  Created by The Mac Store on 20/04/2022.
//

import Foundation
import UIKit

protocol DashBoardTabbarViewRouterProtocol: AnyObject {
}

class DashBoardTabbarViewRouter: NSObject {

    weak var presenter: DashBoardTabbarViewPresenterProtocol?

    static func setupModule() -> DashBoardTabbarViewController {
        let controller = DashBoardTabbarViewController()
        let interactor = DashBoardTabbarViewInteractor()
        let router = DashBoardTabbarViewRouter()
         
        let presenter = DashBoardTabbarViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension DashBoardTabbarViewRouter: DashBoardTabbarViewRouterProtocol {
    
}
