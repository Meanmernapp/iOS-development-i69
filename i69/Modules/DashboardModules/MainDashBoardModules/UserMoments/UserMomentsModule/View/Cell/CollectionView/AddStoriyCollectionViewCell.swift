//
//  AddStoriyCollectionViewCell.swift
//  i69
//
//  Created by The Mac Store on 22/04/2022.
//

import UIKit

class AddStoriyCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    static func registerNib(collectionView : UICollectionView)
    {
        let nib = UINib(nibName: "AddStoriyCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "AddStoriyCollectionViewCell")
    }
}
