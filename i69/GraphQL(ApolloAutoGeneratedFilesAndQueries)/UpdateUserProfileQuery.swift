// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class UpdateUserProfileMutation: GraphQLMutation {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
    """
    mutation updateUserProfile($id: String!, $fullName: String!, $email: String!, $about: String!, $age: Int!, $gender: Int!, $height: Int!, $education: String!, $ethinicity: Int!, $familyPlans: Int!, $interestedIn: [Int]!, $music: [String]!, $sportsTeams: [String]!, $books: [String]!, $movies: [String]!, $religion: Int!, $politics: Int!, $tagIds: [Int]!, $work: String!, $zodiacSign: Int!) {
      updateProfile(
        id: $id
        fullName: $fullName
        email: $email
        about: $about
        age: $age
        gender: $gender
        height: $height
        education: $education
        ethinicity: $ethinicity
        familyPlans: $familyPlans
        interestedIn: $interestedIn
        music: $music
        sportsTeams: $sportsTeams
        book: $books
        movies: $movies
        religion: $religion
        politics: $politics
        tagIds: $tagIds
        work: $work
        zodiacSign: $zodiacSign
      ) {
        __typename
        id
      }
    }
    """
    
    public let operationName: String = "updateUserProfile"
    
    public var id: String
    public var fullName: String
    public var email: String
    public var about: String
    public var age: Int
    public var gender: Int
    public var height: Int
    public var education: String
    public var ethinicity: Int
    public var familyPlans: Int
    public var interestedIn: [Int?]
    public var music: [String?]
    public var sportsTeams: [String?]
    public var books: [String?]
    public var movies: [String?]
    public var religion: Int
    public var politics: Int
    public var tagIds: [Int?]
    public var work: String
    public var zodiacSign: Int
    
    public init(id: String, fullName: String, email: String, about: String, age: Int, gender: Int, height: Int, education: String, ethinicity: Int, familyPlans: Int, interestedIn: [Int?], music: [String?], sportsTeams: [String?], books: [String?], movies: [String?], religion: Int, politics: Int, tagIds: [Int?], work: String, zodiacSign: Int) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.about = about
        self.age = age
        self.gender = gender
        self.height = height
        self.education = education
        self.ethinicity = ethinicity
        self.familyPlans = familyPlans
        self.interestedIn = interestedIn
        self.music = music
        self.sportsTeams = sportsTeams
        self.books = books
        self.movies = movies
        self.religion = religion
        self.politics = politics
        self.tagIds = tagIds
        self.work = work
        self.zodiacSign = zodiacSign
    }
    
    public init()
    {
        self.id = SignUpHelper.shared.user.id
        self.fullName = SignUpHelper.shared.user.fullName
        self.email = SignUpHelper.shared.user.email
        self.about = SignUpHelper.shared.about
        self.age = SignUpHelper.shared.optionsId[pickerType.agePicker.rawValue] ?? 1
        self.gender = SignUpHelper.shared.optionsId[pickerType.genderPicker.rawValue] ?? 1
        self.height = SignUpHelper.shared.optionsId[pickerType.heightsPicker.rawValue] ?? 1
        self.ethinicity = SignUpHelper.shared.optionsId[pickerType.ethnicityPicker.rawValue] ?? 1
        self.familyPlans = SignUpHelper.shared.optionsId[pickerType.familyPicker.rawValue] ?? 1
        self.religion = SignUpHelper.shared.optionsId[pickerType.religiousPicker.rawValue] ?? 1
        self.politics = SignUpHelper.shared.optionsId[pickerType.politicsPicker.rawValue] ?? 1
        self.zodiacSign = SignUpHelper.shared.optionsId[pickerType.zodiacSignPicker.rawValue] ?? 1
        self.education = SignUpHelper.shared.education
        self.interestedIn = SignUpHelper.shared.intrestedIns
        self.music = SignUpHelper.shared.intrest["Music"] ?? [String]()
        self.sportsTeams = SignUpHelper.shared.intrest["Sports Teams"] ?? [String]()
        self.books = SignUpHelper.shared.intrest["Tv Shows"] ?? [String]()
        self.movies = SignUpHelper.shared.intrest["Movies"] ?? [String]()
        self.tagIds = SignUpHelper.shared.tagIds
        self.work = SignUpHelper.shared.work
    }
    
    public var variables: GraphQLMap? {
        return ["id": id, "fullName": fullName, "email": email, "about": about, "age": age, "gender": gender, "height": height, "education": education, "ethinicity": ethinicity, "familyPlans": familyPlans, "interestedIn": interestedIn, "music": music, "sportsTeams": sportsTeams, "books": books, "movies": movies, "religion": religion, "politics": politics, "tagIds": tagIds, "work": work, "zodiacSign": zodiacSign]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("updateProfile", arguments: ["id": GraphQLVariable("id"), "fullName": GraphQLVariable("fullName"), "email": GraphQLVariable("email"), "about": GraphQLVariable("about"), "age": GraphQLVariable("age"), "gender": GraphQLVariable("gender"), "height": GraphQLVariable("height"), "education": GraphQLVariable("education"), "ethinicity": GraphQLVariable("ethinicity"), "familyPlans": GraphQLVariable("familyPlans"), "interestedIn": GraphQLVariable("interestedIn"), "music": GraphQLVariable("music"), "sportsTeams": GraphQLVariable("sportsTeams"), "book": GraphQLVariable("books"), "movies": GraphQLVariable("movies"), "religion": GraphQLVariable("religion"), "politics": GraphQLVariable("politics"), "tagIds": GraphQLVariable("tagIds"), "work": GraphQLVariable("work"), "zodiacSign": GraphQLVariable("zodiacSign")], type: .object(UpdateProfile.selections)),
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(updateProfile: UpdateProfile? = nil) {
            self.init(unsafeResultMap: ["__typename": "Mutation", "updateProfile": updateProfile.flatMap { (value: UpdateProfile) -> ResultMap in value.resultMap }])
        }
        
        public var updateProfile: UpdateProfile? {
            get {
                return (resultMap["updateProfile"] as? ResultMap).flatMap { UpdateProfile(unsafeResultMap: $0) }
            }
            set {
                resultMap.updateValue(newValue?.resultMap, forKey: "updateProfile")
            }
        }
        
        public struct UpdateProfile: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["userResponseObj"]
            
            public static var selections: [GraphQLSelection] {
                return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .scalar(String.self)),
                ]
            }
            
            public private(set) var resultMap: ResultMap
            
            public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
            }
            
            public init(id: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "userResponseObj", "id": id])
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
        }
    }
}
