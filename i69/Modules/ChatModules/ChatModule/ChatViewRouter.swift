//
//  ChatViewRouter.swift
//  i69
//
//  Created by The Mac Store on 30/04/2022.
//

import Foundation
import UIKit

protocol ChatViewRouterProtocol: AnyObject {
}

class ChatViewRouter: NSObject {

    weak var presenter: ChatViewPresenterProtocol?

    static func setupModule() -> ChatViewController {
        
        
        let controller = ChatViewController()
        let interactor = ChatViewInteractor()
        let router = ChatViewRouter()
         
        let presenter = ChatViewPresenter(interactor: interactor, router: router, view: controller)

        controller.presenter = presenter
        router.presenter = presenter
        interactor.presenter = presenter
        return controller
    }
}

extension ChatViewRouter: ChatViewRouterProtocol {
}

