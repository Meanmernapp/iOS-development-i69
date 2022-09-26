//
//  SearchUserFilterViewRouter.swift
//  i69
//
//  Created by The Mac Store on 26/04/2022.
//

import Foundation
import UIKit

protocol SearchUserFilterViewRouterProtocol: AnyObject {
}

class SearchUserFilterViewRouter: NSObject {

    weak var presenter: SearchUserFilterViewPresenterProtocol?

    static func setupModule() -> SearchUserFilterViewController {
        let controller = SearchUserFilterViewController()
        let interactor = SearchUserFilterViewInteractor()
        let router = SearchUserFilterViewRouter()
         
        let presenter = SearchUserFilterViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension SearchUserFilterViewRouter: SearchUserFilterViewRouterProtocol {
}
