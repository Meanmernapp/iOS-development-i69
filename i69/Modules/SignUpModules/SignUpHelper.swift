//
//  SignUpHelper.swift
//  i69
//
//  Created by The Mac Store on 15/04/2022.
//

import UIKit

class SignUpHelper
{
    static let shared = SignUpHelper()
    
    
    var user : UserModel = UserModel()
    var token : String = ""
    var about : String = ""
    var work : String = ""
    var education : String = ""
    var filter : PickersQuery.Data.DefaultPicker?
    var intrestedOptions = [IntrestedOptionModel]()
    var tags = [TagsModel]()
    var intrestedIns = [Int]()
    var tagIds = [Int]()
    var FCMtoken : String? = ""
    var notificationCount : Int = 0
    var header = HeaderView()
    var intrest = [String :[String]]()
    var optionsId = [String :Int]()
    
    var completeTbDataSet = [CompleteProfileDataSet]()
    func clear()
    {
        tags = [TagsModel]()
        filter = nil
        intrestedOptions = [IntrestedOptionModel]()
        completeTbDataSet = [CompleteProfileDataSet]()
        completeTbDataSet = [CompleteProfileDataSet]()
    }
    func setDefaultIntrestedOptions()
    {
        clear()
        intrestedOptions.append(IntrestedOptionModel(title: "Serious Relationship", id : 0))
        intrestedOptions.append(IntrestedOptionModel(title: "Casual Dating", id : 3))
        intrestedOptions.append(IntrestedOptionModel(title: "New Friends", id : 6))
        intrestedOptions.append(IntrestedOptionModel(title: "Roomates", id : 9))
        intrestedOptions.append(IntrestedOptionModel(title: "Business Contacts", id : 12))
        setTextFieldDic()
    }
    func setTextFieldDic()
    {
        
        var personalInformationDictionary = [String : TextFieldModel]()
        var personalInformationKeys = [String]()
        personalInformationDictionary["Name"] = TextFieldModel(text: user.fullName, placeholderText: "Name")
        personalInformationDictionary["Gender"] = TextFieldModel(text: "", placeholderText: "Enter your gender ...",type: .genderPicker)
        personalInformationDictionary["Age"] = TextFieldModel(text: "", placeholderText: "Enter your age...",type: .agePicker)
        personalInformationDictionary["Height"] = TextFieldModel(text: "", placeholderText: "Enter your height...",type: .heightsPicker)
        personalInformationDictionary["Work"] = TextFieldModel(text: "", placeholderText: "work")
        personalInformationDictionary["Education"] = TextFieldModel(text: "", placeholderText: "Enter your education...")
        personalInformationDictionary["Family Plans"] = TextFieldModel(text: "", placeholderText: "Enter your family plans...",type: .familyPicker)
        
        personalInformationKeys.append("Name")
        personalInformationKeys.append("Gender")
        personalInformationKeys.append("Age")
        personalInformationKeys.append("Height")
        personalInformationKeys.append("Work")
        personalInformationKeys.append("Education")
        personalInformationKeys.append("Family Plans")
        
        completeTbDataSet.append(CompleteProfileDataSet(title: "", keys: personalInformationKeys, dic: personalInformationDictionary))
        
        
        
        var groupsDictionary = [String : TextFieldModel]()
        var groupsKeys = [String]()
        groupsDictionary["Politic views"] = TextFieldModel(text: "", placeholderText: "Enter your politic views",type: .politicsPicker)
        groupsDictionary["Ethnicity"] = TextFieldModel(text: "", placeholderText: "Enter your ethnicity ...",type: .ethnicityPicker)
        groupsDictionary["Religious beliefs"] = TextFieldModel(text: "", placeholderText: "Enter your religious beliefs...",type: .religiousPicker)
        groupsDictionary["Zodiac Sign"] = TextFieldModel(text: "", placeholderText: "Enter your zodiac Sign...",type: .zodiacSignPicker)
        
        groupsKeys.append("Politic views")
        groupsKeys.append("Ethnicity")
        groupsKeys.append("Religious beliefs")
        groupsKeys.append("Zodiac Sign")
        
        completeTbDataSet.append(CompleteProfileDataSet(title: "GROUPS", keys: groupsKeys, dic: groupsDictionary))
        
        
        var intrest = [String]()
        intrest.append("Music")
        intrest.append("Movies")
        intrest.append("Tv Shows")
        intrest.append("Sports Teams")
        
        
        
        self.intrest["Music"] = [String]()
        self.intrest["Movies"] = [String]()
        self.intrest["Tv Shows"] = [String]()
        self.intrest["Sports Teams"] = [String]()
        
        completeTbDataSet.append(CompleteProfileDataSet(title: "Intrest", keys: intrest))
        
        optionsId[pickerType.familyPicker.rawValue] = 1
        optionsId[pickerType.heightsPicker.rawValue] = -1
        optionsId[pickerType.agePicker.rawValue] = -1
        optionsId[pickerType.genderPicker.rawValue] = -1
        optionsId[pickerType.politicsPicker.rawValue] = 1
        optionsId[pickerType.ethnicityPicker.rawValue] = 1
        optionsId[pickerType.religiousPicker.rawValue] = 1
        optionsId[pickerType.zodiacSignPicker.rawValue] = 1
        
    }
    func setFilter(filter : PickersQuery.Data.DefaultPicker?)
    {
        self.filter = filter
        setAndGroupTags()
    }
    func setAndGroupTags()
    {
        if let tagPicker = filter?.tagsPicker
        {
            for tag in tagPicker
            {
                self.tags.append(TagsModel(id: tag?.id ?? 0, title: tag?.value ?? ""))
            }
        }
        else{
            return
        }
        var index = 0
        while index < self.tags.count
        {
            var text = self.tags[index].title
            if index < (self.tags.count - 1)
            {
                text = text + self.tags[index + 1].title
            }
            if index < (self.tags.count - 2)
            {
                text = text + self.tags[index + 2].title
            }
            if let font = UIFont(name: "Inter-SemiBold", size: 14)
            {
                var size = text.uppercased().widthOfString(usingFont: font) + 10
                size = size + 20 * 3 + 80
                if size <= UIScreen.main.bounds.width && index < (self.tags.count - 2)
                {
                    let nextCount = index + 3
                    while index < nextCount
                    {
                        self.tags[index].rowCount = 3
                        index = index + 1
                    }
                }
                else{
                    index = index + 2
                }
            }
            else{
                index = index + 1
                break
            }
        }
    }
}
class TextFieldModel
{
    var type = pickerType.none
    var text = ""
    var placeholderText = ""
    init()
    {}
    init(text : String,placeholderText : String, type : pickerType = pickerType.none)
    {
        self.text = text
        self.placeholderText = placeholderText
        self.type = type
    }
}
class CompleteProfileDataSet
{
    var title = ""
    var keys = [String]()
    var dic = [String : TextFieldModel]()
    var open = false
    init(title : String,keys : [String],dic : [String : TextFieldModel] = [String : TextFieldModel]())
    {
        self.title = title
        self.keys = keys
        self.dic = dic
    }
}
