//
//  AddIntrestViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 16/04/2022.
//


import Foundation

protocol AddIntrestViewPresenterProtocol: AnyObject {
}

class AddIntrestViewPresenter {

    unowned var view: AddIntrestViewControllerProtocol
    let router: AddIntrestViewRouter?
    let interactor: AddIntrestViewInteractorProtocol?

    init(interactor: AddIntrestViewInteractorProtocol, router: AddIntrestViewRouter, view: AddIntrestViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension AddIntrestViewPresenter: AddIntrestViewPresenterProtocol {
    
}
