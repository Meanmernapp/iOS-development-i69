//
//  SearchUserFilterViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 26/04/2022.
//

import Foundation

protocol SearchUserFilterViewPresenterProtocol: AnyObject {
    func GetSearcedUserResponse(data : GetSearcedhUsersQuery.Data?,error : Error?)
    func GetSearcedUsers(searchKey : String)
}

class SearchUserFilterViewPresenter {

    unowned var view: SearchUserFilterViewControllerProtocol
    let router: SearchUserFilterViewRouterProtocol?
    let interactor: SearchUserFilterViewInteractorProtocol?

    init(interactor: SearchUserFilterViewInteractorProtocol, router: SearchUserFilterViewRouter, view: SearchUserFilterViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchUserFilterViewPresenter: SearchUserFilterViewPresenterProtocol {
    func GetSearcedUsers(searchKey : String)
    {
        self.interactor?.GetSearcedUsers(searchKey: searchKey)
    }
    func GetSearcedUserResponse(data : GetSearcedhUsersQuery.Data?,error : Error?)
    {
        self.view.GetSearcedUserResponse(data: data, error: error)
    }
}
