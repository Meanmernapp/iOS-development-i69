//
//  ApiClient.swift
//  i69
//
//  Created by The Mac Store on 18/04/2022.
//

import Foundation
import Apollo
import Alamofire
import UIKit


class ApiClient
{
    
    var authHeader: HTTPHeaders {
        
        let headers: HTTPHeaders = [
            "Content-Type": "application/json",
            "Authorization": "Token \(SignUpHelper.shared.token)"
//            "Authorization": "Token 0d0a6438564ec9525a5673eb270150d27703c613"
        ]
        return headers
    }
    static let shared = ApiClient()
    func uploadImage(image : UIImage,completion: @escaping ()  -> Void)
    {
        let url = "\(ApiKeys.baseUrl)api/user/\(SignUpHelper.shared.user.id)/photo/"
        
        let imgData = image.jpegData(compressionQuality: 0.7)!
        
        SessionManager.shared.session.upload(multipartFormData: { multipartFormData in
            //Parameter for Upload files
            multipartFormData.append(imgData, withName: "photo",fileName: "i69_filename.jpeg" , mimeType: "image/jpeg")
            
            
        }, to: url, method: .post,headers: authHeader
        ).responseString(completionHandler: {(response) in
            completion()
            
        })
    }
}

class SessionManager {
    static let shared = SessionManager()
    var session: Session

    init() {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 60
        session = Session.init(configuration: config, startRequestsImmediately: true)
    }
}
