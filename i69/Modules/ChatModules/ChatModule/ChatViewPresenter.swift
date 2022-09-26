//
//  ChatViewPresenter.swift
//  i69
//
//  Created by The Mac Store on 30/04/2022.
//

import Foundation

protocol ChatViewPresenterProtocol: AnyObject {
    func sendChatMessage(message : String)
    func sendImageMessage(message : String)
    func sendVideoMessage(message : String)
    func sendChatMessageResponse(data : SendChatMessageMutationMutation.Data?,error : Error?)
    func sendImageResponse(data : SendChatMessageMutationMutation.Data?,error : Error?)
    func sendVideoResponse(data : SendChatMessageMutationMutation.Data?,error : Error?)
    func getChatMessagesByRoomId()
    func getChatMessageByRoomIdResponse(data : GetChatMessagesByRoomIdQuery.Data?,error : Error?)
}

class ChatViewPresenter {

    unowned var view: ChatViewControllerProtocol
    let router: ChatViewRouterProtocol?
    let interactor: ChatViewInteractorProtocol?

    init(interactor: ChatViewInteractorProtocol, router: ChatViewRouter, view: ChatViewControllerProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ChatViewPresenter: ChatViewPresenterProtocol {
    func sendImageMessage(message: String) {
        self.interactor?.sendImage(message: message)
    }
    
    func sendVideoMessage(message: String) {
        self.interactor?.sendVideo(message: message)
    }
    
    func sendVideoResponse(data: SendChatMessageMutationMutation.Data?, error: Error?) {
        self.view.sendVideoResponse(data: data, error: error)
    }
    
    func sendImageResponse(data: SendChatMessageMutationMutation.Data?, error: Error?) {
        self.view.sendImageResponse(data: data, error: error)
    }
    
    func sendChatMessage(message : String)
    {
        self.interactor?.sendChatMessage(message: message)
    }
    func sendChatMessageResponse(data : SendChatMessageMutationMutation.Data?,error : Error?)
    {
        self.view.sendChatMessageResponse(data: data, error: error)
    }
    func getChatMessagesByRoomId()
    {
        self.interactor?.getChatMessagesByRoomId()
    }
    func getChatMessageByRoomIdResponse(data : GetChatMessagesByRoomIdQuery.Data?,error : Error?)
    {
        self.view.getChatMessageByRoomIdResponse(data: data, error: error)
    }
}
