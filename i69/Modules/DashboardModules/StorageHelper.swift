//
//  StorageHelper.swift
//  i69
//
//  Created by The Mac Store on 20/04/2022.
//

import UIKit

class StorageHelper
{
    static let shared = StorageHelper()
    var user : GetUserProfileByIdQuery.Data.User?
    var userImage = UIImage()
    var searchDataSet = [CompleteProfileDataSet]()
    var selectedInterestId = -1
    var interestId = -1
    var minHeight : Int = 143
    var maxHeight : Int = 247
    var minAge : Int = 18
    var maxAge : Int = 50
    var newChatId : Int = -1
    var optionsId = [String :Int]()
    var random = [SearchUser]()
    var popular = [SearchUser]()
    var data : GetSearcedhUsersQuery.Data?
    func setSearchedData(data : GetSearcedhUsersQuery.Data)
    {
        self.data = data
        random = [SearchUser]()
        popular = [SearchUser]()
        for _ in 0..<1
        {
            if let searchedUser = data.randomUsers
            {
                for user in searchedUser {
                    if let usr = user
                    {
                        self.random.append(SearchUser(id: usr.id ?? "", name: usr.fullName ?? "", age: usr.age ?? 0, url: "\((usr.avatarPhotos?.count ?? 0) > 0 ? usr.avatarPhotos?[0]?.url ?? "" : "")"))
                    }
                }
            }
            if let searchedUser = data.popularUsers
            {
                for user in searchedUser {
                    if let usr = user
                    {
                        self.popular.append(SearchUser(id: usr.id ?? "", name: usr.fullName ?? "", age: usr.age ?? 0, url: "\((usr.avatarPhotos?.count ?? 0) > 0 ? usr.avatarPhotos?[0]?.url ?? "" : "")"))
                    }
                }
            }
        }
        
    }
    func getUserById(id : String) -> GetUserProfileByIdQuery.Data.User?
    {
        if let searchedUser = data?.randomUsers
        {
            for user in searchedUser {
                if (user?.id ?? "").compare(id).rawValue == 0
                {
                    return user
                }
            }
        }
        
        if let searchedUser = data?.popularUsers
        {
            for user in searchedUser {
                if (user?.id ?? "").compare(id).rawValue == 0
                {
                    return user
                }
            }
        }
        
        return nil
    }
}
class SearchUser
{
    var id : String = ""
    var name : String = ""
    var age : Int = 0
    var url : String = ""
    init(id : String,name : String,age : Int,url : String)
    {
        self.id = id
        self.age = age
        self.name = name
        self.url = url
    }
}
