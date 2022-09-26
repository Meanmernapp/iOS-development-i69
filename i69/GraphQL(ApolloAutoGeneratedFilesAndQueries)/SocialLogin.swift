// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LoginUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation loginUser($accessToken: String!, $accessVerifier: String!, $provider: String!) {
      socialAuth(
        accessToken: $accessToken
        accessVerifier: $accessVerifier
        provider: $provider
      ) {
        __typename
        id
        email
        token
        isNew
        username
      }
    }
    """

  public let operationName: String = "loginUser"

  public var accessToken: String
  public var accessVerifier: String
  public var provider: String

  public init(accessToken: String, accessVerifier: String, provider: String) {
    self.accessToken = accessToken
    self.accessVerifier = accessVerifier
    self.provider = provider
  }

  public var variables: GraphQLMap? {
    return ["accessToken": accessToken, "accessVerifier": accessVerifier, "provider": provider]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("socialAuth", arguments: ["accessToken": GraphQLVariable("accessToken"), "accessVerifier": GraphQLVariable("accessVerifier"), "provider": GraphQLVariable("provider")], type: .object(SocialAuth.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(socialAuth: SocialAuth? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "socialAuth": socialAuth.flatMap { (value: SocialAuth) -> ResultMap in value.resultMap }])
    }

    public var socialAuth: SocialAuth? {
      get {
        return (resultMap["socialAuth"] as? ResultMap).flatMap { SocialAuth(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "socialAuth")
      }
    }

    public struct SocialAuth: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["googleAuthResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(String.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("token", type: .scalar(String.self)),
          GraphQLField("isNew", type: .scalar(Bool.self)),
          GraphQLField("username", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String? = nil, email: String? = nil, token: String? = nil, isNew: Bool? = nil, username: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "googleAuthResponse", "id": id, "email": email, "token": token, "isNew": isNew, "username": username])
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

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var token: String? {
        get {
          return resultMap["token"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "token")
        }
      }

      public var isNew: Bool? {
        get {
          return resultMap["isNew"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isNew")
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
  }
}
