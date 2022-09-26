//
//  AboutViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 13/04/2022.
//

import Foundation

protocol AboutViewPresenterProtocol: AnyObject {
    func navigateToCompleteProfileModule()
}

class AboutViewPresenter {

    unowned var view: AboutViewControllerProtocol
    let router: AboutViewRouterProtocol?
    let interactor: AboutViewInteractorProtocol?

    init(interactor: AboutViewInteractorProtocol, router: AboutViewRouterProtocol, view: AboutViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension AboutViewPresenter: AboutViewPresenterProtocol {
    func navigateToCompleteProfileModule()
    {
        self.router?.navigateToCompleteProfileModule(view: self.view)
    }
    
}
