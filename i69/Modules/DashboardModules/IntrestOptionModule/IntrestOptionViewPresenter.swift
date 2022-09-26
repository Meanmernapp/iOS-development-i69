//
//  IntrestOptionPresenter.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//

import Foundation

protocol IntrestOptionPresenterProtocol: AnyObject {
    func navigateToSearchView()
}

class IntrestOptionPresenter {

    unowned var view: IntrestOptionControllerProtocol
    let router: IntrestOptionRouterProtocol?
    let interactor: IntrestOptionInteractorProtocol?

    init(interactor: IntrestOptionInteractorProtocol, router: IntrestOptionRouter, view: IntrestOptionControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension IntrestOptionPresenter: IntrestOptionPresenterProtocol {
    func navigateToSearchView()
    {
        self.router?.navigateToSearchView(view: self.view)
    }
}
