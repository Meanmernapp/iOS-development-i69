// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CommentMomentMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CommentMoment($momentID: ID!, $commentDescription: String!) {
      commentMoment(momentId: $momentID, commentDescription: $commentDescription) {
        __typename
        comment {
          __typename
          id
          pk
          commentDescription
          momemt {
            __typename
            id
            pk
            like
            comment
          }
          user {
            __typename
            id
            username
            email
          }
        }
      }
    }
    """

  public let operationName: String = "CommentMoment"

  public var momentID: GraphQLID
  public var commentDescription: String

  public init(momentID: GraphQLID, commentDescription: String) {
    self.momentID = momentID
    self.commentDescription = commentDescription
  }

  public var variables: GraphQLMap? {
    return ["momentID": momentID, "commentDescription": commentDescription]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("commentMoment", arguments: ["momentId": GraphQLVariable("momentID"), "commentDescription": GraphQLVariable("commentDescription")], type: .object(CommentMoment.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(commentMoment: CommentMoment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "commentMoment": commentMoment.flatMap { (value: CommentMoment) -> ResultMap in value.resultMap }])
    }

    public var commentMoment: CommentMoment? {
      get {
        return (resultMap["commentMoment"] as? ResultMap).flatMap { CommentMoment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "commentMoment")
      }
    }

    public struct CommentMoment: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Momentcommentmutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("comment", type: .object(Comment.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(comment: Comment? = nil) {
        self.init(unsafeResultMap: ["__typename": "Momentcommentmutation", "comment": comment.flatMap { (value: Comment) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var comment: Comment? {
        get {
          return (resultMap["comment"] as? ResultMap).flatMap { Comment(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "comment")
        }
      }

      public struct Comment: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CommentType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("pk", type: .scalar(Int.self)),
            GraphQLField("commentDescription", type: .nonNull(.scalar(String.self))),
            GraphQLField("momemt", type: .nonNull(.object(Momemt.selections))),
            GraphQLField("user", type: .nonNull(.object(User.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, pk: Int? = nil, commentDescription: String, momemt: Momemt, user: User) {
          self.init(unsafeResultMap: ["__typename": "CommentType", "id": id, "pk": pk, "commentDescription": commentDescription, "momemt": momemt.resultMap, "user": user.resultMap])
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

        public var pk: Int? {
          get {
            return resultMap["pk"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "pk")
          }
        }

        public var commentDescription: String {
          get {
            return resultMap["commentDescription"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "commentDescription")
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

        public var user: User {
          get {
            return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "user")
          }
        }

        public struct Momemt: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["MomentsTyps"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("pk", type: .scalar(Int.self)),
              GraphQLField("like", type: .scalar(Int.self)),
              GraphQLField("comment", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, pk: Int? = nil, like: Int? = nil, comment: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "MomentsTyps", "id": id, "pk": pk, "like": like, "comment": comment])
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

          public var pk: Int? {
            get {
              return resultMap["pk"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "pk")
            }
          }

          public var like: Int? {
            get {
              return resultMap["like"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "like")
            }
          }

          public var comment: Int? {
            get {
              return resultMap["comment"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "comment")
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
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String? = nil, username: String? = nil, email: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "UserType", "id": id, "username": username, "email": email])
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
        }
      }
    }
  }
}
