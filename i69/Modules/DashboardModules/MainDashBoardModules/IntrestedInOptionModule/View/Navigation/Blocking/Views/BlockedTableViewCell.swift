//
//  BlockedTableViewCell.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 12/06/2022.
//

import UIKit

class BlockedTableViewCell: UITableViewCell {
    
    
    //MARK: - IBOutlets -

    @IBOutlet weak var unblockButton: UIButton!
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var userImg: UIImageView!
    
    
    //MARK: - LifeCycle -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    //MARK: - Functions -
    func config(blockedUser: BlockedUsersQuery.Data.BlockedUser?) {
        self.nameLbl.text = blockedUser?.username ?? ""
    }
    
}
