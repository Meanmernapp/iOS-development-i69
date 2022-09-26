//
//  SearchUserFilterViewInterector.swift
//  i69
//
//  Created by The Mac Store on 26/04/2022.
//


import Foundation

protocol SearchUserFilterViewInteractorProtocol: AnyObject {
    func GetSearcedUsers(searchKey : String)
    
}

class SearchUserFilterViewInteractor {
    weak var presenter: SearchUserFilterViewPresenterProtocol?
}

extension SearchUserFilterViewInteractor: SearchUserFilterViewInteractorProtocol {
    func GetSearcedUsers(searchKey : String)
    {
        GraphQLClient.shared.fetchQuery(query: GetSearcedhUsersQuery(searchKey: searchKey)){(data,error)in
            self.presenter?.GetSearcedUserResponse(data: data, error: error)
        }
    }
}
