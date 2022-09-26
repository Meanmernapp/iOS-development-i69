// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class PickersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query pickers {
      defaultPicker {
        __typename
        agePicker {
          __typename
          id
          value
          valueFr
        }
        ethnicityPicker {
          __typename
          id
          value
          valueFr
        }
        familyPicker {
          __typename
          id
          value
          valueFr
        }
        heightsPicker {
          __typename
          id
          value
          valueFr
        }
        politicsPicker {
          __typename
          id
          value
          valueFr
        }
        religiousPicker {
          __typename
          id
          value
          valueFr
        }
        tagsPicker {
          __typename
          id
          value
          valueFr
        }
        zodiacSignPicker {
          __typename
          id
          value
          valueFr
        }
      }
    }
    """

  public let operationName: String = "pickers"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("defaultPicker", type: .object(DefaultPicker.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(defaultPicker: DefaultPicker? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "defaultPicker": defaultPicker.flatMap { (value: DefaultPicker) -> ResultMap in value.resultMap }])
    }

    public var defaultPicker: DefaultPicker? {
      get {
        return (resultMap["defaultPicker"] as? ResultMap).flatMap { DefaultPicker(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "defaultPicker")
      }
    }

    public struct DefaultPicker: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AllPickers"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("agePicker", type: .list(.object(AgePicker.selections))),
          GraphQLField("ethnicityPicker", type: .list(.object(EthnicityPicker.selections))),
          GraphQLField("familyPicker", type: .list(.object(FamilyPicker.selections))),
          GraphQLField("heightsPicker", type: .list(.object(HeightsPicker.selections))),
          GraphQLField("politicsPicker", type: .list(.object(PoliticsPicker.selections))),
          GraphQLField("religiousPicker", type: .list(.object(ReligiousPicker.selections))),
          GraphQLField("tagsPicker", type: .list(.object(TagsPicker.selections))),
          GraphQLField("zodiacSignPicker", type: .list(.object(ZodiacSignPicker.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(agePicker: [AgePicker?]? = nil, ethnicityPicker: [EthnicityPicker?]? = nil, familyPicker: [FamilyPicker?]? = nil, heightsPicker: [HeightsPicker?]? = nil, politicsPicker: [PoliticsPicker?]? = nil, religiousPicker: [ReligiousPicker?]? = nil, tagsPicker: [TagsPicker?]? = nil, zodiacSignPicker: [ZodiacSignPicker?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "AllPickers", "agePicker": agePicker.flatMap { (value: [AgePicker?]) -> [ResultMap?] in value.map { (value: AgePicker?) -> ResultMap? in value.flatMap { (value: AgePicker) -> ResultMap in value.resultMap } } }, "ethnicityPicker": ethnicityPicker.flatMap { (value: [EthnicityPicker?]) -> [ResultMap?] in value.map { (value: EthnicityPicker?) -> ResultMap? in value.flatMap { (value: EthnicityPicker) -> ResultMap in value.resultMap } } }, "familyPicker": familyPicker.flatMap { (value: [FamilyPicker?]) -> [ResultMap?] in value.map { (value: FamilyPicker?) -> ResultMap? in value.flatMap { (value: FamilyPicker) -> ResultMap in value.resultMap } } }, "heightsPicker": heightsPicker.flatMap { (value: [HeightsPicker?]) -> [ResultMap?] in value.map { (value: HeightsPicker?) -> ResultMap? in value.flatMap { (value: HeightsPicker) -> ResultMap in value.resultMap } } }, "politicsPicker": politicsPicker.flatMap { (value: [PoliticsPicker?]) -> [ResultMap?] in value.map { (value: PoliticsPicker?) -> ResultMap? in value.flatMap { (value: PoliticsPicker) -> ResultMap in value.resultMap } } }, "religiousPicker": religiousPicker.flatMap { (value: [ReligiousPicker?]) -> [ResultMap?] in value.map { (value: ReligiousPicker?) -> ResultMap? in value.flatMap { (value: ReligiousPicker) -> ResultMap in value.resultMap } } }, "tagsPicker": tagsPicker.flatMap { (value: [TagsPicker?]) -> [ResultMap?] in value.map { (value: TagsPicker?) -> ResultMap? in value.flatMap { (value: TagsPicker) -> ResultMap in value.resultMap } } }, "zodiacSignPicker": zodiacSignPicker.flatMap { (value: [ZodiacSignPicker?]) -> [ResultMap?] in value.map { (value: ZodiacSignPicker?) -> ResultMap? in value.flatMap { (value: ZodiacSignPicker) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var agePicker: [AgePicker?]? {
        get {
          return (resultMap["agePicker"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AgePicker?] in value.map { (value: ResultMap?) -> AgePicker? in value.flatMap { (value: ResultMap) -> AgePicker in AgePicker(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [AgePicker?]) -> [ResultMap?] in value.map { (value: AgePicker?) -> ResultMap? in value.flatMap { (value: AgePicker) -> ResultMap in value.resultMap } } }, forKey: "agePicker")
        }
      }

      public var ethnicityPicker: [EthnicityPicker?]? {
        get {
          return (resultMap["ethnicityPicker"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [EthnicityPicker?] in value.map { (value: ResultMap?) -> EthnicityPicker? in value.flatMap { (value: ResultMap) -> EthnicityPicker in EthnicityPicker(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [EthnicityPicker?]) -> [ResultMap?] in value.map { (value: EthnicityPicker?) -> ResultMap? in value.flatMap { (value: EthnicityPicker) -> ResultMap in value.resultMap } } }, forKey: "ethnicityPicker")
        }
      }

      public var familyPicker: [FamilyPicker?]? {
        get {
          return (resultMap["familyPicker"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [FamilyPicker?] in value.map { (value: ResultMap?) -> FamilyPicker? in value.flatMap { (value: ResultMap) -> FamilyPicker in FamilyPicker(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [FamilyPicker?]) -> [ResultMap?] in value.map { (value: FamilyPicker?) -> ResultMap? in value.flatMap { (value: FamilyPicker) -> ResultMap in value.resultMap } } }, forKey: "familyPicker")
        }
      }

      public var heightsPicker: [HeightsPicker?]? {
        get {
          return (resultMap["heightsPicker"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [HeightsPicker?] in value.map { (value: ResultMap?) -> HeightsPicker? in value.flatMap { (value: ResultMap) -> HeightsPicker in HeightsPicker(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [HeightsPicker?]) -> [ResultMap?] in value.map { (value: HeightsPicker?) -> ResultMap? in value.flatMap { (value: HeightsPicker) -> ResultMap in value.resultMap } } }, forKey: "heightsPicker")
        }
      }

      public var politicsPicker: [PoliticsPicker?]? {
        get {
          return (resultMap["politicsPicker"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [PoliticsPicker?] in value.map { (value: ResultMap?) -> PoliticsPicker? in value.flatMap { (value: ResultMap) -> PoliticsPicker in PoliticsPicker(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [PoliticsPicker?]) -> [ResultMap?] in value.map { (value: PoliticsPicker?) -> ResultMap? in value.flatMap { (value: PoliticsPicker) -> ResultMap in value.resultMap } } }, forKey: "politicsPicker")
        }
      }

      public var religiousPicker: [ReligiousPicker?]? {
        get {
          return (resultMap["religiousPicker"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ReligiousPicker?] in value.map { (value: ResultMap?) -> ReligiousPicker? in value.flatMap { (value: ResultMap) -> ReligiousPicker in ReligiousPicker(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ReligiousPicker?]) -> [ResultMap?] in value.map { (value: ReligiousPicker?) -> ResultMap? in value.flatMap { (value: ReligiousPicker) -> ResultMap in value.resultMap } } }, forKey: "religiousPicker")
        }
      }

      public var tagsPicker: [TagsPicker?]? {
        get {
          return (resultMap["tagsPicker"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [TagsPicker?] in value.map { (value: ResultMap?) -> TagsPicker? in value.flatMap { (value: ResultMap) -> TagsPicker in TagsPicker(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [TagsPicker?]) -> [ResultMap?] in value.map { (value: TagsPicker?) -> ResultMap? in value.flatMap { (value: TagsPicker) -> ResultMap in value.resultMap } } }, forKey: "tagsPicker")
        }
      }

      public var zodiacSignPicker: [ZodiacSignPicker?]? {
        get {
          return (resultMap["zodiacSignPicker"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [ZodiacSignPicker?] in value.map { (value: ResultMap?) -> ZodiacSignPicker? in value.flatMap { (value: ResultMap) -> ZodiacSignPicker in ZodiacSignPicker(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [ZodiacSignPicker?]) -> [ResultMap?] in value.map { (value: ZodiacSignPicker?) -> ResultMap? in value.flatMap { (value: ZodiacSignPicker) -> ResultMap in value.resultMap } } }, forKey: "zodiacSignPicker")
        }
      }

      public struct AgePicker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ageObj"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(Int.self)),
            GraphQLField("value", type: .scalar(Int.self)),
            GraphQLField("valueFr", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int? = nil, value: Int? = nil, valueFr: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "ageObj", "id": id, "value": value, "valueFr": valueFr])
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

        public var value: Int? {
          get {
            return resultMap["value"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }

        public var valueFr: Int? {
          get {
            return resultMap["valueFr"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "valueFr")
          }
        }
      }

      public struct EthnicityPicker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ethnicityObj"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(Int.self)),
            GraphQLField("value", type: .scalar(String.self)),
            GraphQLField("valueFr", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int? = nil, value: String? = nil, valueFr: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "ethnicityObj", "id": id, "value": value, "valueFr": valueFr])
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

        public var value: String? {
          get {
            return resultMap["value"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }

        public var valueFr: String? {
          get {
            return resultMap["valueFr"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "valueFr")
          }
        }
      }

      public struct FamilyPicker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["familyObj"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(Int.self)),
            GraphQLField("value", type: .scalar(String.self)),
            GraphQLField("valueFr", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int? = nil, value: String? = nil, valueFr: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "familyObj", "id": id, "value": value, "valueFr": valueFr])
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

        public var value: String? {
          get {
            return resultMap["value"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }

        public var valueFr: String? {
          get {
            return resultMap["valueFr"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "valueFr")
          }
        }
      }

      public struct HeightsPicker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["heightObj"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(Int.self)),
            GraphQLField("value", type: .scalar(Int.self)),
            GraphQLField("valueFr", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int? = nil, value: Int? = nil, valueFr: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "heightObj", "id": id, "value": value, "valueFr": valueFr])
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

        public var value: Int? {
          get {
            return resultMap["value"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }

        public var valueFr: Int? {
          get {
            return resultMap["valueFr"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "valueFr")
          }
        }
      }

      public struct PoliticsPicker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["politicsObj"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(Int.self)),
            GraphQLField("value", type: .scalar(String.self)),
            GraphQLField("valueFr", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int? = nil, value: String? = nil, valueFr: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "politicsObj", "id": id, "value": value, "valueFr": valueFr])
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

        public var value: String? {
          get {
            return resultMap["value"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }

        public var valueFr: String? {
          get {
            return resultMap["valueFr"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "valueFr")
          }
        }
      }

      public struct ReligiousPicker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["religiousObj"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(Int.self)),
            GraphQLField("value", type: .scalar(String.self)),
            GraphQLField("valueFr", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int? = nil, value: String? = nil, valueFr: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "religiousObj", "id": id, "value": value, "valueFr": valueFr])
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

        public var value: String? {
          get {
            return resultMap["value"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }

        public var valueFr: String? {
          get {
            return resultMap["valueFr"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "valueFr")
          }
        }
      }

      public struct TagsPicker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["tagsObj"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(Int.self)),
            GraphQLField("value", type: .scalar(String.self)),
            GraphQLField("valueFr", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int? = nil, value: String? = nil, valueFr: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "tagsObj", "id": id, "value": value, "valueFr": valueFr])
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

        public var value: String? {
          get {
            return resultMap["value"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }

        public var valueFr: String? {
          get {
            return resultMap["valueFr"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "valueFr")
          }
        }
      }

      public struct ZodiacSignPicker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["zodiacSignObj"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(Int.self)),
            GraphQLField("value", type: .scalar(String.self)),
            GraphQLField("valueFr", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: Int? = nil, value: String? = nil, valueFr: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "zodiacSignObj", "id": id, "value": value, "valueFr": valueFr])
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

        public var value: String? {
          get {
            return resultMap["value"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }

        public var valueFr: String? {
          get {
            return resultMap["valueFr"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "valueFr")
          }
        }
      }
    }
  }
}
