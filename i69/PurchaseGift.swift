// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GiftPurchaseMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation GiftPurchase($gid: ID!, $uId: ID!) {
      giftPurchase(giftId: $gid, receiverId: $uId) {
        __typename
        giftPurchase {
          __typename
          gift {
            __typename
            giftName
            cost
          }
          user {
            __typename
            id
            username
            email
            coins
            purchaseCoins
          }
        }
      }
    }
    """

  public let operationName: String = "GiftPurchase"

  public var gid: GraphQLID
  public var uId: GraphQLID

  public init(gid: GraphQLID, uId: GraphQLID) {
    self.gid = gid
    self.uId = uId
  }

  public var variables: GraphQLMap? {
    return ["gid": gid, "uId": uId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("giftPurchase", arguments: ["giftId": GraphQLVariable("gid"), "receiverId": GraphQLVariable("uId")], type: .object(GiftPurchase.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(giftPurchase: GiftPurchase? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "giftPurchase": giftPurchase.flatMap { (value: GiftPurchase) -> ResultMap in value.resultMap }])
    }

    public var giftPurchase: GiftPurchase? {
      get {
        return (resultMap["giftPurchase"] as? ResultMap).flatMap { GiftPurchase(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "giftPurchase")
      }
    }

    public struct GiftPurchase: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Purchasegiftmutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("giftPurchase", type: .object(GiftPurchase.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(giftPurchase: GiftPurchase? = nil) {
        self.init(unsafeResultMap: ["__typename": "Purchasegiftmutation", "giftPurchase": giftPurchase.flatMap { (value: GiftPurchase) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var giftPurchase: GiftPurchase? {
        get {
          return (resultMap["giftPurchase"] as? ResultMap).flatMap { GiftPurchase(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "giftPurchase")
        }
      }

      public struct GiftPurchase: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["GiftpurchaseType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("gift", type: .nonNull(.object(Gift.selections))),
            GraphQLField("user", type: .nonNull(.object(User.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(gift: Gift, user: User) {
          self.init(unsafeResultMap: ["__typename": "GiftpurchaseType", "gift": gift.resultMap, "user": user.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var gift: Gift {
          get {
            return Gift(unsafeResultMap: resultMap["gift"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "gift")
          }
        }

        public var user: User {
          get {
            return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "user")
          }
        }

        public struct Gift: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["GiftType1"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("giftName", type: .nonNull(.scalar(String.self))),
              GraphQLField("cost", type: .nonNull(.scalar(Double.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(giftName: String, cost: Double) {
            self.init(unsafeResultMap: ["__typename": "GiftType1", "giftName": giftName, "cost": cost])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var giftName: String {
            get {
              return resultMap["giftName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "giftName")
            }
          }

          public var cost: Double {
            get {
              return resultMap["cost"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "cost")
            }
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["UserType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .scalar(String.self)),
              GraphQLField("username", type: .scalar(String.self)),
              GraphQLField("email", type: .scalar(String.self)),
              GraphQLField("coins", type: .scalar(Int.self)),
              GraphQLField("purchaseCoins", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, username: String? = nil, email: String? = nil, coins: Int? = nil, purchaseCoins: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "UserType", "id": id, "username": username, "email": email, "coins": coins, "purchaseCoins": purchaseCoins])
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

          public var email: String? {
            get {
              return resultMap["email"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "email")
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

          public var purchaseCoins: Int? {
            get {
              return resultMap["purchaseCoins"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "purchaseCoins")
            }
          }
        }
      }
    }
  }
}
