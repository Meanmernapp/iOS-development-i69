//
//  UserProfileViewRouter.swift
//  i69
//
//  Created by The Mac Store on 21/04/2022.
//

import Foundation
import UIKit

protocol UserProfileViewRouterProtocol: AnyObject {
}

class UserProfileViewRouter: NSObject {

    weak var presenter: UserProfileViewPresenterProtocol?

    static func setupModule() -> UserProfileViewController {
        let controller = UserProfileViewController()
        let interactor = UserProfileViewInteractor()
        let router = UserProfileViewRouter()
         
        let presenter = UserProfileViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension UserProfileViewRouter: UserProfileViewRouterProtocol {
    
}
