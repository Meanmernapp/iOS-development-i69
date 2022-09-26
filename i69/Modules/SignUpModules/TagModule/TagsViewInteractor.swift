//
//  TagsViewInteractor.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import Foundation

protocol TagsViewInteractorProtocol: AnyObject {
    
    func fetchDefaultPickers()
    
}

class TagsViewInteractor {
    weak var presenter: TagsViewPresenterProtocol?
}

extension TagsViewInteractor: TagsViewInteractorProtocol {
    
    func fetchDefaultPickers()
    {
        GraphQLClient.shared.fetchQuery(query: PickersQuery()){(data,error)in
            
            self.presenter?.fetchDefaultPickerResponse(data: data, error: error)
        }
    }
}
