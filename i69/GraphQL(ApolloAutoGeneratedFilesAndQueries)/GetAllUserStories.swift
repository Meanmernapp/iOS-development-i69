// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetAllUserStoriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllUserStories($first: Int!, $after: String!, $pk: String!) {
      allUserStories(after: $after, first: $first, pk: $pk) {
        __typename
        edges {
          __typename
          cursor
          node {
            __typename
            createdDate
            file
            fileType
            id
            pk
            thumbnail
            commentsCount
            comments {
              __typename
              pageInfo {
                __typename
                endCursor
                hasNextPage
                hasPreviousPage
                startCursor
              }
              edges {
                __typename
                cursor
                node {
                  __typename
                  id
                  pk
                  createdDate
                  commentDescription
                  objectId
                  pk
                  user {
                    __typename
                    id
                    fullName
                    avatarIndex
                    avatarPhotos {
                      __typename
                      url
                      id
                    }
                    avatar {
                      __typename
                      id
                      url
                    }
                  }
                }
              }
            }
            likesCount
            likes {
              __typename
              pageInfo {
                __typename
                endCursor
                hasNextPage
                hasPreviousPage
                startCursor
              }
              edges {
                __typename
                cursor
                node {
                  __typename
                  id
                  pk
                  objectId
                  user {
                    __typename
                    id
                    fullName
                    avatarIndex
                    avatarPhotos {
                      __typename
                      url
                      id
                    }
                    avatar {
                      __typename
                      id
                      url
                    }
                  }
                }
              }
            }
            user {
              __typename
              id
              fullName
              avatar {
                __typename
                url
                id
              }
              avatarIndex
              avatarPhotos {
                __typename
                url
                id
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

  public let operationName: String = "GetAllUserStories"

  public var first: Int
  public var after: String
  public var pk: String

  public init(first: Int, after: String, pk: String) {
    self.first = first
    self.after = after
    self.pk = pk
  }

  public var variables: GraphQLMap? {
    return ["first": first, "after": after, "pk": pk]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allUserStories", arguments: ["after": GraphQLVariable("after"), "first": GraphQLVariable("first"), "pk": GraphQLVariable("pk")], type: .object(AllUserStory.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allUserStories: AllUserStory? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "allUserStories": allUserStories.flatMap { (value: AllUserStory) -> ResultMap in value.resultMap }])
    }

    public var allUserStories: AllUserStory? {
      get {
        return (resultMap["allUserStories"] as? ResultMap).flatMap { AllUserStory(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "allUserStories")
      }
    }

    public struct AllUserStory: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["StoryTypeConnection"]

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
        self.init(unsafeResultMap: ["__typename": "StoryTypeConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, "pageInfo": pageInfo.resultMap])
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
        public static let possibleTypes: [String] = ["StoryTypeEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(cursor: String, node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "StoryTypeEdge", "cursor": cursor, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
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
          public static let possibleTypes: [String] = ["StoryType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("createdDate", type: .nonNull(.scalar(String.self))),
              GraphQLField("file", type: .nonNull(.scalar(String.self))),
              GraphQLField("fileType", type: .scalar(String.self)),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("pk", type: .scalar(Int.self)),
              GraphQLField("thumbnail", type: .scalar(String.self)),
              GraphQLField("commentsCount", type: .scalar(Int.self)),
              GraphQLField("comments", type: .object(Comment.selections)),
              GraphQLField("likesCount", type: .scalar(Int.self)),
              GraphQLField("likes", type: .object(Like.selections)),
              GraphQLField("user", type: .object(User.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(createdDate: String, file: String, fileType: String? = nil, id: GraphQLID, pk: Int? = nil, thumbnail: String? = nil, commentsCount: Int? = nil, comments: Comment? = nil, likesCount: Int? = nil, likes: Like? = nil, user: User? = nil) {
            self.init(unsafeResultMap: ["__typename": "StoryType", "createdDate": createdDate, "file": file, "fileType": fileType, "id": id, "pk": pk, "thumbnail": thumbnail, "commentsCount": commentsCount, "comments": comments.flatMap { (value: Comment) -> ResultMap in value.resultMap }, "likesCount": likesCount, "likes": likes.flatMap { (value: Like) -> ResultMap in value.resultMap }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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

          public var file: String {
            get {
              return resultMap["file"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "file")
            }
          }

          public var fileType: String? {
            get {
              return resultMap["fileType"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "fileType")
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

          public var thumbnail: String? {
            get {
              return resultMap["thumbnail"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "thumbnail")
            }
          }

          public var commentsCount: Int? {
            get {
              return resultMap["commentsCount"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "commentsCount")
            }
          }

          public var comments: Comment? {
            get {
              return (resultMap["comments"] as? ResultMap).flatMap { Comment(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "comments")
            }
          }

          public var likesCount: Int? {
            get {
              return resultMap["likesCount"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "likesCount")
            }
          }

          public var likes: Like? {
            get {
              return (resultMap["likes"] as? ResultMap).flatMap { Like(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "likes")
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

          public struct Comment: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["GenericCommentTypeConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
                GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(pageInfo: PageInfo, edges: [Edge?]) {
              self.init(unsafeResultMap: ["__typename": "GenericCommentTypeConnection", "pageInfo": pageInfo.resultMap, "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
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

            /// Contains the nodes in this connection.
            public var edges: [Edge?] {
              get {
                return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
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

            public struct Edge: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["GenericCommentTypeEdge"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .object(Node.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(cursor: String, node: Node? = nil) {
                self.init(unsafeResultMap: ["__typename": "GenericCommentTypeEdge", "cursor": cursor, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
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
                public static let possibleTypes: [String] = ["GenericCommentType"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("pk", type: .scalar(Int.self)),
                    GraphQLField("createdDate", type: .scalar(String.self)),
                    GraphQLField("commentDescription", type: .scalar(String.self)),
                    GraphQLField("objectId", type: .nonNull(.scalar(Int.self))),
                    GraphQLField("pk", type: .scalar(Int.self)),
                    GraphQLField("user", type: .nonNull(.object(User.selections))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(id: GraphQLID, pk: Int? = nil, createdDate: String? = nil, commentDescription: String? = nil, objectId: Int, user: User) {
                  self.init(unsafeResultMap: ["__typename": "GenericCommentType", "id": id, "pk": pk, "createdDate": createdDate, "commentDescription": commentDescription, "objectId": objectId, "user": user.resultMap])
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

                public var pk: Int? {
                  get {
                    return resultMap["pk"] as? Int
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "pk")
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

                public var commentDescription: String? {
                  get {
                    return resultMap["commentDescription"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "commentDescription")
                  }
                }

                public var objectId: Int {
                  get {
                    return resultMap["objectId"]! as! Int
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "objectId")
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

                public struct User: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["UserType"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("id", type: .scalar(String.self)),
                      GraphQLField("fullName", type: .scalar(String.self)),
                      GraphQLField("avatarIndex", type: .nonNull(.scalar(Int.self))),
                      GraphQLField("avatarPhotos", type: .list(.object(AvatarPhoto.selections))),
                      GraphQLField("avatar", type: .object(Avatar.selections)),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(id: String? = nil, fullName: String? = nil, avatarIndex: Int, avatarPhotos: [AvatarPhoto?]? = nil, avatar: Avatar? = nil) {
                    self.init(unsafeResultMap: ["__typename": "UserType", "id": id, "fullName": fullName, "avatarIndex": avatarIndex, "avatarPhotos": avatarPhotos.flatMap { (value: [AvatarPhoto?]) -> [ResultMap?] in value.map { (value: AvatarPhoto?) -> ResultMap? in value.flatMap { (value: AvatarPhoto) -> ResultMap in value.resultMap } } }, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }])
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

                  public var fullName: String? {
                    get {
                      return resultMap["fullName"] as? String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "fullName")
                    }
                  }

                  public var avatarIndex: Int {
                    get {
                      return resultMap["avatarIndex"]! as! Int
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "avatarIndex")
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

                  public var avatar: Avatar? {
                    get {
                      return (resultMap["avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
                    }
                    set {
                      resultMap.updateValue(newValue?.resultMap, forKey: "avatar")
                    }
                  }

                  public struct AvatarPhoto: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["UserPhotoType"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("url", type: .scalar(String.self)),
                        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(url: String? = nil, id: GraphQLID) {
                      self.init(unsafeResultMap: ["__typename": "UserPhotoType", "url": url, "id": id])
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
                  }

                  public struct Avatar: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["UserPhotoType"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                        GraphQLField("url", type: .scalar(String.self)),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(id: GraphQLID, url: String? = nil) {
                      self.init(unsafeResultMap: ["__typename": "UserPhotoType", "id": id, "url": url])
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
                  }
                }
              }
            }
          }

          public struct Like: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["GenericLikeTypeConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
                GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(pageInfo: PageInfo, edges: [Edge?]) {
              self.init(unsafeResultMap: ["__typename": "GenericLikeTypeConnection", "pageInfo": pageInfo.resultMap, "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
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

            /// Contains the nodes in this connection.
            public var edges: [Edge?] {
              get {
                return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
              }
              set {
                resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
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

            public struct Edge: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["GenericLikeTypeEdge"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .object(Node.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(cursor: String, node: Node? = nil) {
                self.init(unsafeResultMap: ["__typename": "GenericLikeTypeEdge", "cursor": cursor, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
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
                public static let possibleTypes: [String] = ["GenericLikeType"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("pk", type: .scalar(Int.self)),
                    GraphQLField("objectId", type: .nonNull(.scalar(Int.self))),
                    GraphQLField("user", type: .nonNull(.object(User.selections))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(id: GraphQLID, pk: Int? = nil, objectId: Int, user: User) {
                  self.init(unsafeResultMap: ["__typename": "GenericLikeType", "id": id, "pk": pk, "objectId": objectId, "user": user.resultMap])
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

                public var pk: Int? {
                  get {
                    return resultMap["pk"] as? Int
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "pk")
                  }
                }

                public var objectId: Int {
                  get {
                    return resultMap["objectId"]! as! Int
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "objectId")
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

                public struct User: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["UserType"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("id", type: .scalar(String.self)),
                      GraphQLField("fullName", type: .scalar(String.self)),
                      GraphQLField("avatarIndex", type: .nonNull(.scalar(Int.self))),
                      GraphQLField("avatarPhotos", type: .list(.object(AvatarPhoto.selections))),
                      GraphQLField("avatar", type: .object(Avatar.selections)),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(id: String? = nil, fullName: String? = nil, avatarIndex: Int, avatarPhotos: [AvatarPhoto?]? = nil, avatar: Avatar? = nil) {
                    self.init(unsafeResultMap: ["__typename": "UserType", "id": id, "fullName": fullName, "avatarIndex": avatarIndex, "avatarPhotos": avatarPhotos.flatMap { (value: [AvatarPhoto?]) -> [ResultMap?] in value.map { (value: AvatarPhoto?) -> ResultMap? in value.flatMap { (value: AvatarPhoto) -> ResultMap in value.resultMap } } }, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }])
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

                  public var fullName: String? {
                    get {
                      return resultMap["fullName"] as? String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "fullName")
                    }
                  }

                  public var avatarIndex: Int {
                    get {
                      return resultMap["avatarIndex"]! as! Int
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "avatarIndex")
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

                  public var avatar: Avatar? {
                    get {
                      return (resultMap["avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
                    }
                    set {
                      resultMap.updateValue(newValue?.resultMap, forKey: "avatar")
                    }
                  }

                  public struct AvatarPhoto: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["UserPhotoType"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("url", type: .scalar(String.self)),
                        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(url: String? = nil, id: GraphQLID) {
                      self.init(unsafeResultMap: ["__typename": "UserPhotoType", "url": url, "id": id])
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
                  }

                  public struct Avatar: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["UserPhotoType"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                        GraphQLField("url", type: .scalar(String.self)),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(id: GraphQLID, url: String? = nil) {
                      self.init(unsafeResultMap: ["__typename": "UserPhotoType", "id": id, "url": url])
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
                  }
                }
              }
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["UserTypeone"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(String.self))),
                GraphQLField("fullName", type: .nonNull(.scalar(String.self))),
                GraphQLField("avatar", type: .object(Avatar.selections)),
                GraphQLField("avatarIndex", type: .nonNull(.scalar(Int.self))),
                GraphQLField("avatarPhotos", type: .nonNull(.list(.nonNull(.object(AvatarPhoto.selections))))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String, fullName: String, avatar: Avatar? = nil, avatarIndex: Int, avatarPhotos: [AvatarPhoto]) {
              self.init(unsafeResultMap: ["__typename": "UserTypeone", "id": id, "fullName": fullName, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }, "avatarIndex": avatarIndex, "avatarPhotos": avatarPhotos.map { (value: AvatarPhoto) -> ResultMap in value.resultMap }])
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

            public var fullName: String {
              get {
                return resultMap["fullName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "fullName")
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

            public var avatarIndex: Int {
              get {
                return resultMap["avatarIndex"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "avatarIndex")
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
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(url: String? = nil, id: GraphQLID) {
                self.init(unsafeResultMap: ["__typename": "UserPhotoType", "url": url, "id": id])
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
            }

            public struct AvatarPhoto: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UserPhotoType"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .scalar(String.self)),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(url: String? = nil, id: GraphQLID) {
                self.init(unsafeResultMap: ["__typename": "UserPhotoType", "url": url, "id": id])
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
