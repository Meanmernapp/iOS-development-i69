//
//  SearchUserFilterViewController.swift
//  i69
//
//  Created by The Mac Store on 25/04/2022.
//

import UIKit

protocol SearchUserFilterViewControllerProtocol: AnyObject {
    func GetSearcedUserResponse(data : GetSearcedhUsersQuery.Data?,error : Error?)
}
class SearchUserFilterViewController: BaseTabBarViewController {
    @IBOutlet weak var tbData: UITableView!
    @IBOutlet weak var vHeader: UIView!
    var presenter: SearchUserFilterViewPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        StorageHelper.shared.optionsId[pickerType.familyPicker.rawValue] = 1
        StorageHelper.shared.optionsId[pickerType.politicsPicker.rawValue] = 1
        StorageHelper.shared.optionsId[pickerType.religiousPicker.rawValue] = 1
        StorageHelper.shared.optionsId[pickerType.zodiacSignPicker.rawValue] = 1
        
        
        
        StorageHelper.shared.searchDataSet.removeAll()
        StorageHelper.shared.searchDataSet.append(CompleteProfileDataSet(title: "", keys: [""]))
        StorageHelper.shared.searchDataSet.append(CompleteProfileDataSet(title: "Personal", keys: ["Family Plans"]))
        
        
        var groupsDictionary = [String : TextFieldModel]()
        var groupsKeys = [String]()
        groupsDictionary["Politic views"] = TextFieldModel(text: "", placeholderText: "Enter your politic views",type: .politicsPicker)
        groupsDictionary["Ethnicity"] = TextFieldModel(text: "", placeholderText: "Enter your ethnicity ...",type: .ethnicityPicker)
        groupsDictionary["Religious beliefs"] = TextFieldModel(text: "", placeholderText: "Enter your religious beliefs...",type: .religiousPicker)
        groupsDictionary["Zodiac Sign"] = TextFieldModel(text: "", placeholderText: "Enter your zodiac Sign...",type: .zodiacSignPicker)
        
        groupsKeys.append("Politic views")
        groupsKeys.append("Religious beliefs")
        groupsKeys.append("Zodiac Sign")
        
