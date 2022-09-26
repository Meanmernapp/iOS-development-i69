//
//  TagsModel.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

class TagsModel
{
    var id : Int = 0
    var title = ""
    var selected = false
    var rowCount = 2
    
    init()
    {}
    init(id : Int, title : String,rowCount : Int = 2)
    {
        self.id = id
        self.title = title
        self.rowCount = rowCount
    }
}
