//
//  TagCollectionViewCell.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var vBackground: GradientView!
    @IBOutlet weak var lbTagTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func registerNib(collectionView : UICollectionView)
    {
        let nib = UINib(nibName: "TagCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "TagCollectionViewCell")
    }
    
    func initialise(tags : TagsModel)
    {
        self.lbTagTitle.text = tags.title.uppercased()
        selectDeselectCell(select: tags.selected)
        
    }
    func selectDeselectCell(select : Bool)
    {
        self.vBackground.removeGradientColor()
        if !select
        {
            self.vBackground.setSocialGradian()
        }
        else{
            self.vBackground.setSocialGradianGolden()
        }
        self.lbTagTitle.textColor = select ? UIColor.black : UIColor(named: "golden")
        
        
    }

}
