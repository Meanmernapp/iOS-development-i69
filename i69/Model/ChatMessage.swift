//
//  ChatMessage.swift
//  i69
//
//  Created by The Mac Store on 01/05/2022.
//

import Foundation
import UIKit

class ChatMessage
{
    var id : String = ""
    var content : String = ""
    var timeStamp : String = ""
    var own : Bool = false
    var videoType : Bool = false
    
    
    init(content : String,timeStamp : String,own : Bool = true,videoType:Bool = false)
    {
        self.content = content
        self.timeStamp = timeStamp
        self.own = own
        self.videoType = videoType
    }
    
    init(message : GetChatMessagesByRoomIdQuery.Data.Message.Edge)
    {
        self.id = message.node?.id ?? ""
        self.content = message.node?.content ?? ""
        self.own = (message.node?.userId.id ?? "").compare(StorageHelper.shared.user?.id ?? "- -- ").rawValue == 0
        if verifyUrl(urlString: message.node?.content) {
            self.videoType = true
        }
        else {
            self.videoType = false
        }
        
        self.timeStamp = message.node?.timestamp ?? ""
    }
    func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
}
