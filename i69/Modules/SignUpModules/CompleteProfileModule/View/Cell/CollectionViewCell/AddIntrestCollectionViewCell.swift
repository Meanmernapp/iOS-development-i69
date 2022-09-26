//
//  AddIntrestCollectionViewCell.swift
//  i69
//
//  Created by The Mac Store on 16/04/2022.
//

import UIKit

class AddIntrestCollectionViewCell: UICollectionViewCell {
    
    
    var addIntrestClicked : (()->())?
    
    @IBOutlet weak var btnPlus: UIButton!
    
    @IBAction func btnPlusAction(_ sender: Any) {
        addIntrestClicked?()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setDesign()
    {
        btnPlus.imageView?.contentMode = .scaleToFill
//        btnPlus.imageView?.contentScaleFact
    }
    static func registerNib(collectionView : UICollectionView)
    {
        let nib = UINib(nibName: "AddIntrestCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "AddIntrestCollectionViewCell")
    }
}
