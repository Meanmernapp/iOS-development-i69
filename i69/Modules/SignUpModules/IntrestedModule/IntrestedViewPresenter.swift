//
//  IntrestedPresenter.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import Foundation

protocol IntrestedViewPresenterProtocol: AnyObject {
    func navigateToTagModule()
}

class IntrestedViewPresenter {

    unowned var view: IntrestedViewControllerProtocol
    let router: IntrestedViewRouterProtocol?
    let interactor: IntrestedViewInteractorProtocol?

    init(interactor: IntrestedViewInteractorProtocol, router: IntrestedViewRouterProtocol, view: IntrestedViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension IntrestedViewPresenter: IntrestedViewPresenterProtocol {
    func navigateToTagModule()
    {
        self.router?.navigateToTagModule(view: self.view)
    }
    
}
