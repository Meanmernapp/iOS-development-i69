//
//  UserSearchCollectionViewCell.swift
//  i69
//
//  Created by The Mac Store on 27/04/2022.
//

import UIKit

class UserSearchCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tfSearch: UITextField!
    var data = [SearchUser]()
    @IBOutlet weak var cvData: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initialise(data : [SearchUser])
    {
        self.data = data
        cvData.dataSource = self
        cvData.delegate = self
        TopUpCollectionViewCell.registerNib(collectionView: cvData)
        SearchedUserCollectionViewCell.registerNib(collectionView: cvData)
    }
    
    static func registerNib(collectionView : UICollectionView)
    {
        let nib = UINib(nibName: "UserSearchCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "UserSearchCollectionViewCell")
    }
}
extension UserSearchCollectionViewCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
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
        SignUpHelper.shared.tags[indexPath.row].selected = !SignUpHelper.shared.tags[indexPath.row].selected
        collectionView.reloadItems(at: [indexPath])
    }
    
    
}
