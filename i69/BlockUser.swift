// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class BlockingUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation BlockingUser($UserID: String!, $BlockUserID: String!) {
      blockUser(id: $UserID, blockedId: $BlockUserID) {
        __typename
        id
        username
        success
      }
    }
    """

  public let operationName: String = "BlockingUser"

  public var UserID: String
  public var BlockUserID: String

  public init(UserID: String, BlockUserID: String) {
    self.UserID = UserID
    self.BlockUserID = BlockUserID
  }

  public var variables: GraphQLMap? {
    return ["UserID": UserID, "BlockUserID": BlockUserID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("blockUser", arguments: ["id": GraphQLVariable("UserID"), "blockedId": GraphQLVariable("BlockUserID")], type: .object(BlockUser.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(blockUser: BlockUser? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "blockUser": blockUser.flatMap { (value: BlockUser) -> ResultMap in value.resultMap }])
    }

    public var blockUser: BlockUser? {
      get {
        return (resultMap["blockUser"] as? ResultMap).flatMap { BlockUser(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "blockUser")
      }
    }

    public struct BlockUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["blockResponseObj"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(String.self)),
          GraphQLField("username", type: .scalar(String.self)),
          GraphQLField("success", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String? = nil, username: String? = nil, success: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "blockResponseObj", "id": id, "username": username, "success": success])
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

      public var success: Bool? {
        get {
          return resultMap["success"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "success")
        }
      }
    }
  }
}
