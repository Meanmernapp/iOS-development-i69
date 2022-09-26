// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// An enumeration.

public final class GetUserMomentsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUserMoments($width: Int!, $characterSize: Int!, $first: Int!, $after: String!, $user_Id: UUID!, $pk: String!) {
      allUserMoments(after: $after, first: $first, user_Id: $user_Id, pk: $pk) {
        __typename
        edges {
          __typename
          cursor
          cursor
          node {
            __typename
            pk
            comment
            createdDate
            file
            id
            like
            momentDescription
            momentDescriptionPaginated(width: $width, characterSize: $characterSize)
            user {
              __typename
              id
              email
              fullName
              username
              gender
              email
              avatar {
                __typename
                url
                id
                user
              }
              onesignalPlayerId
              avatarPhotos {
                __typename
                url
                id
                user
              }
            }
          }
        }
        pageInfo {
          __typename
          endCursor
          hasNextPage
          hasPreviousPage
          startCursor
        }
      }
    }
    """

  public let operationName: String = "GetUserMoments"

  public var width: Int
  public var characterSize: Int
  public var first: Int
  public var after: String
  public var user_Id: String
  public var pk: String

  public init(width: Int, characterSize: Int, first: Int, after: String, user_Id: String, pk: String) {
    self.width = width
    self.characterSize = characterSize
    self.first = first
    self.after = after
    self.user_Id = user_Id
    self.pk = pk
  }

  public var variables: GraphQLMap? {
    return ["width": width, "characterSize": characterSize, "first": first, "after": after, "user_Id": user_Id, "pk": pk]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allUserMoments", arguments: ["after": GraphQLVariable("after"), "first": GraphQLVariable("first"), "user_Id": GraphQLVariable("user_Id"), "pk": GraphQLVariable("pk")], type: .object(AllUserMoment.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allUserMoments: AllUserMoment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "allUserMoments": allUserMoments.flatMap { (value: AllUserMoment) -> ResultMap in value.resultMap }])
    }

    public var allUserMoments: AllUserMoment? {
      get {
        return (resultMap["allUserMoments"] as? ResultMap).flatMap { AllUserMoment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "allUserMoments")
      }
    }

    public struct AllUserMoment: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["MomentsTypsConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?], pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "MomentsTypsConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Contains the nodes in this connection.
      public var edges: [Edge?] {
        get {
          return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      /// Pagination data for this connection.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MomentsTypsEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
            GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(cursor: String, node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "MomentsTypsEdge", "cursor": cursor, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A cursor for use in pagination
        public var cursor: String {
          get {
            return resultMap["cursor"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "cursor")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MomentsTyps"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("pk", type: .scalar(Int.self)),
              GraphQLField("comment", type: .scalar(Int.self)),
              GraphQLField("createdDate", type: .nonNull(.scalar(String.self))),
              GraphQLField("file", type: .scalar(String.self)),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("like", type: .scalar(Int.self)),
              GraphQLField("momentDescription", type: .nonNull(.scalar(String.self))),
              GraphQLField("momentDescriptionPaginated", arguments: ["width": GraphQLVariable("width"), "characterSize": GraphQLVariable("characterSize")], type: .list(.scalar(String.self))),
              GraphQLField("user", type: .object(User.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(pk: Int? = nil, comment: Int? = nil, createdDate: String, file: String? = nil, id: GraphQLID, like: Int? = nil, momentDescription: String, momentDescriptionPaginated: [String?]? = nil, user: User? = nil) {
            self.init(unsafeResultMap: ["__typename": "MomentsTyps", "pk": pk, "comment": comment, "createdDate": createdDate, "file": file, "id": id, "like": like, "momentDescription": momentDescription, "momentDescriptionPaginated": momentDescriptionPaginated, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

          public var comment: Int? {
            get {
              return resultMap["comment"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "comment")
            }
          }

          public var createdDate: String {
            get {
              return resultMap["createdDate"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdDate")
            }
          }

          public var file: String? {
            get {
              return resultMap["file"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "file")
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

          public var like: Int? {
            get {
              return resultMap["like"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "like")
            }
          }

          public var momentDescription: String {
            get {
              return resultMap["momentDescription"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "momentDescription")
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
                GraphQLField("email", type: .nonNull(.scalar(String.self))),
                GraphQLField("fullName", type: .nonNull(.scalar(String.self))),
                GraphQLField("username", type: .nonNull(.scalar(String.self))),
                GraphQLField("gender", type: .scalar(UserGender.self)),
                GraphQLField("email", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .object(Avatar.selections)),
                GraphQLField("onesignalPlayerId", type: .scalar(String.self)),
                GraphQLField("avatarPhotos", type: .nonNull(.list(.nonNull(.object(AvatarPhoto.selections))))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String, email: String, fullName: String, username: String, gender: UserGender? = nil, avatar: Avatar? = nil, onesignalPlayerId: String? = nil, avatarPhotos: [AvatarPhoto]) {
              self.init(unsafeResultMap: ["__typename": "UserTypeone", "id": id, "email": email, "fullName": fullName, "username": username, "gender": gender, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }, "onesignalPlayerId": onesignalPlayerId, "avatarPhotos": avatarPhotos.map { (value: AvatarPhoto) -> ResultMap in value.resultMap }])
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

            public var email: String {
              get {
                return resultMap["email"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "email")
              }
            }

            public var fullName: String {
              get {
                return resultMap["fullName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "fullName")
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

            public var gender: UserGender? {
              get {
                return resultMap["gender"] as? UserGender
              }
              set {
                resultMap.updateValue(newValue, forKey: "gender")
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

            public var onesignalPlayerId: String? {
              get {
                return resultMap["onesignalPlayerId"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "onesignalPlayerId")
              }
            }

            public var avatarPhotos: [AvatarPhoto] {
              get {
                return (resultMap["avatarPhotos"] as! [ResultMap]).map { (value: ResultMap) -> AvatarPhoto in AvatarPhoto(unsafeResultMap: value) }
              }
              set {
                resultMap.updateValue(newValue.map { (value: AvatarPhoto) -> ResultMap in value.resultMap }, forKey: "avatarPhotos")
              }
            }

            public struct Avatar: GraphQLSelectionSet {
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
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("endCursor", type: .scalar(String.self)),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("startCursor", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(endCursor: String? = nil, hasNextPage: Bool, hasPreviousPage: Bool, startCursor: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "endCursor": endCursor, "hasNextPage": hasNextPage, "hasPreviousPage": hasPreviousPage, "startCursor": startCursor])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }

        /// When paginating backwards, are there more items?
        public var hasPreviousPage: Bool {
          get {
            return resultMap["hasPreviousPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasPreviousPage")
          }
        }

        /// When paginating backwards, the cursor to continue.
        public var startCursor: String? {
          get {
            return resultMap["startCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "startCursor")
          }
        }
      }
    }
  }
}
