// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class SendChatMessageMutationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SendChatMessageMutation($msg: String!, $roomID: Int!) {
      sendMessage(messageStr: $msg, roomId: $roomID) {
        __typename
        message {
          __typename
          roomId {
            __typename
            lastModified
          }
          userId {
            __typename
            username
          }
          content
          timestamp
          read
        }
      }
    }
    """

  public let operationName: String = "SendChatMessageMutation"

  public var msg: String
  public var roomID: Int

  public init(msg: String, roomID: Int) {
    self.msg = msg
    self.roomID = roomID
  }

  public var variables: GraphQLMap? {
    return ["msg": msg, "roomID": roomID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("sendMessage", arguments: ["messageStr": GraphQLVariable("msg"), "roomId": GraphQLVariable("roomID")], type: .object(SendMessage.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(sendMessage: SendMessage? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "sendMessage": sendMessage.flatMap { (value: SendMessage) -> ResultMap in value.resultMap }])
    }

    public var sendMessage: SendMessage? {
      get {
        return (resultMap["sendMessage"] as? ResultMap).flatMap { SendMessage(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "sendMessage")
      }
    }

    public struct SendMessage: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["SendMessage"]

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
        self.init(unsafeResultMap: ["__typename": "SendMessage", "message": message.flatMap { (value: Message) -> ResultMap in value.resultMap }])
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

        public init(roomId: RoomId, userId: UserId, content: String, timestamp: String, read: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MessageType", "roomId": roomId.resultMap, "userId": userId.resultMap, "content": content, "timestamp": timestamp, "read": read])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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
              GraphQLField("lastModified", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(lastModified: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "RoomType", "lastModified": lastModified])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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
        }

        public struct UserId: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["UserType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("username", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(username: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "UserType", "username": username])
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
        }
      }
    }
  }
}
