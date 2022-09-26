//
//  GiftsCollectionViewCell.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 06/06/2022.
//

import UIKit

class GiftsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var coinsLbl: UILabel!
    @IBOutlet weak var giftImage: UIImageView!
    @IBOutlet weak var checkImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(data:AllGiftsQuery.Data.AllGift?) {
        self.nameLbl.text = data?.giftName
        self.coinsLbl.text = "\(data?.cost ?? 0.0) Coins"
        if let url = data?.url {
            self.giftImage.loadImage(url: "https://api.chatadmin-mod.click/"+url)
        }
    }
}
