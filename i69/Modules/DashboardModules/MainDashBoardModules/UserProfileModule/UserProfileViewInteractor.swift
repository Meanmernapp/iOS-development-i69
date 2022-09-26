//
//  UserProfileViewInteractor.swift
//  i69
//
//  Created by The Mac Store on 21/04/2022.
//

import Foundation

protocol UserProfileViewInteractorProtocol: AnyObject {
    
}

class UserProfileViewInteractor {
    weak var presenter: UserProfileViewPresenterProtocol?
}

extension UserProfileViewInteractor: UserProfileViewInteractorProtocol {
}
