//
//  AboutViewInteractor.swift
//  i69
//
//  Created by The Mac Store on 13/04/2022.
//

import Foundation

protocol AboutViewInteractorProtocol: AnyObject {
    
}

class AboutViewInteractor {
    weak var presenter: AboutViewPresenterProtocol?
}

extension AboutViewInteractor: AboutViewInteractorProtocol {
}
