//
//  GiftsTableViewCell.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 05/06/2022.
//

import UIKit

class GiftsTableViewCell: UITableViewCell {

    @IBOutlet weak var giftNameLbl: UILabel!
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var giftImg: UIImageView!
    @IBOutlet weak var coinsLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func config(data:GetSentGiftsQuery.Data.AllUserGift.Edge?) {
        if let url = data?.node?.receiver?.avatar?.url {
            userImg.loadImage(url: url)
        }
        if let url = data?.node?.gift.url {
            giftImg.loadImage(url: "https://api.chatadmin-mod.click/"+url)
        }
        self.nameLbl.text = data?.node?.receiver?.fullName
        self.dateLbl.text = data?.node?.purchasedOn?.getRelativeTime()
        self.giftNameLbl.text = data?.node?.gift.giftName
        self.coinsLbl.text = "\(data?.node?.gift.cost ?? 0.0)"
    }
    func configForReceive (data:GetReceivedGiftsQuery.Data.AllUserGift.Edge?) {
        
        if let url = data?.node?.receiver?.avatar?.url {
            userImg.loadImage(url: url)
        }
        if let url = data?.node?.gift.url {
            giftImg.loadImage(url: "https://api.chatadmin-mod.click/"+url)
        }
        self.nameLbl.text = data?.node?.receiver?.fullName
        self.dateLbl.text = data?.node?.purchasedOn?.getRelativeTime()
        self.giftNameLbl.text = data?.node?.gift.giftName
        self.coinsLbl.text = "\(data?.node?.gift.cost ?? 0.0)"
        
    }
    
}