        StorageHelper.shared.searchDataSet.append(CompleteProfileDataSet(title: "GROUPS", keys: groupsKeys, dic: groupsDictionary))
        
        
        SearchHeaderTableViewCell.registerNib(tableView: tbData)
        PersonalFilterTableViewCell.registerNib(tableView: tbData)
        InputFiledsTableViewCell.registerNib(tableView: tbData)
        CompleteProfileSectionHeaderTableViewCell.registerNib(tableView: tbData)
        // Do any additional setup after loading the view.
        tbData.delegate = self
        tbData.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addHeaderMain(view: vHeader, title: "Search",SignUpHelper.shared.notificationCount)
    }
    
    func createToolbar(textFields : [UITextField])
    {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.tintColor = UIColor.white
        toolbar.backgroundColor = UIColor.black
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(closePickerView))
        toolbar.setItems([doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        for textField in textFields {
            textField.inputAccessoryView = toolbar
        }
    }
    
    
    func createPickerView(section : Int,textField : UITextField,data : [PickerDataSet],dictionaryKey : String,key : String)
    {
        
        let picker = CustomPickerView()
        
        picker.delegate = self
        
        
        picker.backgroundColor = UIColor(named: "golden")
        picker.textField = textField
        picker.data = data
        picker.dictionaryKey = dictionaryKey
        picker.key = key
        picker.section = section
        picker.textField.textColor = .black
        
        textField.inputView = picker
        
        
    }
    @objc func closePickerView()
    {
        view.endEditing(true)
    }
}
extension SearchUserFilterViewController : UITableViewDelegate,UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return StorageHelper.shared.searchDataSet.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return 1
        }
        let row = StorageHelper.shared.searchDataSet[section].open ? (StorageHelper.shared.searchDataSet[section].keys.count + 1) : 1
        return row
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func insertRows(section : Int)
    {
        
            self.tbData.reloadSections(IndexSet(integer: section), with: .fade)
        
    }
    func deleteRows(section : Int)
    {
        self.tbData.reloadSections(IndexSet(integer: section), with: .fade)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && indexPath.section == 0
        {
            let cell = SearchHeaderTableViewCell.getCell(tableView: tableView)
            cell.searchActionCallBack = {searchKey,range in
                self.showLoadingIndicator()
                self.presenter?.GetSearcedUsers(searchKey: searchKey)
            }
            return cell
        }
        if indexPath.row == 0
        {
            let headerView = CompleteProfileSectionHeaderTableViewCell.getCell(tableView: tableView)
            headerView.lbTitle.text = StorageHelper.shared.searchDataSet[indexPath.section].title
            headerView.openCloseClicked = {
                StorageHelper.shared.searchDataSet[indexPath.section].open = !StorageHelper.shared.searchDataSet[indexPath.section].open
                headerView.setImage(open: StorageHelper.shared.searchDataSet[indexPath.section].open)
                if StorageHelper.shared.searchDataSet[indexPath.section].open
                {
                    self.insertRows(section: indexPath.section)
                }
                else{
                    self.deleteRows(section: indexPath.section)
                }
            }
            headerView.setImage(open: StorageHelper.shared.searchDataSet[indexPath.section].open)
            return headerView
        }
        if indexPath.section == 1
        {
            let cell = PersonalFilterTableViewCell.getCell(tableView: tableView)
            createToolbar(textFields: [cell.tfFamilyPlans])
            var pickerData = [PickerDataSet]()
            if let data = SignUpHelper.shared.filter?.familyPicker
            {
                for datum in data {
                    pickerData.append(PickerDataSet(id: datum?.id ?? 0, title: datum?.value ?? ""))
                }
            }
            
            createPickerView(section: indexPath.section, textField: cell.tfFamilyPlans, data: pickerData, dictionaryKey: "Family Plans", key: "familyPicker")
            return cell
        }
        let index = indexPath.section == 0 ? indexPath.row : indexPath.row - 1
        let cell = InputFiledsTableViewCell.getCell(tableView: tableView)
        let key = StorageHelper.shared.searchDataSet[indexPath.section].keys[index]
        cell.initialise(section: indexPath.section, key: key,set: StorageHelper.shared.searchDataSet[indexPath.section])
        
        createToolbar(textFields: [cell.tfField])
        let type = StorageHelper.shared.searchDataSet[indexPath.section].dic[key]?.type ?? .none
        cell.vLine.isHidden = index >= (StorageHelper.shared.searchDataSet[indexPath.section].keys.count - 1)
        if type != .none
        {
            var pickerData = [PickerDataSet]()
            switch type {
            case .familyPicker:
                if let data = SignUpHelper.shared.filter?.familyPicker
                {
                    for datum in data {
                        pickerData.append(PickerDataSet(id: datum?.id ?? 0, title: datum?.value ?? ""))
                    }
                }
            case .heightsPicker:
                if let data = SignUpHelper.shared.filter?.heightsPicker
                {
                    for datum in data {
                        pickerData.append(PickerDataSet(id: datum?.id ?? 0, title: "\(datum?.value ?? 0)"))
                    }
                }
            case .agePicker:
                if let data = SignUpHelper.shared.filter?.agePicker
                {
                    for datum in data {
                        pickerData.append(PickerDataSet(id: datum?.id ?? 0, title: "\(datum?.value ?? 0)"))
                    }
                }
            case .genderPicker:
                pickerData.append(PickerDataSet(id:  1, title: "Male"))
                pickerData.append(PickerDataSet(id:  2, title: "Female"))
                pickerData.append(PickerDataSet(id:  3, title: "Prefer Not to Say"))
            case .politicsPicker:
                if let data = SignUpHelper.shared.filter?.politicsPicker
                {
                    for datum in data {
                        pickerData.append(PickerDataSet(id: datum?.id ?? 0, title: datum?.value ?? ""))
                    }
                }
            case .ethnicityPicker:
                if let data = SignUpHelper.shared.filter?.ethnicityPicker
                {
                    for datum in data {
                        pickerData.append(PickerDataSet(id: datum?.id ?? 0, title: datum?.value ?? ""))
                    }
                }
            case .religiousPicker:
                if let data = SignUpHelper.shared.filter?.religiousPicker
                {
                    for datum in data {
                        pickerData.append(PickerDataSet(id: datum?.id ?? 0, title: datum?.value ?? ""))
                    }
                }
            case .zodiacSignPicker:
                if let data = SignUpHelper.shared.filter?.zodiacSignPicker
                {
                    for datum in data {
                        pickerData.append(PickerDataSet(id: datum?.id ?? 0, title: datum?.value ?? ""))
                    }
                }
            case .none:
                break
            }
            createPickerView(section: indexPath.section, textField: cell.tfField, data: pickerData, dictionaryKey: key, key: type.rawValue)
        }
        return cell
    }
    
    
}

extension SearchUserFilterViewController : UIPickerViewDataSource, UIPickerViewDelegate
{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let picker = pickerView as? CustomPickerView
        {
            return picker.data.count
        }
        return 100
    }
    
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let picker = pickerView as? CustomPickerView
        {
            SignUpHelper.shared.optionsId[picker.key] = picker.data[row].id
            picker.textField.text = picker.data[row].title
            StorageHelper.shared.searchDataSet[picker.section].dic[picker.dictionaryKey]?.text = picker.data[row].title
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label:UILabel
        
        if let v = view as? UILabel{
            label = v
        }
        else{
            label = UILabel()
        }
        
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-SemiBold", size: 18)
        
        if let picker = pickerView as? CustomPickerView
        {
            label.text = picker.data[row].title
        }
        
        return label
    }
}
extension SearchUserFilterViewController : SearchUserFilterViewControllerProtocol
{
    
    func GetSearcedUserResponse(data : GetSearcedhUsersQuery.Data?,error : Error?)
    {
        self.hideLoadingIndicator()
        if let data = data {
            StorageHelper.shared.setSearchedData(data: data)
            let vc = UIStoryboard.init(name: "SearchedUser", bundle: Bundle.main).instantiateViewController(withIdentifier: "DisplaySearchUserViewController") as? DisplaySearchUserViewController
            self.navigationController?.pushViewController(vc!, animated: true)
//            self.push(viewController: SearchedUserViewController(), animated: true)
        }
        else{
            showErrorMessage(error?.localizedDescription ?? "")
        }
    }
}
