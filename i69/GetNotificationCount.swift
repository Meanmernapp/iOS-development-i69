// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetNotificationCountQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetNotificationCount {
      unseenCount
    }
    """

  public let operationName: String = "GetNotificationCount"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("unseenCount", type: .scalar(Int.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(unseenCount: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "unseenCount": unseenCount])
    }

    public var unseenCount: Int? {
      get {
        return resultMap["unseenCount"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "unseenCount")
      }
    }
  }
}
