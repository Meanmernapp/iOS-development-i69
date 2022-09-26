// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LikeMomentMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation LikeMoment($momentID: ID!) {
      likeMoment(momentId: $momentID) {
        __typename
        like {
          __typename
          user {
            __typename
            id
            username
          }
          momemt {
            __typename
            id
            user {
              __typename
              id
              username
            }
            Title
            momentDescription
            createdDate
          }
        }
      }
    }
    """

  public let operationName: String = "LikeMoment"

  public var momentID: GraphQLID

  public init(momentID: GraphQLID) {
    self.momentID = momentID
  }

  public var variables: GraphQLMap? {
    return ["momentID": momentID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("likeMoment", arguments: ["momentId": GraphQLVariable("momentID")], type: .object(LikeMoment.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(likeMoment: LikeMoment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "likeMoment": likeMoment.flatMap { (value: LikeMoment) -> ResultMap in value.resultMap }])
    }

    public var likeMoment: LikeMoment? {
      get {
        return (resultMap["likeMoment"] as? ResultMap).flatMap { LikeMoment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "likeMoment")
      }
    }

    public struct LikeMoment: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Momentlikemutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("like", type: .object(Like.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(like: Like? = nil) {
        self.init(unsafeResultMap: ["__typename": "Momentlikemutation", "like": like.flatMap { (value: Like) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var like: Like? {
        get {
          return (resultMap["like"] as? ResultMap).flatMap { Like(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "like")
        }
      }

      public struct Like: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LikeType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("user", type: .nonNull(.object(User.selections))),
            GraphQLField("momemt", type: .nonNull(.object(Momemt.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(user: User, momemt: Momemt) {
          self.init(unsafeResultMap: ["__typename": "LikeType", "user": user.resultMap, "momemt": momemt.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var momemt: Momemt {
          get {
            return Momemt(unsafeResultMap: resultMap["momemt"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "momemt")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["UserType"]

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
            self.init(unsafeResultMap: ["__typename": "UserType", "id": id, "username": username])
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

        public struct Momemt: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MomentsTyps"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("user", type: .object(User.selections)),
              GraphQLField("Title", type: .scalar(String.self)),
              GraphQLField("momentDescription", type: .nonNull(.scalar(String.self))),
              GraphQLField("createdDate", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, user: User? = nil, title: String? = nil, momentDescription: String, createdDate: String) {
            self.init(unsafeResultMap: ["__typename": "MomentsTyps", "id": id, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "Title": title, "momentDescription": momentDescription, "createdDate": createdDate])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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

          public var user: User? {
            get {
              return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "user")
            }
          }

          public var title: String? {
            get {
              return resultMap["Title"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "Title")
            }
          }

          public var momentDescription: String {
            get {
              return resultMap["momentDescription"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "momentDescription")
            }
          }

          public var createdDate: String {
            get {
              return resultMap["createdDate"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdDate")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["UserTypeone"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(String.self))),
                GraphQLField("username", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String, username: String) {
              self.init(unsafeResultMap: ["__typename": "UserTypeone", "id": id, "username": username])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String {
              get {
                return resultMap["id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
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
}
