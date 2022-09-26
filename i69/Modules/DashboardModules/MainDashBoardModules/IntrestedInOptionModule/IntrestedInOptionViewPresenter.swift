//
//  DashboardViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//

import Foundation

protocol IntrestedInOptionViewPresenterProtocol: AnyObject {
    func navigateToIntrestOptionModule(title : String)
}

class IntrestedInOptionViewPresenter {

    unowned var view: IntrestedInOptionViewControllerProtocol
    let router: IntrestedInOptionViewRouterProtocol?
    let interactor: IntrestedInOptionViewInteractorProtocol?

    init(interactor: IntrestedInOptionViewInteractorProtocol, router: IntrestedInOptionViewRouter, view: IntrestedInOptionViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension IntrestedInOptionViewPresenter: IntrestedInOptionViewPresenterProtocol {
    func navigateToIntrestOptionModule(title : String)
    {
        self.router?.navigateToIntrestOptionModule(title: title, view: self.view)
    }
    
}
