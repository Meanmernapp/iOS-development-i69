// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class PurchaseCoinsMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation PurchaseCoins($userID: String!, $method: String, $coins: Int, $money: Float!) {
      purchaseCoin(id: $userID, method: $method, coins: $coins, money: $money) {
        __typename
        id
        coins
        success
      }
    }
    """

  public let operationName: String = "PurchaseCoins"

  public var userID: String
  public var method: String?
  public var coins: Int?
  public var money: Double

  public init(userID: String, method: String? = nil, coins: Int? = nil, money: Double) {
    self.userID = userID
    self.method = method
    self.coins = coins
    self.money = money
  }

  public var variables: GraphQLMap? {
    return ["userID": userID, "method": method, "coins": coins, "money": money]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("purchaseCoin", arguments: ["id": GraphQLVariable("userID"), "method": GraphQLVariable("method"), "coins": GraphQLVariable("coins"), "money": GraphQLVariable("money")], type: .object(PurchaseCoin.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(purchaseCoin: PurchaseCoin? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "purchaseCoin": purchaseCoin.flatMap { (value: PurchaseCoin) -> ResultMap in value.resultMap }])
    }

    public var purchaseCoin: PurchaseCoin? {
      get {
        return (resultMap["purchaseCoin"] as? ResultMap).flatMap { PurchaseCoin(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "purchaseCoin")
      }
    }

    public struct PurchaseCoin: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["purchaseResponseObj"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(Int.self)),
          GraphQLField("coins", type: .scalar(Int.self)),
          GraphQLField("success", type: .scalar(Bool.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int? = nil, coins: Int? = nil, success: Bool? = nil) {
        self.init(unsafeResultMap: ["__typename": "purchaseResponseObj", "id": id, "coins": coins, "success": success])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Int? {
        get {
          return resultMap["id"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var coins: Int? {
        get {
          return resultMap["coins"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "coins")
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
