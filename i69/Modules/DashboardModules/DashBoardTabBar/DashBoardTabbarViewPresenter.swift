//
//  DashBoardTabbarViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 20/04/2022.
//

import Foundation

protocol DashBoardTabbarViewPresenterProtocol: AnyObject {
    func getAndUpdate()
    func getUserProfileByIdResponse(data : GetUserProfileByIdQuery.Data?,error : Error?)
    func fetchDefaultPickers()
    func fetchDefaultPickerResponse(data : PickersQuery.Data?,error : Error?)
}

class DashBoardTabbarViewPresenter {

    unowned var view: DashBoardTabbarViewControllerProtocol
    let router: DashBoardTabbarViewRouterProtocol?
    let interactor: DashBoardTabbarViewInteractorProtocol?

    init(interactor: DashBoardTabbarViewInteractorProtocol, router: DashBoardTabbarViewRouter, view: DashBoardTabbarViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension DashBoardTabbarViewPresenter: DashBoardTabbarViewPresenterProtocol {
    func getAndUpdate()
    {
        self.interactor?.getUserProfileById()
        self.interactor?.updateOnLineStatus()
        self.fetchDefaultPickers()
    }
    
    func getUserProfileByIdResponse(data : GetUserProfileByIdQuery.Data?,error : Error?)
    {
        self.view.getUserProfileByIdResponse(data: data, error: error)
    }
    func fetchDefaultPickers()
    {
        if SignUpHelper.shared.filter != nil
        {
            self.view.fetchDefaultPickerResponse(error: nil)
            return
        }
        self.interactor?.fetchDefaultPickers()
    }
    func fetchDefaultPickerResponse(data : PickersQuery.Data?,error : Error?)
    {
        
        SignUpHelper.shared.setFilter(filter: data?.defaultPicker)
        self.view.fetchDefaultPickerResponse(error: error)
        
    }
}
