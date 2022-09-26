// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class NewMomentMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation NewMoment($file: Upload!, $detail: String!, $userField: String!) {
      insertMoment(
        Title: "Latest Moment"
        file: $file
        momentDescription: $detail
        user: $userField
      ) {
        __typename
        moment {
          __typename
          user {
            __typename
            username
          }
          file
          id
        }
      }
    }
    """

  public let operationName: String = "NewMoment"

  public var file: String
  public var detail: String
  public var userField: String

  public init(file: String, detail: String, userField: String) {
    self.file = file
    self.detail = detail
    self.userField = userField
  }

  public var variables: GraphQLMap? {
    return ["file": file, "detail": detail, "userField": userField]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insertMoment", arguments: ["Title": "Latest Moment", "file": GraphQLVariable("file"), "momentDescription": GraphQLVariable("detail"), "user": GraphQLVariable("userField")], type: .object(InsertMoment.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertMoment: InsertMoment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "insertMoment": insertMoment.flatMap { (value: InsertMoment) -> ResultMap in value.resultMap }])
    }

    public var insertMoment: InsertMoment? {
      get {
        return (resultMap["insertMoment"] as? ResultMap).flatMap { InsertMoment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insertMoment")
      }
    }

    public struct InsertMoment: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Momentmutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("moment", type: .object(Moment.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(moment: Moment? = nil) {
        self.init(unsafeResultMap: ["__typename": "Momentmutation", "moment": moment.flatMap { (value: Moment) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var moment: Moment? {
        get {
          return (resultMap["moment"] as? ResultMap).flatMap { Moment(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "moment")
        }
      }

      public struct Moment: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["MomentsTyps"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("user", type: .object(User.selections)),
            GraphQLField("file", type: .scalar(String.self)),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(user: User? = nil, file: String? = nil, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "MomentsTyps", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "file": file, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var user: User? {
          get {
            return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "user")
          }
        }

        public var file: String? {
          get {
            return resultMap["file"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "file")
          }
        }

        /// The ID of the object.
        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["UserTypeone"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("username", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(username: String) {
            self.init(unsafeResultMap: ["__typename": "UserTypeone", "username": username])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.
          public var username: String {
            get {
              return resultMap["username"]! as! String
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
