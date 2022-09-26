//
//  SearchUserFeedViewRouter.swift
//  i69
//
//  Created by The Mac Store on 28/04/2022.
//

import Foundation
import UIKit

protocol SearchUserFeedViewRouterProtocol: AnyObject {
}

class SearchUserFeedViewRouter: NSObject {

    weak var presenter: SearchUserFeedViewPresenterProtocol?

    static func setupModule(pagerMainController : ProfilePageViewController) -> SearchUserFeedViewController {
        
        
        let controller = UIStoryboard.init(name: "UserProfile", bundle: Bundle.main).instantiateViewController(withIdentifier: "SearchUserFeedViewController") as! SearchUserFeedViewController
        let interactor = SearchUserFeedViewInteractor()
        let router = SearchUserFeedViewRouter()
         
        let presenter = SearchUserFeedViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        controller.pagerMainController = pagerMainController
        return controller
    }
}

extension SearchUserFeedViewRouter: SearchUserFeedViewRouterProtocol {
}
