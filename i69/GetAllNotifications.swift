// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetAllNotificationQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllNotification($first: Int!) {
      notifications(first: $first) {
        __typename
        pageInfo {
          __typename
          startCursor
          hasPreviousPage
          hasNextPage
          endCursor
        }
        edges {
          __typename
          node {
            __typename
            id
            notificationSetting {
              __typename
              title
            }
            createdDate
            data
            notificationBody
            priority
          }
          cursor
        }
      }
    }
    """

  public let operationName: String = "GetAllNotification"

  public var first: Int

  public init(first: Int) {
    self.first = first
  }

  public var variables: GraphQLMap? {
    return ["first": first]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("notifications", arguments: ["first": GraphQLVariable("first")], type: .object(Notification.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(notifications: Notification? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "notifications": notifications.flatMap { (value: Notification) -> ResultMap in value.resultMap }])
    }

    public var notifications: Notification? {
      get {
        return (resultMap["notifications"] as? ResultMap).flatMap { Notification(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "notifications")
      }
    }

    public struct Notification: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["NotificationTypeConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
          GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(pageInfo: PageInfo, edges: [Edge?]) {
        self.init(unsafeResultMap: ["__typename": "NotificationTypeConnection", "pageInfo": pageInfo.resultMap, "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Pagination data for this connection.
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
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

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("startCursor", type: .scalar(String.self)),
            GraphQLField("hasPreviousPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("hasNextPage", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("endCursor", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(startCursor: String? = nil, hasPreviousPage: Bool, hasNextPage: Bool, endCursor: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "startCursor": startCursor, "hasPreviousPage": hasPreviousPage, "hasNextPage": hasNextPage, "endCursor": endCursor])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// When paginating backwards, the cursor to continue.
        public var startCursor: String? {
          get {
            return resultMap["startCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "startCursor")
          }
        }

        /// When paginating backwards, are there more items?
        public var hasPreviousPage: Bool {
          get {
            return resultMap["hasPreviousPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasPreviousPage")
          }
        }

        /// When paginating forwards, are there more items?
        public var hasNextPage: Bool {
          get {
            return resultMap["hasNextPage"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }

        /// When paginating forwards, the cursor to continue.
        public var endCursor: String? {
          get {
            return resultMap["endCursor"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["NotificationTypeEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
            GraphQLField("cursor", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil, cursor: String) {
          self.init(unsafeResultMap: ["__typename": "NotificationTypeEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }, "cursor": cursor])
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

        /// A cursor for use in pagination
        public var cursor: String {
          get {
            return resultMap["cursor"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "cursor")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["NotificationType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("notificationSetting", type: .object(NotificationSetting.selections)),
              GraphQLField("createdDate", type: .scalar(String.self)),
              GraphQLField("data", type: .scalar(String.self)),
              GraphQLField("notificationBody", type: .scalar(String.self)),
              GraphQLField("priority", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, notificationSetting: NotificationSetting? = nil, createdDate: String? = nil, data: String? = nil, notificationBody: String? = nil, priority: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "NotificationType", "id": id, "notificationSetting": notificationSetting.flatMap { (value: NotificationSetting) -> ResultMap in value.resultMap }, "createdDate": createdDate, "data": data, "notificationBody": notificationBody, "priority": priority])
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

          public var notificationSetting: NotificationSetting? {
            get {
              return (resultMap["notificationSetting"] as? ResultMap).flatMap { NotificationSetting(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "notificationSetting")
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

          public var data: String? {
            get {
              return resultMap["data"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "data")
            }
          }

          public var notificationBody: String? {
            get {
              return resultMap["notificationBody"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "notificationBody")
            }
          }

          public var priority: Int? {
            get {
              return resultMap["priority"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "priority")
            }
          }

          public struct NotificationSetting: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["NotificationSettingType"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(title: String) {
              self.init(unsafeResultMap: ["__typename": "NotificationSettingType", "title": title])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var title: String {
              get {
                return resultMap["title"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }
          }
        }
      }
    }
  }
}
