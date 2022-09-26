// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetNewMessagesSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription GetNewMessages($token: String!) {
      onNewMessage(token: $token) {
        __typename
        message {
          __typename
          id
          roomId {
            __typename
            id
            name
          }
          userId {
            __typename
            id
            fullName
            username
            avatarIndex
            avatarPhotos {
              __typename
              url
            }
          }
          content
          timestamp
          read
        }
      }
    }
    """

  public let operationName: String = "GetNewMessages"

  public var token: String

  public init(token: String) {
    self.token = token
  }

  public var variables: GraphQLMap? {
    return ["token": token]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("onNewMessage", arguments: ["token": GraphQLVariable("token")], type: .object(OnNewMessage.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(onNewMessage: OnNewMessage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "onNewMessage": onNewMessage.flatMap { (value: OnNewMessage) -> ResultMap in value.resultMap }])
    }

    public var onNewMessage: OnNewMessage? {
      get {
        return (resultMap["onNewMessage"] as? ResultMap).flatMap { OnNewMessage(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "onNewMessage")
      }
    }

    public struct OnNewMessage: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OnNewMessage"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("message", type: .object(Message.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(message: Message? = nil) {
        self.init(unsafeResultMap: ["__typename": "OnNewMessage", "message": message.flatMap { (value: Message) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var message: Message? {
        get {
          return (resultMap["message"] as? ResultMap).flatMap { Message(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "message")
        }
      }

      public struct Message: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MessageType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("roomId", type: .nonNull(.object(RoomId.selections))),
            GraphQLField("userId", type: .nonNull(.object(UserId.selections))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("timestamp", type: .nonNull(.scalar(String.self))),
            GraphQLField("read", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, roomId: RoomId, userId: UserId, content: String, timestamp: String, read: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MessageType", "id": id, "roomId": roomId.resultMap, "userId": userId.resultMap, "content": content, "timestamp": timestamp, "read": read])
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
              GraphQLField("fullName", type: .scalar(String.self)),
              GraphQLField("username", type: .scalar(String.self)),
              GraphQLField("avatarIndex", type: .nonNull(.scalar(Int.self))),
              GraphQLField("avatarPhotos", type: .list(.object(AvatarPhoto.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, fullName: String? = nil, username: String? = nil, avatarIndex: Int, avatarPhotos: [AvatarPhoto?]? = nil) {
            self.init(unsafeResultMap: ["__typename": "UserType", "id": id, "fullName": fullName, "username": username, "avatarIndex": avatarIndex, "avatarPhotos": avatarPhotos.flatMap { (value: [AvatarPhoto?]) -> [ResultMap?] in value.map { (value: AvatarPhoto?) -> ResultMap? in value.flatMap { (value: AvatarPhoto) -> ResultMap in value.resultMap } } }])
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
