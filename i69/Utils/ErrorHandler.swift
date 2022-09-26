//
//  ErrorHandler.swift
//  i69
//
//  Created by The Mac Store on 14/04/2022.
//

import Foundation
import Apollo

class ErrorHandler
{
    var userInfo = [String : Any]()
    init()
    {
        
    }
    init(errors : [GraphQLError])
    {
        for i in 0..<errors.count {
            let error = errors[i]
            userInfo["error\(i)"] = error.message ?? "Couldn't able to read error"
            print("uploadingerrors ---- \(error.message)")
            print("uploadingerrors ---- \(error.description)")
        }
    }
}
