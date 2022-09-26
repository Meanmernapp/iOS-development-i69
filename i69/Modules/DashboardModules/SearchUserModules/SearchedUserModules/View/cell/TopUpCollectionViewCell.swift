//
//  TopUpCollectionViewCell.swift
//  i69
//
//  Created by The Mac Store on 27/04/2022.
//

import UIKit

class TopUpCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func registerNib(collectionView : UICollectionView)
    {
        let nib = UINib(nibName: "TopUpCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "TopUpCollectionViewCell")
    }
}
