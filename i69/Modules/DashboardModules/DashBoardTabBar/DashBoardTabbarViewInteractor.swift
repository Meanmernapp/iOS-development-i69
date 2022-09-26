//
//  DashBoardTabbarViewInteractor.swift
//  i69
//
//  Created by The Mac Store on 20/04/2022.
//

import Foundation

protocol DashBoardTabbarViewInteractorProtocol: AnyObject {
    func updateOnLineStatus()
    func getUserProfileById()
    func fetchDefaultPickers()
    
}

class DashBoardTabbarViewInteractor {
    weak var presenter: DashBoardTabbarViewPresenterProtocol?
}

extension DashBoardTabbarViewInteractor: DashBoardTabbarViewInteractorProtocol {
    func fetchDefaultPickers()
    {
        GraphQLClient.shared.fetchQuery(query: PickersQuery()){(data,error)in
            
            self.presenter?.fetchDefaultPickerResponse(data: data, error: error)
        }
    }
    func updateOnLineStatus()
    {
        GraphQLClient.shared.performMutation(mutation: UpdateUserOnlineStatusMutation(id: SharedPreference.getLoggedInUserId(), isOnline: true))
        {(data,error) in
            
        }
    }
    func getUserProfileById()
    {
        GraphQLClient.shared.fetchQuery(query: GetUserProfileByIdQuery(id: SharedPreference.getLoggedInUserId()))
        {(data,error) in
            self.presenter?.getUserProfileByIdResponse(data: data, error: error)
            
        }
    }
}
