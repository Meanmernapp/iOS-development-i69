//
//  AddCollectionViewCell.swift
//  i69
//
//  Created by The Mac Store on 14/04/2022.
//

import UIKit

class AddCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var vBackground: GradientView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func registerNib(collectionView : UICollectionView)
    {
        let nib = UINib(nibName: "AddCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "AddCollectionViewCell")
    }
    func setupView()
    {
        vBackground.addLineDashedStroke(pattern: [4,4], radius: 14, color: UIColor(named: "golden")?.cgColor ?? UIColor.systemYellow.cgColor)
    }

}
