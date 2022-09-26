//
//  AddIntrestItemViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 16/04/2022.
//


import Foundation

protocol AddIntrestItemViewPresenterProtocol: AnyObject {
}

class AddIntrestItemViewPresenter {

    unowned var view: AddIntrestItemViewControllerProtocol
    let router: AddIntrestItemViewRouterProtocol?
    let interactor: AddIntrestItemViewInteractorProtocol?

    init(interactor: AddIntrestItemViewInteractorProtocol, router: AddIntrestItemViewRouter, view: AddIntrestItemViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension AddIntrestItemViewPresenter: AddIntrestItemViewPresenterProtocol {
    
}
