//
//  CompleteProfileViewInteractor.swift
//  i69
//
//  Created by The Mac Store on 14/04/2022.
//

import UIKit

protocol CompleteProfileViewInteractorProtocol: AnyObject {
    func completeProfile(photos : [UIImage])
}

class CompleteProfileViewInteractor {
    weak var presenter: CompleteProfileViewPresenterProtocol?
}

extension CompleteProfileViewInteractor: CompleteProfileViewInteractorProtocol {
    
    func completeProfile(photos : [UIImage])
    {
        let myGroup = DispatchGroup()
        for photo in photos
        {
            myGroup.enter()
            ApiClient.shared.uploadImage(image: photo, completion: {
                myGroup.leave()
            })
        }
        
        GraphQLClient.shared.performMutation(mutation: UpdateUserProfileMutation()) {(data , error) in
            self.presenter?.completeResponse(data: data?.data, error: error)
        }
        
    }
    
}
