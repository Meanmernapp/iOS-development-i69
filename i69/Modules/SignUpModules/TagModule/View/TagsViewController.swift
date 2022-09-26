//
//  TagsViewController.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import UIKit
import Apollo

protocol TagsViewControllerProtocol: AnyObject {
    func fetchDefaultPickerResponse(error : Error?)
}
class TagsViewController: BaseViewController {
    
    var presenter: TagsViewPresenterProtocol?
//    var tags = [TagsModel]()
    
    
    @IBOutlet weak var vToolBar: UIView!
    @IBOutlet weak var cvTags: UICollectionView!
    
    @IBAction func btnNextAction(_ sender: Any) {
        
        var tagClickedCount : Int = 0
        SignUpHelper.shared.tagIds = [Int]()
        for tag in SignUpHelper.shared.tags {
            if tag.selected
            {
                SignUpHelper.shared.tagIds.append(tag.id)
                tagClickedCount = tagClickedCount + 1
            }
        }
        if tagClickedCount < 0
        {
            showErrorMessage("Please select at least 3 tags")
            return
        }
        self.presenter?.navigateToAboutModule()
    }
    
    @IBAction func btnBackPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        vToolBar.applySocialGradientGolden()
        TagCollectionViewCell.registerNib(collectionView: cvTags)
        cvTags.dataSource = self
        cvTags.delegate = self
        
        self.showLoadingIndicator()
        
        self.presenter?.fetchDefaultPickers()

        // Do any additional setup after loading the view.
    
    }

}
extension TagsViewController : TagsViewControllerProtocol
{
    func fetchDefaultPickerResponse(error : Error?)
    {
        hideLoadingIndicator()
        cvTags.reloadData()
    }
}

extension TagsViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return SignUpHelper.shared.tags.count
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let coulum : CGFloat = (CGFloat)(SignUpHelper.shared.tags[indexPath.row].rowCount)
        
        
        return CGSize(width: ((UIScreen.main.bounds.width)/coulum) - 20, height: 42)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as! TagCollectionViewCell
        
        cell.initialise(tags: SignUpHelper.shared.tags[indexPath.row])
        return  cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        SignUpHelper.shared.tags[indexPath.row].selected = !SignUpHelper.shared.tags[indexPath.row].selected
        collectionView.reloadItems(at: [indexPath])
    }
    
    
}
