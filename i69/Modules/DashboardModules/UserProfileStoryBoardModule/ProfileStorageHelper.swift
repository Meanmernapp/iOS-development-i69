//
//  ProfileStorageHelper.swift
//  i69
//
//  Created by The Mac Store on 27/04/2022.
//

import UIKit

class ProfileStorageHelper
{
    static let shared = StorageHelper()
    var user : GetUserProfileByIdQuery.Data.User?
    
}
//class ProfileUser
//{
//    var avatarPhotos : [AvatarPhoto]?
//    var age : Int?
//    var height : Int?
//    init()
//    {}
//    func updateAvatarPhotos(avatars : [GetUserProfileByIdQuery.Data.User.AvatarPhoto?]?)
//    {
//        if let photos = avatars {
//            for photo in photos {
//                self.avatarPhotos?.append(AvatarPhoto(id: photo?.id ?? "", url: photo?.url ?? ""))
//            }
//        }
//    }
//}
//
//class AvatarPhoto
//{
//    var id : String?
//    var url : String?
//    init(id : String,url : String)
//    {
//        self.id = id
//        self.url = url
//    }
//}
class Global {
    
    class var shared : Global {
        struct Static {
            static let instance : Global = Global()
        }
        return Static.instance
    }
    
    var shareString = "BJJHQ"
    var shareUrl = "Link for the app"
    
    //MARK: - Notifications
    var viewController : [UIViewController]?
}
