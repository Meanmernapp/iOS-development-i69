// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class BlockedUsersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query blockedUsers {
      blockedUsers {
        __typename
        id
        username
      }
    }
    """

  public let operationName: String = "blockedUsers"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("blockedUsers", type: .list(.object(BlockedUser.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(blockedUsers: [BlockedUser?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "blockedUsers": blockedUsers.flatMap { (value: [BlockedUser?]) -> [ResultMap?] in value.map { (value: BlockedUser?) -> ResultMap? in value.flatMap { (value: BlockedUser) -> ResultMap in value.resultMap } } }])
    }

    public var blockedUsers: [BlockedUser?]? {
      get {
        return (resultMap["blockedUsers"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [BlockedUser?] in value.map { (value: ResultMap?) -> BlockedUser? in value.flatMap { (value: ResultMap) -> BlockedUser in BlockedUser(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [BlockedUser?]) -> [ResultMap?] in value.map { (value: BlockedUser?) -> ResultMap? in value.flatMap { (value: BlockedUser) -> ResultMap in value.resultMap } } }, forKey: "blockedUsers")
      }
    }

    public struct BlockedUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["blockedUsers"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(String.self)),
          GraphQLField("username", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String? = nil, username: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "blockedUsers", "id": id, "username": username])
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
    }
  }
}
