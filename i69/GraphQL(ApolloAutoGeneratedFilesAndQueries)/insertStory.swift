// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class StoryMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation story($file: Upload!) {
      insertStory(file: $file) {
        __typename
        story {
          __typename
          file
          createdDate
          id
        }
      }
    }
    """

  public let operationName: String = "story"

  public var file: String

  public init(file: String) {
    self.file = file
  }

  public var variables: GraphQLMap? {
    return ["file": file]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insertStory", arguments: ["file": GraphQLVariable("file")], type: .object(InsertStory.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertStory: InsertStory? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "insertStory": insertStory.flatMap { (value: InsertStory) -> ResultMap in value.resultMap }])
    }

    public var insertStory: InsertStory? {
      get {
        return (resultMap["insertStory"] as? ResultMap).flatMap { InsertStory(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insertStory")
      }
    }

    public struct InsertStory: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Storymutation"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("story", type: .object(Story.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(story: Story? = nil) {
        self.init(unsafeResultMap: ["__typename": "Storymutation", "story": story.flatMap { (value: Story) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var story: Story? {
        get {
          return (resultMap["story"] as? ResultMap).flatMap { Story(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "story")
        }
      }

      public struct Story: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["StoryType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("file", type: .nonNull(.scalar(String.self))),
            GraphQLField("createdDate", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(file: String, createdDate: String, id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "StoryType", "file": file, "createdDate": createdDate, "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var file: String {
          get {
            return resultMap["file"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "file")
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

        /// The ID of the object.
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
