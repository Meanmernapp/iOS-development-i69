//
//  UrlExtension.swift
//  i69
//
//  Created by The Mac Store on 13/04/2022.
//

import Foundation
extension URL {
  func params() -> [String:Any] {
    var dict = [String:Any]()

    if let components = URLComponents(url: self, resolvingAgainstBaseURL: false) {
      if let queryItems = components.queryItems {
        for item in queryItems {
          dict[item.name] = item.value!
        }
      }
      return dict
    } else {
      return [:]
    }
  }
}

extension NSURL {
    func params() -> [String:Any] {
        var dict = [String:Any]()
        
        if let components = NSURLComponents(string: self.absoluteURL?.absoluteString ?? "")
        {
            if let queryItems = components.queryItems
            {
                for item in queryItems
                {
                    dict[item.name] = item.value ?? ""
                }
            }
            return dict
        } else {
            return [:]
        }
    }
}
