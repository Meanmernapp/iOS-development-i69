//
//  UserIntrestCollectionViewCell.swift
//  i69
//
//  Created by The Mac Store on 15/04/2022.
//

import UIKit

class UserIntrestCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var vBackground: GradientView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func initialise(title : String)
    {
        self.lbTitle.text = title
        self.vBackground.setSocialGradianGolden()
        
    }
    static func registerNib(collectionView : UICollectionView)
    {
        let nib = UINib(nibName: "UserIntrestCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "UserIntrestCollectionViewCell")
    }
}
