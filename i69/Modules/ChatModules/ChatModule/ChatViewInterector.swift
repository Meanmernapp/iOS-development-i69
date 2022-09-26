//
//  ChatViewInterector.swift
//  i69
//
//  Created by The Mac Store on 30/04/2022.
//

import Foundation
import UIKit

protocol ChatViewInteractorProtocol: AnyObject {
    func sendChatMessage(message : String)
    func sendImage(message : String)
    func sendVideo(message : String)
    func getChatMessagesByRoomId()
}

class ChatViewInteractor {
    weak var presenter: ChatViewPresenterProtocol?
}

extension ChatViewInteractor: ChatViewInteractorProtocol {
    func sendChatMessage(message : String)
    {
        GraphQLClient.shared.performMutation(mutation: SendChatMessageMutationMutation(msg: message, roomID: ProfileStorageHelper.shared.newChatId))
        {(data,error) in
            self.presenter?.sendChatMessageResponse(data: data?.data, error: error)
        }
    }
    func sendImage(message : String)
    {
        GraphQLClient.shared.performMutation(mutation: SendChatMessageMutationMutation(msg: message, roomID: ProfileStorageHelper.shared.newChatId))
        {(data,error) in
            self.presenter?.sendImageResponse(data: data?.data, error: error)
        }
    }
    func sendVideo(message : String)
    {
        GraphQLClient.shared.performMutation(mutation: SendChatMessageMutationMutation(msg: message, roomID: ProfileStorageHelper.shared.newChatId))
        {(data,error) in
            self.presenter?.sendVideoResponse(data: data?.data, error: error)
        }
    }
    func getChatMessagesByRoomId()
    {
        GraphQLClient.shared.fetchQuery(query: GetChatMessagesByRoomIdQuery(roomID: "\(ProfileStorageHelper.shared.newChatId)", last: 99))
        {(data,error) in
            self.presenter?.getChatMessageByRoomIdResponse(data: data, error: error)
            
        }
    }
}
