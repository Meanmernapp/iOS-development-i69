//
//  CustomPickerView.swift
//  i69
//
//  Created by The Mac Store on 15/04/2022.
//

import Foundation
import UIKit
class CustomPickerView : UIPickerView
{
    var section = 0
    var key = ""
    var dictionaryKey = ""
    var textField = UITextField()
    var data = [PickerDataSet]()
}
class PickerDataSet
{
    var id : Int = 0
    var title = ""
    init(id : Int,title : String)
    {
        self.id = id
        self.title = title
    }
}
enum pickerType : String
{
    case familyPicker = "familyPicker"
    case heightsPicker = "heightsPicker"
    case agePicker = "agePicker"
    case genderPicker = "genderPicker"
    case politicsPicker = "politicsPicker"
    case ethnicityPicker = "ethnicityPicker"
    case religiousPicker = "religiousPicker"
    case zodiacSignPicker = "zodiacSignPicker"
    case none = "none"
}
