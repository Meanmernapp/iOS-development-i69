//
//  UserPhotoCollectionViewCell.swift
//  i69
//
//  Created by The Mac Store on 14/04/2022.
//

import UIKit

class UserPhotoCollectionViewCell: UICollectionViewCell {
    
    var deleteCallback : (()->())?
    
    @IBOutlet weak var imImage: UIImageView!
    
    
    @IBAction func btnDeletePhotoAction(_ sender: Any) {
        deleteCallback?()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func registerNib(collectionView : UICollectionView)
    {
        let nib = UINib(nibName: "UserPhotoCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "UserPhotoCollectionViewCell")
    }

}
