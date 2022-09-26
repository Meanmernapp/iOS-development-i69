//
//  IntrestOptionInteractor.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//

import Foundation

protocol IntrestOptionInteractorProtocol: AnyObject {
    
}

class IntrestOptionInteractor {
    weak var presenter: IntrestOptionPresenterProtocol?
}

extension IntrestOptionInteractor: IntrestOptionInteractorProtocol {
}
