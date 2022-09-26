// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CreateChatMutationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateChatMutation($username: String!) {
      createChat(userName: $username) {
        __typename
        room {
          __typename
          id
          name
          userId {
            __typename
            username
          }
          target {
            __typename
            username
          }
        }
      }
    }
    """

  public let operationName: String = "CreateChatMutation"

  public var username: String

  public init(username: String) {
    self.username = username
  }

  public var variables: GraphQLMap? {
    return ["username": username]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createChat", arguments: ["userName": GraphQLVariable("username")], type: .object(CreateChat.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createChat: CreateChat? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createChat": createChat.flatMap { (value: CreateChat) -> ResultMap in value.resultMap }])
    }

    /// to creeate a chat you need to pass `user_name`
    public var createChat: CreateChat? {
      get {
        return (resultMap["createChat"] as? ResultMap).flatMap { CreateChat(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createChat")
      }
    }

    public struct CreateChat: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CreateChat"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("room", type: .object(Room.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(room: Room? = nil) {
        self.init(unsafeResultMap: ["__typename": "CreateChat", "room": room.flatMap { (value: Room) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var room: Room? {
        get {
          return (resultMap["room"] as? ResultMap).flatMap { Room(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "room")
        }
      }

      public struct Room: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["RoomType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("userId", type: .nonNull(.object(UserId.selections))),
            GraphQLField("target", type: .nonNull(.object(Target.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, userId: UserId, target: Target) {
          self.init(unsafeResultMap: ["__typename": "RoomType", "id": id, "name": name, "userId": userId.resultMap, "target": target.resultMap])
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

        public struct Target: GraphQLSelectionSet {
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
