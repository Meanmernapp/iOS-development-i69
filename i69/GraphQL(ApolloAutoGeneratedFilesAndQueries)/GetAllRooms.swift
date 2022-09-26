// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetAllRoomsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllRooms($first: Int!) {
      rooms(first: $first) {
        __typename
        pageInfo {
          __typename
          hasNextPage
          hasPreviousPage
          startCursor
          endCursor
        }
        edges {
          __typename
          node {
            __typename
            id
            name
            lastModified
            unread
            messageSet(first: 1) {
              __typename
              edges {
                __typename
                node {
                  __typename
                  content
                  id
                  roomId {
                    __typename
                    id
                  }
                  timestamp
                  read
                }
              }
            }
            userId {
              __typename
              username
              fullName
              id
              isOnline
              avatar {
                __typename
                url
              }
              gender
            }
            target {
              __typename
              username
              fullName
              id
              isOnline
              avatar {
                __typename
                url
              }
              gender
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetAllRooms"

  public var first: Int

  public init(first: Int) {
    self.first = first
  }

  public var variables: GraphQLMap? {
    return ["first": first]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("rooms", arguments: ["first": GraphQLVariable("first")], type: .object(Room.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(rooms: Room? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "rooms": rooms.flatMap { (value: Room) -> ResultMap in value.resultMap }])
    }

    public var rooms: Room? {
      get {
        return (resultMap["rooms"] as? ResultMap).flatMap { Room(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "rooms")
      }
    }

    public struct Room: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RoomTypeConnection"]

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
        self.init(unsafeResultMap: ["__typename": "RoomTypeConnection", "pageInfo": pageInfo.resultMap, "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
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
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("startCursor", type: .scalar(String.self)),
            GraphQLField("endCursor", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNextPage: Bool, hasPreviousPage: Bool, startCursor: String? = nil, endCursor: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "hasPreviousPage": hasPreviousPage, "startCursor": startCursor, "endCursor": endCursor])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["RoomTypeEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "RoomTypeEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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
          public static let possibleTypes: [String] = ["RoomType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("lastModified", type: .scalar(String.self)),
              GraphQLField("unread", type: .scalar(String.self)),
              GraphQLField("messageSet", arguments: ["first": 1], type: .nonNull(.object(MessageSet.selections))),
              GraphQLField("userId", type: .nonNull(.object(UserId.selections))),
              GraphQLField("target", type: .nonNull(.object(Target.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, lastModified: String? = nil, unread: String? = nil, messageSet: MessageSet, userId: UserId, target: Target) {
            self.init(unsafeResultMap: ["__typename": "RoomType", "id": id, "name": name, "lastModified": lastModified, "unread": unread, "messageSet": messageSet.resultMap, "userId": userId.resultMap, "target": target.resultMap])
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

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var lastModified: String? {
            get {
              return resultMap["lastModified"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastModified")
            }
          }

          public var unread: String? {
            get {
              return resultMap["unread"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "unread")
            }
          }

          public var messageSet: MessageSet {
            get {
              return MessageSet(unsafeResultMap: resultMap["messageSet"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "messageSet")
            }
          }

          public var userId: UserId {
            get {
              return UserId(unsafeResultMap: resultMap["userId"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "userId")
            }
          }

          public var target: Target {
            get {
              return Target(unsafeResultMap: resultMap["target"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "target")
            }
          }

          public struct MessageSet: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["MessageTypeConnection"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(edges: [Edge?]) {
              self.init(unsafeResultMap: ["__typename": "MessageTypeConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
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

            public struct Edge: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["MessageTypeEdge"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .object(Node.selections)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(node: Node? = nil) {
                self.init(unsafeResultMap: ["__typename": "MessageTypeEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
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
                public static let possibleTypes: [String] = ["MessageType"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("content", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("roomId", type: .nonNull(.object(RoomId.selections))),
                    GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
                    GraphQLField("read", type: .scalar(String.self)),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(content: String, id: GraphQLID, roomId: RoomId, timestamp: String, read: String? = nil) {
                  self.init(unsafeResultMap: ["__typename": "MessageType", "content": content, "id": id, "roomId": roomId.resultMap, "timestamp": timestamp, "read": read])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var content: String {
                  get {
                    return resultMap["content"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "content")
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

                public var roomId: RoomId {
                  get {
                    return RoomId(unsafeResultMap: resultMap["roomId"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "roomId")
                  }
                }

                public var timestamp: String {
                  get {
                    return resultMap["timestamp"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "timestamp")
                  }
                }

                public var read: String? {
                  get {
                    return resultMap["read"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "read")
                  }
                }

                public struct RoomId: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["RoomType"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(id: GraphQLID) {
                    self.init(unsafeResultMap: ["__typename": "RoomType", "id": id])
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
                }
              }
            }
          }

          public struct UserId: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["UserType"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("username", type: .scalar(String.self)),
                GraphQLField("fullName", type: .scalar(String.self)),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("isOnline", type: .scalar(Bool.self)),
                GraphQLField("avatar", type: .object(Avatar.selections)),
                GraphQLField("gender", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(username: String? = nil, fullName: String? = nil, id: String? = nil, isOnline: Bool? = nil, avatar: Avatar? = nil, gender: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "UserType", "username": username, "fullName": fullName, "id": id, "isOnline": isOnline, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }, "gender": gender])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
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

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var isOnline: Bool? {
              get {
                return resultMap["isOnline"] as? Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "isOnline")
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

            public var gender: Int? {
              get {
                return resultMap["gender"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "gender")
              }
            }

            public struct Avatar: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UserPhotoType"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(url: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "UserPhotoType", "url": url])
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
            }
          }

          public struct Target: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["UserType"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("username", type: .scalar(String.self)),
                GraphQLField("fullName", type: .scalar(String.self)),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("isOnline", type: .scalar(Bool.self)),
                GraphQLField("avatar", type: .object(Avatar.selections)),
                GraphQLField("gender", type: .scalar(Int.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(username: String? = nil, fullName: String? = nil, id: String? = nil, isOnline: Bool? = nil, avatar: Avatar? = nil, gender: Int? = nil) {
              self.init(unsafeResultMap: ["__typename": "UserType", "username": username, "fullName": fullName, "id": id, "isOnline": isOnline, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }, "gender": gender])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
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

            public var id: String? {
              get {
                return resultMap["id"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var isOnline: Bool? {
              get {
                return resultMap["isOnline"] as? Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "isOnline")
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

            public var gender: Int? {
              get {
                return resultMap["gender"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "gender")
              }
            }

            public struct Avatar: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UserPhotoType"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(url: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "UserPhotoType", "url": url])
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
            }
          }
        }
      }
    }
  }
}
