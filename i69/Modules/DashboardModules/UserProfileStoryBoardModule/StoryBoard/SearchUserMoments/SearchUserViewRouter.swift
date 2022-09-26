//
//  SearchUserViewRouter.swift
//  i69
//
//  Created by The Mac Store on 28/04/2022.
//

import Foundation
import UIKit

protocol SearchUserViewRouterProtocol: AnyObject {
}

class SearchUserViewRouter: NSObject {

    weak var presenter: SearchUserViewPresenterProtocol?

    static func setupModule(pagerMainController : ProfilePageViewController) -> SearchUserViewController {
        
        
        let controller = UIStoryboard.init(name: "UserProfile", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchUserViewController") as! SearchUserViewController
//        let controller = SearchUserViewController()
        let interactor = SearchUserViewInteractor()
        let router = SearchUserViewRouter()
         
        let presenter = SearchUserViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        controller.pagerMainController = pagerMainController
        return controller
    }
}

extension SearchUserViewRouter: SearchUserViewRouterProtocol {
}
