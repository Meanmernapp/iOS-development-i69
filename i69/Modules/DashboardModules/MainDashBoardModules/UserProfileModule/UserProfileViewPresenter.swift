//
//  UserProfileViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 21/04/2022.
//

import Foundation

protocol UserProfileViewPresenterProtocol: AnyObject {
}

class UserProfileViewPresenter {

    unowned var view: UserProfileViewControllerProtocol
    let router: UserProfileViewRouterProtocol?
    let interactor: UserProfileViewInteractorProtocol?

    init(interactor: UserProfileViewInteractorProtocol, router: UserProfileViewRouter, view: UserProfileViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension UserProfileViewPresenter: UserProfileViewPresenterProtocol {
}
