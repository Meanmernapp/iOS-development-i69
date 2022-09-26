//
//  TagsViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import Foundation

protocol TagsViewPresenterProtocol: AnyObject {
    func navigateToAboutModule()
    
    func fetchDefaultPickers()
    func fetchDefaultPickerResponse(data : PickersQuery.Data?,error : Error?)
}

class TagsViewPresenter {

    unowned var view: TagsViewControllerProtocol
    let router: TagsViewRouterProtocol?
    let interactor: TagsViewInteractorProtocol?

    init(interactor: TagsViewInteractorProtocol, router: TagsViewRouterProtocol, view: TagsViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension TagsViewPresenter: TagsViewPresenterProtocol {
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
    func navigateToAboutModule() {
        self.router?.navigateToAboutModule(view: self.view)
    }
    
    
}
