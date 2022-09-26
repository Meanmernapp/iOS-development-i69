//
//  UserMomentsPresenter.swift
//  i69
//
//  Created by The Mac Store on 21/04/2022.
//

import Foundation

protocol UserMomentsViewPresenterProtocol: AnyObject {
    func getUserMoments()
    func getUserMomentsResponse(data : GetAllUserMomentsQuery.Data?,error : Error?)
    func getUserStoriesResponse(data : GetAllUserStoriesQuery.Data?,error : Error?)
    func getUserStories()
}

class UserMomentsViewPresenter {

    unowned var view: UserMomentsViewControllerProtocol
    let router: UserMomentsViewRouterProtocol?
    let interactor: UserMomentsViewInteractorProtocol?

    init(interactor: UserMomentsViewInteractorProtocol, router: UserMomentsViewRouter, view: UserMomentsViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension UserMomentsViewPresenter: UserMomentsViewPresenterProtocol {
    func getUserMoments()
    {
        self.interactor?.getUserMoments()
    }
    func getUserStoriesResponse(data : GetAllUserStoriesQuery.Data?,error : Error?)
    {
        self.view.getUserStoriesResponse(data: data, error: error)
    }
    func getUserMomentsResponse(data : GetAllUserMomentsQuery.Data?,error : Error?)
    {
        
        self.view.getUserMomentsResponse(data: data, error: error)
    }
    func getUserStories()
    {
        self.interactor?.getUserStories()
    }
}
