//
//  ChatListViewRouter.swift
//  i69
//
//  Created by The Mac Store on 30/04/2022.
//

import Foundation
import UIKit

protocol ChatListViewRouterProtocol: AnyObject {
}

class ChatListViewRouter: NSObject {

    weak var presenter: ChatListViewPresenterProtocol?

    static func setupModule() -> ChatListViewController {
        
        
        let controller = ChatListViewController()
        let interactor = ChatListViewInteractor()
        let router = ChatListViewRouter()
         
        let presenter = ChatListViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension ChatListViewRouter: ChatListViewRouterProtocol {
}

