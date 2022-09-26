//
//  CompleteProfileViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 14/04/2022.
//

import Foundation
import UIKit

protocol CompleteProfileViewPresenterProtocol: AnyObject {
    func navigateToAddTagsModule(tag :String)
    func completeProfile(photos : [UIImage])
    func completeResponse(data : UpdateUserProfileMutation.Data?,error : Error?)
    func navigateToWelcomeModule()
}

class CompleteProfileViewPresenter {

    unowned var view: CompleteProfileViewControllerProtocol
    let router: CompleteProfileViewRouterProtocol?
    let interactor: CompleteProfileViewInteractorProtocol?

    init(interactor: CompleteProfileViewInteractorProtocol, router: CompleteProfileViewRouter, view: CompleteProfileViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension CompleteProfileViewPresenter: CompleteProfileViewPresenterProtocol {
    func navigateToWelcomeModule()
    {
        self.router?.navigateToWelcomeModule(view: self.view)
    }
    func navigateToAddTagsModule(tag :String)
    {
        self.router?.navigateToAddTagsModule(tag: tag, view: self.view)
    }
    func completeProfile(photos : [UIImage])
    {
        self.interactor?.completeProfile(photos: photos)
    }
    func completeResponse(data : UpdateUserProfileMutation.Data?,error : Error?)
    {
        self.view.completeResponse(data: data, error: error)
    }
}
