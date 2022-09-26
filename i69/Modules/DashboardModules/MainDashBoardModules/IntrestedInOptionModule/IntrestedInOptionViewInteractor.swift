//
//  DashboardViewInteractor.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//

import Foundation

protocol IntrestedInOptionViewInteractorProtocol: AnyObject {
    
}

class IntrestedInOptionViewInteractor {
    weak var presenter: IntrestedInOptionViewPresenterProtocol?
}

extension IntrestedInOptionViewInteractor: IntrestedInOptionViewInteractorProtocol {
}
