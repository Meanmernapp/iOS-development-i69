//
//  LoginInteractor.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import Foundation
import Apollo

protocol LoginViewInteractorProtocol: AnyObject {
    func socialLoginQL(authToken : String,accessVerifier : String,provider : String)
    
}

class LoginViewInteractor {
    weak var presenter: LoginViewPresenterProtocol?
}

extension LoginViewInteractor: LoginViewInteractorProtocol {
    func socialLoginQL(authToken : String,accessVerifier : String,provider : String)
    {
        
        GraphQLClient.shared.performMutation(mutation: LoginUserMutation(accessToken: authToken, accessVerifier: accessVerifier, provider: provider)) {(data , error) in
            self.presenter?.socialLoginResponse(data: data?.data, error: error)
        }
    }
    
}
