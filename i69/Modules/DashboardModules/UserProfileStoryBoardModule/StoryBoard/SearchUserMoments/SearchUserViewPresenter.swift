//
//  SearchUserViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 28/04/2022.
//

import Foundation

protocol SearchUserViewPresenterProtocol: AnyObject {
    func getUserMoments()
    func getUserMomentsResponse(data : GetAllUserMomentsQuery.Data?,error : Error?)
}

class SearchUserViewPresenter {

    unowned var view: SearchUserViewControllerProtocol
    let router: SearchUserViewRouterProtocol?
    let interactor: SearchUserViewInteractorProtocol?

    init(interactor: SearchUserViewInteractorProtocol, router: SearchUserViewRouter, view: SearchUserViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchUserViewPresenter: SearchUserViewPresenterProtocol {
    func getUserMoments()
    {
        self.interactor?.getUserMoments()
    }
    func getUserMomentsResponse(data : GetAllUserMomentsQuery.Data?,error : Error?)
    {
        
        self.view.getUserMomentsResponse(data: data, error: error)
    }
}
