//
//  SearchUserFeedViewInterector.swift
//  i69
//
//  Created by The Mac Store on 28/04/2022.
//

import Foundation
import UIKit

protocol SearchUserFeedViewInteractorProtocol: AnyObject {
    func getUserMoments()
    
}

class SearchUserFeedViewInteractor {
    var momentEndCursor = ""
    weak var presenter: SearchUserFeedViewPresenterProtocol?
}

extension SearchUserFeedViewInteractor: SearchUserFeedViewInteractorProtocol {
    func getUserMoments() {
        getUserMomentsCall()
    }
    func getUserMomentsCall(firstTime : Bool = true)
    {
        GraphQLClient.shared.fetchQuery(query: GetUserMomentsQuery(width: Int(UIScreen.main.bounds.width), characterSize: 10, first: 10, after: momentEndCursor, user_Id: ProfileStorageHelper.shared.user?.id ?? "", pk: ""))
        {(data,error) in
            
            
            if (data == nil && firstTime)
            {
                self.getUserMomentsCall(firstTime: false)
                return
            }
            
            self.presenter?.getUserMomentsResponse(data: data, error: error)
            self.momentEndCursor = data?.allUserMoments?.pageInfo.endCursor ?? ""
        }
    }
}
