//
//  ChatListViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 30/04/2022.
//

import Foundation

protocol ChatListViewPresenterProtocol: AnyObject {
    func getUserChatList()
    func getUserChatListResponse(data : GetAllRoomsQuery.Data?,error : Error?)
}

class ChatListViewPresenter {

    unowned var view: ChatListViewControllerProtocol
    let router: ChatListViewRouterProtocol?
    let interactor: ChatListViewInteractorProtocol?

    init(interactor: ChatListViewInteractorProtocol, router: ChatListViewRouter, view: ChatListViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ChatListViewPresenter: ChatListViewPresenterProtocol {
    func getUserChatList()
    {
        self.interactor?.getUserChatList()
    }
    func getUserChatListResponse(data : GetAllRoomsQuery.Data?,error : Error?)
    {
        self.view.getUserChatListResponse(data: data, error: error)
    }
}
