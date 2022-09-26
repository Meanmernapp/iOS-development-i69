//
//  ChatListViewInterector.swift
//  i69
//
//  Created by The Mac Store on 30/04/2022.
//

import Foundation
import UIKit

protocol ChatListViewInteractorProtocol: AnyObject {
    
    func getUserChatList()
}

class ChatListViewInteractor {
    weak var presenter: ChatListViewPresenterProtocol?
}

extension ChatListViewInteractor: ChatListViewInteractorProtocol {
    
    func getUserChatList()
    {
        print(StorageHelper.shared.user?.id ?? "")
        GraphQLClient.shared.fetchQuery(query: GetAllRoomsQuery(first: 30))
        {(data,error) in
            self.presenter?.getUserChatListResponse(data: data, error: error)
            
        }
    }
}
