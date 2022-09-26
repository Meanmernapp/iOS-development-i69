//
//  CoinsPricingTableViewCell.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 11/06/2022.
//

import UIKit

class CoinsPricingTableViewCell: UITableViewCell {

    
    //MARK: - IBOutlets

    @IBOutlet weak var coinsLbl: UILabel!
    @IBOutlet weak var actualPrice: UILabel!
    @IBOutlet weak var discountedPrice: UILabel!
    let actualPriceArray = ["€8.99","€12.99","€19.99","€34.99","€66.99","€149.99"]
    let discountPriceArray = ["4.99","9.99","14.99","24.99","49.99","99.99"]
    let coinsArray = ["100","250","500","1150","2550","5600"]
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    //MARK: - Functions
    
    func config(index:Int) {
        let attributedText = NSAttributedString(
            string:actualPriceArray[index] ,
            attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
        )
        actualPrice.attributedText = attributedText
        coinsLbl.text = coinsArray[index]
        discountedPrice.text = discountPriceArray[index]
        
    }
}


