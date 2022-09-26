//
//  PhotoHeaderCollectionViewCell.swift
//  i69
//
//  Created by The Mac Store on 20/04/2022.
//

import UIKit

class PhotoHeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func registerNib(collectionView : UICollectionView)
    {
        let nib = UINib(nibName: "PhotoHeaderCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "PhotoHeaderCollectionViewCell")
    }
}
