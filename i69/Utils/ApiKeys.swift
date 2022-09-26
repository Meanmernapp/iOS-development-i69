//
//  ApiKeys.swift
//  i69
//
//  Created by The Mac Store on 12/04/2022.
//

import Foundation
import UIKit


class ApiKeys
{
    static let baseUrl = "https://api.chatadmin-mod.click/"
    
    static let twitterCallBackUrl = "/signin-twitter"
    static let googleSignInApiKey = "253903520856-frm12or9jt342ku7fvbom08mosvied7m.apps.googleusercontent.com"    
    static let twitterAuthUrl = "\(baseUrl)auth/twitter/redirect"
}
class ScreenSizeValues
{
    static var statusBarHeight : CGFloat = 0
}
enum LoginProvide: String
{
    case fbProvide = "facebook-oauth2"
    case twitterProvide = "twitter-oauth"
    case googleProvider = "google-oauth2"
}
