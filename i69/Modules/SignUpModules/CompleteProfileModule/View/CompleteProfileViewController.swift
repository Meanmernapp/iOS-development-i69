//
//  CompleteProfileViewController.swift
//  i69
//
//  Created by The Mac Store on 14/04/2022.
//

import UIKit

protocol CompleteProfileViewControllerProtocol: AnyObject {
    func completeResponse(data : UpdateUserProfileMutation.Data?,error : Error?)
}
class CompleteProfileViewController: BaseViewController {
    
    @IBOutlet weak var tbData: UITableView!
    @IBOutlet weak var cvPhotos: UICollectionView!
    
    var images = [UIImage]()
    var presenter: CompleteProfileViewPresenterProtocol?
    lazy var imagePicker = UIImagePickerController()
    var isCommingFoeEditing = false
    var arrSelectedImages = [UpdateImagesModel]()
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnDoneAction(_ sender: Any) {
        
        if images.count == 0
        {
            showErrorMessage("You must add a photo")
            return
        }
        if SignUpHelper.shared.completeTbDataSet[0].dic["Name"]?.text.count ?? 0 <= 0
        {
            showErrorMessage("Name cann't be empty")
            return
        }
       
        if SignUpHelper.shared.completeTbDataSet[0].dic["Gender"]?.text.count ?? 0 <= 0
//            (SignUpHelper.shared.optionsId[pickerType.genderPicker.rawValue] ?? -1) == -1
        {
            showErrorMessage("Gender cann't be empty")
            return
        }else{

        }
        if SignUpHelper.shared.completeTbDataSet[0].dic["Age"]?.text.count ?? 0 <= 0
        {
            showErrorMessage("Age cann't be empty")
            return
        }
        if SignUpHelper.shared.completeTbDataSet[0].dic["Height"]?.text.count ?? 0 <= 0
        {
            showErrorMessage("Height cann't be empty")
            return
        }
//        if (SignUpHelper.shared.optionsId[pickerType.genderPicker.rawValue] ?? -1) >= 0
//        {
//            showErrorMessage("Gender cann't be empty")
//            return
//        }
//        if (SignUpHelper.shared.optionsId[pickerType.agePicker.rawValue] ?? -1) >= 0
//        {
//            showErrorMessage("Age cann't be empty")
//            return
//        }
//        if (SignUpHelper.shared.optionsId[pickerType.heightsPicker.rawValue] ?? -1) >= 0
//        {
//            showErrorMessage("Height cann't be empty")
//            return
//        }
        SignUpHelper.shared.work = SignUpHelper.shared.completeTbDataSet[0].dic["Work"]?.text ?? ""
        SignUpHelper.shared.education = SignUpHelper.shared.completeTbDataSet[0].dic["Education"]?.text ?? ""
        
        showLoadingIndicator()
        self.presenter?.completeProfile(photos: images)
        
        

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        self.tbData.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SignUpHelper.shared.setTextFieldDic()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        
        AddCollectionViewCell.registerNib(collectionView: cvPhotos)
        UserPhotoCollectionViewCell.registerNib(collectionView: cvPhotos)
        cvPhotos.dataSource = self
        cvPhotos.delegate = self
        
        UserIntrestTableViewCell.registerNib(tableView: tbData)
        
        CompleteProfileSectionHeaderTableViewCell.registerNib(tableView: tbData)
        InputFiledsTableViewCell.registerNib(tableView: tbData)
        
        tbData.delegate = self
        tbData.dataSource = self
        if isCommingFoeEditing == true {
            for dataImages in ProfileStorageHelper.shared.user?.avatarPhotos ?? [] {
                let urlImage = URL(string:dataImages?.url ?? "")
                  if let data = try? Data(contentsOf: urlImage!)
                  {
                      let image: UIImage = UIImage(data: data)!
//                      let imgData = UpdateImagesModel(selectimg: image, selectId: dataImages?.id)
                     images.append(image)
                  }
            }
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
        
        
        textField.inputView = picker
        
        
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
    
    @objc func closePickerView()
    {
        view.endEditing(true)
    }

}

extension CompleteProfileViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isCommingFoeEditing == true{
            return ProfileStorageHelper.shared.user?.avatarPhotos?.count ?? 0 + 1
        }else{
            return images.count + 1
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 142, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        
        
        if indexPath.row == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddCollectionViewCell", for: indexPath) as! AddCollectionViewCell
        
            cell.setupView()
            return  cell
        }
        
        if isCommingFoeEditing == true {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserPhotoCollectionViewCell", for: indexPath) as! UserPhotoCollectionViewCell
            let url = ProfileStorageHelper.shared.user?.avatarPhotos?[indexPath.row]?.url ?? ""
            cell.imImage.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: ""))
            return  cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserPhotoCollectionViewCell", for: indexPath) as! UserPhotoCollectionViewCell
            cell.imImage.image = images[indexPath.row - 1]
            cell.deleteCallback = {
                self.deleteItem(indexPath: indexPath)
            }
            return  cell
        }
        
        return  UICollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0
        {
            isCommingFoeEditing = false
            cvPhotos.reloadData()
            showImagePickerSheet()
        }
    }
    
    func deleteItem(indexPath : IndexPath)
    {
        if images.count >= indexPath.row - 1 {
        images.remove(at: indexPath.row - 1)
            cvPhotos.deleteItems(at: [indexPath])
            
        }
    }
    func addItem()
    {
        let index = IndexPath(row: images.count, section: 0)
        cvPhotos.insertItems(at: [index])
    }
}
extension CompleteProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showImagePickerSheet() {
        let alert = UIAlertController(title: nil, message: "Upload image from", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .destructive, handler: { _ in
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Photos", style: .default, handler: { _ in
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in

        }))
        self.present(alert, animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.editedImage] as? UIImage {
            self.images.append(image)
            addItem()
        }
    }
}
extension CompleteProfileViewController : UIPickerViewDataSource, UIPickerViewDelegate
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
            SignUpHelper.shared.completeTbDataSet[picker.section].dic[picker.dictionaryKey]?.text = picker.data[row].title
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
extension CompleteProfileViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let dataSet = SignUpHelper.shared.completeTbDataSet[section]
        let increment : Int = section == 0 ? 0 : 1
        let rows = dataSet.open || dataSet.title.count == 0 ? ( dataSet.keys.count + increment) : 1
        
        return rows
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    func insertRows(section : Int)
    {
        let indexPaths = (0 ..< SignUpHelper.shared.completeTbDataSet[section].keys.count).map { IndexPath(row: $0, section: section) }
        self.tbData.insertRows(at: indexPaths, with: .bottom)
        self.tbData.scrollToRow(at: indexPaths[0], at: .top, animated: true)
        
    }
    func deleteRows(section : Int)
    {
        self.tbData.reloadSections(IndexSet(integer: section), with: .top)
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row == 0 && indexPath.section != 0
        {
            let headerView = CompleteProfileSectionHeaderTableViewCell.getCell(tableView: tableView)
            headerView.lbTitle.text = SignUpHelper.shared.completeTbDataSet[indexPath.section].title
            headerView.openCloseClicked = {
                SignUpHelper.shared.completeTbDataSet[indexPath.section].open = !SignUpHelper.shared.completeTbDataSet[indexPath.section].open
                if SignUpHelper.shared.completeTbDataSet[indexPath.section].open
                {
                    self.insertRows(section: indexPath.section)
                }
                else{
                    self.deleteRows(section: indexPath.section)
                }
                headerView.setImage(open: SignUpHelper.shared.completeTbDataSet[indexPath.section].open)
            }
            headerView.setImage(open: SignUpHelper.shared.completeTbDataSet[indexPath.section].open)
            return headerView
        }
        
        let index = indexPath.section == 0 ? indexPath.row : indexPath.row - 1
        let key = SignUpHelper.shared.completeTbDataSet[indexPath.section].keys[index]
        if indexPath.section == 2
        {
            let cell = UserIntrestTableViewCell.getCell(tableView: tableView)
            cell.initialise(title: key)
            cell.addIntrestClicked = {
                self.presenter?.navigateToAddTagsModule(tag: key)
            }
            return cell
        }
        let cell = InputFiledsTableViewCell.getCell(tableView: tableView)
        cell.initialise(section: indexPath.section, key: key,set: SignUpHelper.shared.completeTbDataSet[indexPath.section])
        let type = SignUpHelper.shared.completeTbDataSet[indexPath.section].dic[key]?.type ?? .none
        cell.vLine.isHidden = index >= (SignUpHelper.shared.completeTbDataSet[indexPath.section].keys.count - 1)
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
                createToolbar(textFields: [cell.tfField])
            }
            createPickerView(section: indexPath.section, textField: cell.tfField, data: pickerData, dictionaryKey: key, key: type.rawValue)
        }
        
        return cell
    }
    
    
}
extension CompleteProfileViewController : CompleteProfileViewControllerProtocol
{
    
    func completeResponse(data : UpdateUserProfileMutation.Data?,error : Error?)
    {
        self.hideLoadingIndicator()
        if error != nil
        {
            showErrorMessage(error?.localizedDescription ?? "")
            return
        }
        if !isCommingFoeEditing {
            self.presenter?.navigateToWelcomeModule()
        }
        
    }
}


class UpdateImagesModel:NSObject{
    
    var img = UIImage()
    var id:Int? = 0

    init(selectimg:UIImage, selectId:Int) {
        self.img = selectimg
        self.id = selectId
       
    }
}
