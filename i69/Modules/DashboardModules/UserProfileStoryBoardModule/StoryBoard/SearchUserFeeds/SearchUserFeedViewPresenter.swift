//
//  SearchUserFeedViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 28/04/2022.
//

import Foundation

protocol SearchUserFeedViewPresenterProtocol: AnyObject {
    func getUserMoments()
    func getUserMomentsResponse(data : GetUserMomentsQuery.Data?,error : Error?)
}

class SearchUserFeedViewPresenter {

    unowned var view: SearchUserFeedViewControllerProtocol
    let router: SearchUserFeedViewRouterProtocol?
    let interactor: SearchUserFeedViewInteractorProtocol?

    init(interactor: SearchUserFeedViewInteractorProtocol, router: SearchUserFeedViewRouter, view: SearchUserFeedViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension SearchUserFeedViewPresenter: SearchUserFeedViewPresenterProtocol {
    func getUserMoments()
    {
        self.interactor?.getUserMoments()
    }
    func getUserMomentsResponse(data : GetUserMomentsQuery.Data?,error : Error?)
    {
        
        self.view.getUserMomentsResponse(data: data, error: error)
    }
}
