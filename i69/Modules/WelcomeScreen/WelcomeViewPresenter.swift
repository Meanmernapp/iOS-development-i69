//
//  WelcomeViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//


import Foundation

protocol WelcomeViewPresenterProtocol: AnyObject {
    func navigateToTabbarModule()
}

class WelcomeViewPresenter {

    unowned var view: WelcomeViewControllerProtocol
    let router: WelcomeViewRouterProtocol?
    let interactor: WelcomeViewInteractorProtocol?

    init(interactor: WelcomeViewInteractorProtocol, router: WelcomeViewRouter, view: WelcomeViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension WelcomeViewPresenter: WelcomeViewPresenterProtocol {
    func navigateToTabbarModule()
    {
        self.router?.navigateToTabbarModule(view: self.view)
    }
    
}
