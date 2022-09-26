//
//  UserDataViewController.swift
//  i69
//
//  Created by The Mac Store on 27/04/2022.
//

import UIKit

class UserDataViewController: pagerViewController {
    @IBOutlet weak var tfSearch: UITextField!
    var data = [SearchUser]()
    @IBOutlet weak var cvData: UICollectionView!
    var pagerMainController : SearchPagerViewController?
    
    @IBOutlet weak var vNoResult: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TopUpCollectionViewCell.registerNib(collectionView: cvData)
        SearchedUserCollectionViewCell.registerNib(collectionView: cvData)
        cvData.dataSource = self
        cvData.delegate = self
        
        vNoResult.isHidden = data.count > 0
        cvData.isHidden = !vNoResult.isHidden
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        pagerMainController?.indexSelected(self.controllerIndex)
    }

}

extension UserDataViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count + 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        let height = UIScreen.main.bounds.width/2
        return CGSize(width: UIScreen.main.bounds.width/2, height: height + 35)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0
        {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopUpCollectionViewCell", for: indexPath) as! TopUpCollectionViewCell
            
            return  cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchedUserCollectionViewCell", for: indexPath) as! SearchedUserCollectionViewCell
        
        cell.initialise(user: data[indexPath.row - 1])
        
        return  cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.reloadItems(at: [indexPath])
        if indexPath.item == 0 {
            
        }
        
        else {
            if let user = StorageHelper.shared.getUserById(id: data[indexPath.row - 1].id)
            {
                ProfileStorageHelper.shared.user = user
            }
            let vc = UIStoryboard.init(name: "UserProfile", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
            self.navigationController?.pushViewController(vc!, animated: true)
        }

        
    }
    
    
    
}
class pagerViewController : BaseTabBarViewController
{
    var controllerIndex = 0
}
