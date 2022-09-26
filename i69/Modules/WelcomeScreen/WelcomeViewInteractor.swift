//
//  WelcomeViewInteractor.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//


import Foundation

protocol WelcomeViewInteractorProtocol: AnyObject {
    
}

class WelcomeViewInteractor {
    weak var presenter: WelcomeViewPresenterProtocol?
}

extension WelcomeViewInteractor: WelcomeViewInteractorProtocol {
}
