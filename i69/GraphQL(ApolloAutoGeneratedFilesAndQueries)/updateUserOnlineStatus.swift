// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class UpdateUserOnlineStatusMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation updateUserOnlineStatus($id: String!, $isOnline: Boolean!) {
      updateProfile(id: $id, isOnline: $isOnline) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "updateUserOnlineStatus"

  public var id: String
  public var isOnline: Bool

  public init(id: String, isOnline: Bool) {
    self.id = id
    self.isOnline = isOnline
  }

  public var variables: GraphQLMap? {
    return ["id": id, "isOnline": isOnline]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateProfile", arguments: ["id": GraphQLVariable("id"), "isOnline": GraphQLVariable("isOnline")], type: .object(UpdateProfile.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateProfile: UpdateProfile? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateProfile": updateProfile.flatMap { (value: UpdateProfile) -> ResultMap in value.resultMap }])
    }

    public var updateProfile: UpdateProfile? {
      get {
        return (resultMap["updateProfile"] as? ResultMap).flatMap { UpdateProfile(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateProfile")
      }
    }

    public struct UpdateProfile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["userResponseObj"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "userResponseObj", "id": id])
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
    }
  }
}
