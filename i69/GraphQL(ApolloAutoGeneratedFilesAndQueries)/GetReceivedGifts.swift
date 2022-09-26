// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetReceivedGiftsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetReceivedGifts($receiver_Id: UUID!) {
      allUserGifts(receiver_Id: $receiver_Id) {
        __typename
        edges {
          __typename
          cursor
          node {
            __typename
            user {
              __typename
              id
              fullName
              username
              avatar {
                __typename
                url
              }
            }
            id
            pk
            gift {
              __typename
              id
              type
              cost
              picture
              url
              giftName
              giftForGiftpurchase {
                __typename
                edges {
                  __typename
                  node {
                    __typename
                    id
                    gift {
                      __typename
                      id
                      cost
                      type
                      giftName
                      picture
                      url
                    }
                  }
                }
              }
            }
            purchasedOn
            receiver {
              __typename
              id
              fullName
              gender
              avatar {
                __typename
                url
              }
              avatarPhotos {
                __typename
                url
                id
              }
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetReceivedGifts"

  public var receiver_Id: String

  public init(receiver_Id: String) {
    self.receiver_Id = receiver_Id
  }

  public var variables: GraphQLMap? {
    return ["receiver_Id": receiver_Id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allUserGifts", arguments: ["receiver_Id": GraphQLVariable("receiver_Id")], type: .object(AllUserGift.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allUserGifts: AllUserGift? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "allUserGifts": allUserGifts.flatMap { (value: AllUserGift) -> ResultMap in value.resultMap }])
    }

    public var allUserGifts: AllUserGift? {
      get {
        return (resultMap["allUserGifts"] as? ResultMap).flatMap { AllUserGift(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "allUserGifts")
      }
    }

    public struct AllUserGift: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["GiftpurchaseTypeConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]) {
        self.init(unsafeResultMap: ["__typename": "GiftpurchaseTypeConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Contains the nodes in this connection.
      public var edges: [Edge?] {
        get {
          return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["GiftpurchaseTypeEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(cursor: String, node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "GiftpurchaseTypeEdge", "cursor": cursor, "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A cursor for use in pagination
        public var cursor: String {
          get {
            return resultMap["cursor"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "cursor")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["GiftpurchaseType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("user", type: .nonNull(.object(User.selections))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("pk", type: .scalar(Int.self)),
              GraphQLField("gift", type: .nonNull(.object(Gift.selections))),
              GraphQLField("purchasedOn", type: .scalar(String.self)),
              GraphQLField("receiver", type: .object(Receiver.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(user: User, id: GraphQLID, pk: Int? = nil, gift: Gift, purchasedOn: String? = nil, receiver: Receiver? = nil) {
            self.init(unsafeResultMap: ["__typename": "GiftpurchaseType", "user": user.resultMap, "id": id, "pk": pk, "gift": gift.resultMap, "purchasedOn": purchasedOn, "receiver": receiver.flatMap { (value: Receiver) -> ResultMap in value.resultMap }])
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

          public var gift: Gift {
            get {
              return Gift(unsafeResultMap: resultMap["gift"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "gift")
            }
          }

          public var purchasedOn: String? {
            get {
              return resultMap["purchasedOn"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "purchasedOn")
            }
          }

          public var receiver: Receiver? {
            get {
              return (resultMap["receiver"] as? ResultMap).flatMap { Receiver(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "receiver")
            }
          }

          public struct User: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["UserType"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("fullName", type: .scalar(String.self)),
                GraphQLField("username", type: .scalar(String.self)),
                GraphQLField("avatar", type: .object(Avatar.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, fullName: String? = nil, username: String? = nil, avatar: Avatar? = nil) {
              self.init(unsafeResultMap: ["__typename": "UserType", "id": id, "fullName": fullName, "username": username, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }])
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

            public var fullName: String? {
              get {
                return resultMap["fullName"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "fullName")
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

            public var avatar: Avatar? {
              get {
                return (resultMap["avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "avatar")
              }
            }

            public struct Avatar: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UserPhotoType"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(url: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "UserPhotoType", "url": url])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
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

          public struct Gift: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["GiftType1"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("type", type: .nonNull(.scalar(GiftType.self))),
                GraphQLField("cost", type: .nonNull(.scalar(Double.self))),
                GraphQLField("picture", type: .nonNull(.scalar(String.self))),
                GraphQLField("url", type: .scalar(String.self)),
                GraphQLField("giftName", type: .nonNull(.scalar(String.self))),
                GraphQLField("giftForGiftpurchase", type: .nonNull(.object(GiftForGiftpurchase.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, type: GiftType, cost: Double, picture: String, url: String? = nil, giftName: String, giftForGiftpurchase: GiftForGiftpurchase) {
              self.init(unsafeResultMap: ["__typename": "GiftType1", "id": id, "type": type, "cost": cost, "picture": picture, "url": url, "giftName": giftName, "giftForGiftpurchase": giftForGiftpurchase.resultMap])
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

            public var type: GiftType {
              get {
                return resultMap["type"]! as! GiftType
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
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

            public var picture: String {
              get {
                return resultMap["picture"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "picture")
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

            public var giftName: String {
              get {
                return resultMap["giftName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "giftName")
              }
            }

            public var giftForGiftpurchase: GiftForGiftpurchase {
              get {
                return GiftForGiftpurchase(unsafeResultMap: resultMap["giftForGiftpurchase"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "giftForGiftpurchase")
              }
            }

            public struct GiftForGiftpurchase: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["GiftpurchaseTypeConnection"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(edges: [Edge?]) {
                self.init(unsafeResultMap: ["__typename": "GiftpurchaseTypeConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Contains the nodes in this connection.
              public var edges: [Edge?] {
                get {
                  return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
                }
                set {
                  resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
                }
              }

              public struct Edge: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["GiftpurchaseTypeEdge"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("node", type: .object(Node.selections)),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(node: Node? = nil) {
                  self.init(unsafeResultMap: ["__typename": "GiftpurchaseTypeEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The item at the end of the edge
                public var node: Node? {
                  get {
                    return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "node")
                  }
                }

                public struct Node: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["GiftpurchaseType"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                      GraphQLField("gift", type: .nonNull(.object(Gift.selections))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(id: GraphQLID, gift: Gift) {
                    self.init(unsafeResultMap: ["__typename": "GiftpurchaseType", "id": id, "gift": gift.resultMap])
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

                  public var gift: Gift {
                    get {
                      return Gift(unsafeResultMap: resultMap["gift"]! as! ResultMap)
                    }
                    set {
                      resultMap.updateValue(newValue.resultMap, forKey: "gift")
                    }
                  }

                  public struct Gift: GraphQLSelectionSet {
                    public static let possibleTypes: [String] = ["GiftType1"]

                    public static var selections: [GraphQLSelection] {
                      return [
                        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                        GraphQLField("cost", type: .nonNull(.scalar(Double.self))),
                        GraphQLField("type", type: .nonNull(.scalar(GiftType.self))),
                        GraphQLField("giftName", type: .nonNull(.scalar(String.self))),
                        GraphQLField("picture", type: .nonNull(.scalar(String.self))),
                        GraphQLField("url", type: .scalar(String.self)),
                      ]
                    }

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public init(id: GraphQLID, cost: Double, type: GiftType, giftName: String, picture: String, url: String? = nil) {
                      self.init(unsafeResultMap: ["__typename": "GiftType1", "id": id, "cost": cost, "type": type, "giftName": giftName, "picture": picture, "url": url])
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

                    public var giftName: String {
                      get {
                        return resultMap["giftName"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "giftName")
                      }
                    }

                    public var picture: String {
                      get {
                        return resultMap["picture"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "picture")
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
            }
          }

          public struct Receiver: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["UserType"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .scalar(String.self)),
                GraphQLField("fullName", type: .scalar(String.self)),
                GraphQLField("gender", type: .scalar(Int.self)),
                GraphQLField("avatar", type: .object(Avatar.selections)),
                GraphQLField("avatarPhotos", type: .list(.object(AvatarPhoto.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String? = nil, fullName: String? = nil, gender: Int? = nil, avatar: Avatar? = nil, avatarPhotos: [AvatarPhoto?]? = nil) {
              self.init(unsafeResultMap: ["__typename": "UserType", "id": id, "fullName": fullName, "gender": gender, "avatar": avatar.flatMap { (value: Avatar) -> ResultMap in value.resultMap }, "avatarPhotos": avatarPhotos.flatMap { (value: [AvatarPhoto?]) -> [ResultMap?] in value.map { (value: AvatarPhoto?) -> ResultMap? in value.flatMap { (value: AvatarPhoto) -> ResultMap in value.resultMap } } }])
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

            public var fullName: String? {
              get {
                return resultMap["fullName"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "fullName")
              }
            }

            public var gender: Int? {
              get {
                return resultMap["gender"] as? Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "gender")
              }
            }

            public var avatar: Avatar? {
              get {
                return (resultMap["avatar"] as? ResultMap).flatMap { Avatar(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "avatar")
              }
            }

            public var avatarPhotos: [AvatarPhoto?]? {
              get {
                return (resultMap["avatarPhotos"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [AvatarPhoto?] in value.map { (value: ResultMap?) -> AvatarPhoto? in value.flatMap { (value: ResultMap) -> AvatarPhoto in AvatarPhoto(unsafeResultMap: value) } } }
              }
              set {
                resultMap.updateValue(newValue.flatMap { (value: [AvatarPhoto?]) -> [ResultMap?] in value.map { (value: AvatarPhoto?) -> ResultMap? in value.flatMap { (value: AvatarPhoto) -> ResultMap in value.resultMap } } }, forKey: "avatarPhotos")
              }
            }

            public struct Avatar: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UserPhotoType"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(url: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "UserPhotoType", "url": url])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
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

            public struct AvatarPhoto: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["UserPhotoType"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .scalar(String.self)),
                  GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(url: String? = nil, id: GraphQLID) {
                self.init(unsafeResultMap: ["__typename": "UserPhotoType", "url": url, "id": id])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
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

              public var id: GraphQLID {
                get {
                  return resultMap["id"]! as! GraphQLID
                }
                set {
                  resultMap.updateValue(newValue, forKey: "id")
                }
              }
            }
          }
        }
      }
    }
  }
}
