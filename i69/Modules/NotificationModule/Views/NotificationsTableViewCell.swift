//
//  NotificationsTableViewCell.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 04/06/2022.
//

import UIKit

class NotificationsTableViewCell: UITableViewCell {
    
    
    //MARK: - IBOutlets

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    var fetchNewNotificatons : (()->())?
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    //MARK: - Functions
    
    func config(data : GetAllNotificationQuery.Data.Notification.Edge?) {
        self.titleLbl.text = data?.node?.notificationSetting?.title
        self.descriptionLbl.text = data?.node?.notificationBody
        self.timeLbl.text = data?.node?.createdDate?.getRelativeTime()
    }
}
