//
//  SharedPreference.swift
//  i69
//
//  Created by The Mac Store on 20/04/2022.
//

import Foundation
class SharedPreference
{
    
    static func getLoggedInUserId() -> String
    {
        
        let value = UserDefaults.standard.string(forKey:  "loggedInIUserd")
        
        return value ?? ""
    }
    static func removeLoggedInUserId()
    {
        UserDefaults.standard.removeObject(forKey: "loggedInIUserd")
    }
    
    static func setLoggedInUserId(_ value : String)
    {
        UserDefaults.standard.set(value, forKey: "loggedInIUserd")
    }
    static func getLoggedInUserToken() -> String
    {
        
        let value = UserDefaults.standard.string(forKey:  "loggedInIUseToken")
        
        return value ?? ""
    }
    
    
    static func setLoggedInUserToken(_ value : String)
    {
        UserDefaults.standard.set(value, forKey: "loggedInIUseToken")
    }
}

