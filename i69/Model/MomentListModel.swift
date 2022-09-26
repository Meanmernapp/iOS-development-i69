//
//  MomentListModel.swift
//  i69
//
//  Created by The Mac Store on 22/04/2022.
//

import UIKit

class MomentListModel
{
    var image : UIImage?
    var url : String?
    var file : String?
    var momentDescriptionPaginated : [String?]?
    var fullName : String?
    var createdDate : String?
    var likeCount : Int?
    var commentCount : Int?
    var fileType : String?
    var id: Int = -1
    var userID : String = ""
    init()
    {}
    init(edge : GetAllUserMomentsQuery.Data.AllUserMoment.Edge)
    {
        userID = edge.node?.user?.id ?? ""
        id = edge.node?.pk ?? 0
        url = edge.node?.user?.avatar?.url
        file = edge.node?.file
        momentDescriptionPaginated = edge.node?.momentDescriptionPaginated
        fullName = edge.node?.user?.fullName
        createdDate = edge.node?.createdDate
        likeCount = edge.node?.like
        commentCount = edge.node?.comment
    }
    init(edge : GetUserMomentsQuery.Data.AllUserMoment.Edge)
    {
        userID = edge.node?.id ?? ""
        url = edge.node?.user?.avatar?.url
        id = edge.node?.pk ?? 0
        file = edge.node?.file
        momentDescriptionPaginated = edge.node?.momentDescriptionPaginated
        fullName = edge.node?.user?.fullName
        createdDate = edge.node?.createdDate
        likeCount = edge.node?.like
        commentCount = edge.node?.comment
    }
    init(edge : GetAllUserStoriesQuery.Data.AllUserStory.Edge)
    {
        userID = edge.node?.id ?? ""
        url = edge.node?.user?.avatar?.url
        id = edge.node?.pk ?? 0
        file = edge.node?.file
        fileType = edge.node?.fileType
        fullName = edge.node?.user?.fullName
        createdDate = edge.node?.createdDate
        likeCount = edge.node?.likesCount
        commentCount = edge.node?.commentsCount
    }
}
