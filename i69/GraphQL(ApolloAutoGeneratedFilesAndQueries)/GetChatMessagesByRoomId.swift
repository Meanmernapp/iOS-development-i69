// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetChatMessagesByRoomIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetChatMessagesByRoomId($roomID: ID!, $last: Int!) {
      messages(id: $roomID, last: $last) {
        __typename
        edges {
          __typename
          node {
            __typename
            id
            content
            timestamp
            roomId {
              __typename
              id
              name
            }
            userId {
              __typename
              id
              username
              avatarIndex
              avatarPhotos {
                __typename
                url
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetChatMessagesByRoomId"

  public var roomID: GraphQLID
  public var last: Int

  public init(roomID: GraphQLID, last: Int) {
    self.roomID = roomID
    self.last = last
  }

  public var variables: GraphQLMap? {
    return ["roomID": roomID, "last": last]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("messages", arguments: ["id": GraphQLVariable("roomID"), "last": GraphQLVariable("last")], type: .object(Message.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(messages: Message? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "messages": messages.flatMap { (value: Message) -> ResultMap in value.resultMap }])
    }

    public var messages: Message? {
      get {
        return (resultMap["messages"] as? ResultMap).flatMap { Message(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "messages")
      }
    }

    public struct Message: GraphQLSelectionSet {
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
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("content", type: .nonNull(.scalar(String.self))),
              GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
              GraphQLField("roomId", type: .nonNull(.object(RoomId.selections))),
              GraphQLField("userId", type: .nonNull(.object(UserId.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, content: String, timestamp: String, roomId: RoomId, userId: UserId) {
            self.init(unsafeResultMap: ["__typename": "MessageType", "id": id, "content": content, "timestamp": timestamp, "roomId": roomId.resultMap, "userId": userId.resultMap])
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

          public var content: String {
            get {
              return resultMap["content"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "content")
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

          public var roomId: RoomId {
            get {
              return RoomId(unsafeResultMap: resultMap["roomId"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "roomId")
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

          public struct RoomId: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["RoomType"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, name: String) {
              self.init(unsafeResultMap: ["__typename": "RoomType", "id": id, "name": name])
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
          }

          public struct UserId: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["UserType"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("username", type: .scalar(String.self)),
                GraphQLField("avatarIndex", type: .nonNull(.scalar(Int.self))),
                GraphQLField("avatarPhotos", type: .list(.object(AvatarPhoto.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, username: String? = nil, avatarIndex: Int, avatarPhotos: [AvatarPhoto?]? = nil) {
              self.init(unsafeResultMap: ["__typename": "UserType", "id": id, "username": username, "avatarIndex": avatarIndex, "avatarPhotos": avatarPhotos.flatMap { (value: [AvatarPhoto?]) -> [ResultMap?] in value.map { (value: AvatarPhoto?) -> ResultMap? in value.flatMap { (value: AvatarPhoto) -> ResultMap in value.resultMap } } }])
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

            public struct AvatarPhoto: GraphQLSelectionSet {
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
