//
//  SearchedUserCollectionViewCell.swift
//  i69
//
//  Created by The Mac Store on 27/04/2022.
//

import UIKit

class SearchedUserCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imProfile: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func initialise(user : SearchUser)
    {
        let age = (SignUpHelper.shared.filter?.agePicker?.count ?? -1 > user.age ? SignUpHelper.shared.filter?.agePicker?[user.age]?.value ?? 0 : user.age)
        lbName.text = "\(user.name), \(age)"
        
        
        imProfile.loadImage(url: user.url)
        
        imProfile.layer.cornerRadius = (UIScreen.main.bounds.width/4 - 20)
        imProfile.layer.borderWidth = 2
        imProfile.layer.borderColor = UIColor(named: "golden")?.cgColor
    }
    static func registerNib(collectionView : UICollectionView)
    {
        let nib = UINib(nibName: "SearchedUserCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "SearchedUserCollectionViewCell")
    }
}
