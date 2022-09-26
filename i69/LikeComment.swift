// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LikeCommentMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation LikeComment($commentID: String!) {
      likeComment(commentId: $commentID) {
        __typename
        commentLike {
          __typename
          user {
            __typename
            id
            username
          }
          comment {
            __typename
            id
            user {
              __typename
              id
              username
            }
            commentDescription
            momemt {
              __typename
              user {
                __typename
                id
                username
              }
              Title
              momentDescription
              createdDate
            }
            createdDate
          }
        }
      }
    }
    """

  public let operationName: String = "LikeComment"

  public var commentID: String

  public init(commentID: String) {
    self.commentID = commentID
  }

  public var variables: GraphQLMap? {
    return ["commentID": commentID]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("likeComment", arguments: ["commentId": GraphQLVariable("commentID")], type: .object(LikeComment.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(likeComment: LikeComment? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "likeComment": likeComment.flatMap { (value: LikeComment) -> ResultMap in value.resultMap }])
    }

    public var likeComment: LikeComment? {
      get {
        return (resultMap["likeComment"] as? ResultMap).flatMap { LikeComment(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "likeComment")
      }
    }

    public struct LikeComment: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CommentLikeMutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("commentLike", type: .object(CommentLike.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(commentLike: CommentLike? = nil) {
        self.init(unsafeResultMap: ["__typename": "CommentLikeMutation", "commentLike": commentLike.flatMap { (value: CommentLike) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var commentLike: CommentLike? {
        get {
          return (resultMap["commentLike"] as? ResultMap).flatMap { CommentLike(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "commentLike")
        }
      }

      public struct CommentLike: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CommentLikeType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("user", type: .nonNull(.object(User.selections))),
            GraphQLField("comment", type: .nonNull(.object(Comment.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(user: User, comment: Comment) {
          self.init(unsafeResultMap: ["__typename": "CommentLikeType", "user": user.resultMap, "comment": comment.resultMap])
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

        public var comment: Comment {
          get {
            return Comment(unsafeResultMap: resultMap["comment"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "comment")
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

        public struct Comment: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CommentType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("user", type: .nonNull(.object(User.selections))),
              GraphQLField("commentDescription", type: .nonNull(.scalar(String.self))),
              GraphQLField("momemt", type: .nonNull(.object(Momemt.selections))),
              GraphQLField("createdDate", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, user: User, commentDescription: String, momemt: Momemt, createdDate: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "CommentType", "id": id, "user": user.resultMap, "commentDescription": commentDescription, "momemt": momemt.resultMap, "createdDate": createdDate])
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

          public var user: User {
            get {
              return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "user")
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

          public var createdDate: String? {
            get {
              return resultMap["createdDate"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdDate")
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

            public init(user: User? = nil, title: String? = nil, momentDescription: String, createdDate: String) {
              self.init(unsafeResultMap: ["__typename": "MomentsTyps", "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "Title": title, "momentDescription": momentDescription, "createdDate": createdDate])
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
}
