// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class FetchCommentQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query FetchComment($momentID: String!) {
      allComments(momentId: $momentID) {
        __typename
        like
        user {
          __typename
          id
          avatar {
            __typename
            id
            url
            user
          }
          username
          fullName
          avatarPhotos {
            __typename
            url
            id
            user
          }
        }
        id
        pk
        commentDescription
        createdDate
        replys {
          __typename
          id
          user {
            __typename
            id
            username
            fullName
            avatarPhotos {
              __typename
              url
              id
              user
            }
          }
          commentDescription
          createdDate
          momemt {
            __typename
            pk
            like
            comment
            momentDescriptionPaginated
            user {
              __typename
              id
              username
            }
          }
        }
      }
    }
    """

  public let operationName: String = "FetchComment"

  public var momentID: String

  public init(momentID: String) {
    self.momentID = momentID
  }

  public var variables: GraphQLMap? {
    return ["momentID": momentID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allComments", arguments: ["momentId": GraphQLVariable("momentID")], type: .list(.object(AllComment.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allComments: [AllComment?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "allComments": allComments.flatMap { (value: [AllComment?]) -> [ResultMap?] in value.map { (value: AllComment?) -> ResultMap? in value.flatMap { (value: AllComment) -> ResultMap in value.resultMap } } }])
    }

    public var allComments: [AllComment?]? {
      get {
        return (resultMap["allComments"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AllComment?] in value.map { (value: ResultMap?) -> AllComment? in value.flatMap { (value: ResultMap) -> AllComment in AllComment(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [AllComment?]) -> [ResultMap?] in value.map { (value: AllComment?) -> ResultMap? in value.flatMap { (value: AllComment) -> ResultMap in value.resultMap } } }, forKey: "allComments")
      }
    }

    public struct AllComment: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CommentType"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("like", type: .scalar(Int.self)),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("pk", type: .scalar(Int.self)),
          GraphQLField("commentDescription", type: .nonNull(.scalar(String.self))),
          GraphQLField("createdDate", type: .scalar(String.self)),
          GraphQLField("replys", type: .list(.object(Reply.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(like: Int? = nil, user: User, id: GraphQLID, pk: Int? = nil, commentDescription: String, createdDate: String? = nil, replys: [Reply?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "CommentType", "like": like, "user": user.resultMap, "id": id, "pk": pk, "commentDescription": commentDescription, "createdDate": createdDate, "replys": replys.flatMap { (value: [Reply?]) -> [ResultMap?] in value.map { (value: Reply?) -> ResultMap? in value.flatMap { (value: Reply) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var like: Int? {
        get {
          return resultMap["like"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "like")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      /// The ID of the object.
      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var pk: Int? {
        get {
          return resultMap["pk"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "pk")
        }
      }

      public var commentDescription: String {
        get {
          return resultMap["commentDescription"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "commentDescription")
        }
      }

      public var createdDate: String? {
        get {
          return resultMap["createdDate"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdDate")
        }
      }

      public var replys: [Reply?]? {
        get {
          return (resultMap["replys"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Reply?] in value.map { (value: ResultMap?) -> Reply? in value.flatMap { (value: ResultMap) -> Reply in Reply(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Reply?]) -> [ResultMap?] in value.map { (value: Reply?) -> ResultMap? in value.flatMap { (value: Reply) -> ResultMap in value.resultMap } } }, forKey: "replys")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(String.self)),
            GraphQLField("avatar", type: .object(Avatar.selections)),
            GraphQLField("username", type: .scalar(String.self)),
            GraphQLField("fullName", type: .scalar(String.self)),
            GraphQLField("avatarPhotos", type: .list(.object(AvatarPhoto.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String? = nil, avatar: Avatar? = nil, username: String? = nil, fullName: String? = nil, avatarPhotos: [AvatarPhoto?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserType", "id": id, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }, "username": username, "fullName": fullName, "avatarPhotos": avatarPhotos.flatMap { (value: [AvatarPhoto?]) -> [ResultMap?] in value.map { (value: AvatarPhoto?) -> ResultMap? in value.flatMap { (value: AvatarPhoto) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String? {
          get {
            return resultMap["id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var avatar: Avatar? {
          get {
            return (resultMap["avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "avatar")
          }
        }

        public var username: String? {
          get {
            return resultMap["username"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "username")
          }
        }

        public var fullName: String? {
          get {
            return resultMap["fullName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "fullName")
          }
        }

        public var avatarPhotos: [AvatarPhoto?]? {
          get {
            return (resultMap["avatarPhotos"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AvatarPhoto?] in value.map { (value: ResultMap?) -> AvatarPhoto? in value.flatMap { (value: ResultMap) -> AvatarPhoto in AvatarPhoto(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [AvatarPhoto?]) -> [ResultMap?] in value.map { (value: AvatarPhoto?) -> ResultMap? in value.flatMap { (value: AvatarPhoto) -> ResultMap in value.resultMap } } }, forKey: "avatarPhotos")
          }
        }

        public struct Avatar: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["UserPhotoType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("url", type: .scalar(String.self)),
              GraphQLField("user", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, url: String? = nil, user: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "UserPhotoType", "id": id, "url": url, "user": user])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var url: String? {
            get {
              return resultMap["url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }

          public var user: String? {
            get {
              return resultMap["user"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "user")
            }
          }
        }

        public struct AvatarPhoto: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["UserPhotoType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .scalar(String.self)),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("user", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(url: String? = nil, id: GraphQLID, user: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "UserPhotoType", "url": url, "id": id, "user": user])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var url: String? {
            get {
              return resultMap["url"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "url")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var user: String? {
            get {
              return resultMap["user"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "user")
            }
          }
        }
      }

      public struct Reply: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ReplyType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("user", type: .nonNull(.object(User.selections))),
            GraphQLField("commentDescription", type: .nonNull(.scalar(String.self))),
            GraphQLField("createdDate", type: .scalar(String.self)),
            GraphQLField("momemt", type: .nonNull(.object(Momemt.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, user: User, commentDescription: String, createdDate: String? = nil, momemt: Momemt) {
          self.init(unsafeResultMap: ["__typename": "ReplyType", "id": id, "user": user.resultMap, "commentDescription": commentDescription, "createdDate": createdDate, "momemt": momemt.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var user: User {
          get {
            return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "user")
          }
        }

        public var commentDescription: String {
          get {
            return resultMap["commentDescription"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "commentDescription")
          }
        }

        public var createdDate: String? {
          get {
            return resultMap["createdDate"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "createdDate")
          }
        }

        public var momemt: Momemt {
          get {
            return Momemt(unsafeResultMap: resultMap["momemt"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "momemt")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["UserType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("username", type: .scalar(String.self)),
              GraphQLField("fullName", type: .scalar(String.self)),
              GraphQLField("avatarPhotos", type: .list(.object(AvatarPhoto.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, username: String? = nil, fullName: String? = nil, avatarPhotos: [AvatarPhoto?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "UserType", "id": id, "username": username, "fullName": fullName, "avatarPhotos": avatarPhotos.flatMap { (value: [AvatarPhoto?]) -> [ResultMap?] in value.map { (value: AvatarPhoto?) -> ResultMap? in value.flatMap { (value: AvatarPhoto) -> ResultMap in value.resultMap } } }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String? {
            get {
              return resultMap["id"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var username: String? {
            get {
              return resultMap["username"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "username")
            }
          }

          public var fullName: String? {
            get {
              return resultMap["fullName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "fullName")
            }
          }

          public var avatarPhotos: [AvatarPhoto?]? {
            get {
              return (resultMap["avatarPhotos"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AvatarPhoto?] in value.map { (value: ResultMap?) -> AvatarPhoto? in value.flatMap { (value: ResultMap) -> AvatarPhoto in AvatarPhoto(unsafeResultMap: value) } } }
            }
            set {
              resultMap.updateValue(newValue.flatMap { (value: [AvatarPhoto?]) -> [ResultMap?] in value.map { (value: AvatarPhoto?) -> ResultMap? in value.flatMap { (value: AvatarPhoto) -> ResultMap in value.resultMap } } }, forKey: "avatarPhotos")
            }
          }

          public struct AvatarPhoto: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["UserPhotoType"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("url", type: .scalar(String.self)),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("user", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(url: String? = nil, id: GraphQLID, user: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "UserPhotoType", "url": url, "id": id, "user": user])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var url: String? {
              get {
                return resultMap["url"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var user: String? {
              get {
                return resultMap["user"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "user")
              }
            }
          }
        }

        public struct Momemt: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MomentsTyps"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("pk", type: .scalar(Int.self)),
              GraphQLField("like", type: .scalar(Int.self)),
              GraphQLField("comment", type: .scalar(Int.self)),
              GraphQLField("momentDescriptionPaginated", type: .list(.scalar(String.self))),
              GraphQLField("user", type: .object(User.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(pk: Int? = nil, like: Int? = nil, comment: Int? = nil, momentDescriptionPaginated: [String?]? = nil, user: User? = nil) {
            self.init(unsafeResultMap: ["__typename": "MomentsTyps", "pk": pk, "like": like, "comment": comment, "momentDescriptionPaginated": momentDescriptionPaginated, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var pk: Int? {
            get {
              return resultMap["pk"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "pk")
            }
          }

          public var like: Int? {
            get {
              return resultMap["like"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "like")
            }
          }

          public var comment: Int? {
            get {
              return resultMap["comment"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "comment")
            }
          }

          public var momentDescriptionPaginated: [String?]? {
            get {
              return resultMap["momentDescriptionPaginated"] as? [String?]
            }
            set {
              resultMap.updateValue(newValue, forKey: "momentDescriptionPaginated")
            }
          }

          public var user: User? {
            get {
              return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["UserTypeone"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(String.self))),
                GraphQLField("username", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String, username: String) {
              self.init(unsafeResultMap: ["__typename": "UserTypeone", "id": id, "username": username])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String {
              get {
                return resultMap["id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.
            public var username: String {
              get {
                return resultMap["username"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "username")
              }
            }
          }
        }
      }
    }
  }
}
