//
//  IntrestedInteractor.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import Foundation

protocol IntrestedViewInteractorProtocol: AnyObject {
    
}

class IntrestedViewInteractor {
    weak var presenter: IntrestedViewPresenterProtocol?
}

extension IntrestedViewInteractor: IntrestedViewInteractorProtocol {
}

