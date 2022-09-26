//
//  SearchUserViewInterector.swift
//  i69
//
//  Created by The Mac Store on 28/04/2022.
//

import Foundation
import UIKit

protocol SearchUserViewInteractorProtocol: AnyObject {
    func getUserMoments()
    
}

class SearchUserViewInteractor {
    var momentEndCursor = ""
    weak var presenter: SearchUserViewPresenterProtocol?
}

extension SearchUserViewInteractor: SearchUserViewInteractorProtocol {
    func getUserMoments() {
        getUserMomentsCall()
    }
    func getUserMomentsCall(firstTime : Bool = true)
    {
        GraphQLClient.shared.fetchQuery(query: GetAllUserMomentsQuery(width: Int(UIScreen.main.bounds.width), characterSize: 10, first: 10, after: momentEndCursor, pk: ""))
        {(data,error) in
            
            print("response-moment --- \(data?.allUserMoments?.edges.count)")
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
