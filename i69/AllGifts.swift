// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// An enumeration.
public enum GiftType: RawRepresentable, Equatable, Hashable, CaseIterable, JSONDecodable, JSONEncodable {
  public typealias RawValue = String
  /// real_gift
  case real
  /// virtual_gift
  case virtual
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "REAL": self = .real
      case "VIRTUAL": self = .virtual
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .real: return "REAL"
      case .virtual: return "VIRTUAL"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: GiftType, rhs: GiftType) -> Bool {
    switch (lhs, rhs) {
      case (.real, .real): return true
      case (.virtual, .virtual): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [GiftType] {
    return [
      .real,
      .virtual,
    ]
  }
}

public final class AllGiftsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AllGifts {
      allGift {
        __typename
        id
        giftName
        cost
        type
        url
      }
    }
    """

  public let operationName: String = "AllGifts"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allGift", type: .list(.object(AllGift.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allGift: [AllGift?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "allGift": allGift.flatMap { (value: [AllGift?]) -> [ResultMap?] in value.map { (value: AllGift?) -> ResultMap? in value.flatMap { (value: AllGift) -> ResultMap in value.resultMap } } }])
    }

    public var allGift: [AllGift?]? {
      get {
        return (resultMap["allGift"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AllGift?] in value.map { (value: ResultMap?) -> AllGift? in value.flatMap { (value: ResultMap) -> AllGift in AllGift(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [AllGift?]) -> [ResultMap?] in value.map { (value: AllGift?) -> ResultMap? in value.flatMap { (value: AllGift) -> ResultMap in value.resultMap } } }, forKey: "allGift")
      }
    }

    public struct AllGift: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["GiftType1"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("giftName", type: .nonNull(.scalar(String.self))),
          GraphQLField("cost", type: .nonNull(.scalar(Double.self))),
          GraphQLField("type", type: .nonNull(.scalar(GiftType.self))),
          GraphQLField("url", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, giftName: String, cost: Double, type: GiftType, url: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "GiftType1", "id": id, "giftName": giftName, "cost": cost, "type": type, "url": url])
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

      public var type: GiftType {
        get {
          return resultMap["type"]! as! GiftType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
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
