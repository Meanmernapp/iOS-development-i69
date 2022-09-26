//
//  UserMomentsRouter.swift
//  i69
//
//  Created by The Mac Store on 21/04/2022.
//

import Foundation
import UIKit

protocol UserMomentsViewRouterProtocol: AnyObject {
}

class UserMomentsViewRouter: NSObject {

    weak var presenter: UserMomentsViewPresenterProtocol?

    static func setupModule() -> UserMomentsViewController {
        let controller = UserMomentsViewController()
        let interactor = UserMomentsViewInteractor()
        let router = UserMomentsViewRouter()
         
        let presenter = UserMomentsViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension UserMomentsViewRouter: UserMomentsViewRouterProtocol {
}
