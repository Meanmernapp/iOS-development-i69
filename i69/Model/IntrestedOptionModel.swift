//
//  IntrestedOptionModel.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import Foundation
class IntrestedOptionModel
{
    var id = 1
    var title = ""
    var man = false
    var woman = false
    
    init()
    {}
    init( title : String,id : Int)
    {
        self.id = id
        self.title = title
    }
}
