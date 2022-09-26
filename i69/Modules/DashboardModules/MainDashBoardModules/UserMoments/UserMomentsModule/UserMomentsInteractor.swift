//
//  UserMomentsInteractor.swift
//  i69
//
//  Created by The Mac Store on 21/04/2022.
//


import Foundation
import UIKit

protocol UserMomentsViewInteractorProtocol: AnyObject {
    func getUserMoments()
    func getUserStories()
    
}

class UserMomentsViewInteractor {
    var momentEndCursor = ""
    var storyEndCursor = ""
    weak var presenter: UserMomentsViewPresenterProtocol?
}

extension UserMomentsViewInteractor: UserMomentsViewInteractorProtocol {
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
    func getUserStories()
    {
        GraphQLClient.shared.fetchQuery(query: GetAllUserStoriesQuery(first: 10, after: "", pk: ""))
        {(data,error) in
//            self.storyEndCursor = data?.allUserStories?.pageInfo.endCursor ?? ""
            self.presenter?.getUserStoriesResponse(data: data, error: error)
        }
    }
}
