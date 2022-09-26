//
//  MomentsTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 22/04/2022.
//

import UIKit
import AVKit

class MomentsTableViewCell: UITableViewCell {
    
    
    //MARK: - IBOutlets

    @IBOutlet weak var imProfileImage: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbComment: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var imImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var commentButton: UIButton!
    @IBOutlet weak var btnLikes: UIButton!
    @IBOutlet weak var btnComments: UIButton!
    @IBOutlet weak var giftButton: UIButton!
    
    
    //MARK: - Variables
    
    var moment : MomentListModel?
    var likeMomentCallBack : ((Int?,Int?)->())?
    var giftPurchaseCallback : ((MomentListModel?)->())?
    var commentCallback : ((MomentListModel?)->())?
    
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    //MARK: - IBAction
    
    
    @IBAction func likeAction(_ sender: UIButton) {
        GraphQLClient.shared.performMutation(mutation: LikeMomentMutation(momentID: "\(self.moment?.id ?? 0)")) { result, err in
                self.likeMomentCallBack?(sender.tag,self.moment?.likeCount ?? 0)
//            }
        }
    }
    
    @IBAction func commentsAction(_ sender: Any) {
        self.commentCallback?(self.moment)
    }
    @IBAction func giftAction(_ sender: UIButton) {
        self.giftPurchaseCallback?(self.moment)
    }
    
    @IBAction func commentAction(_ sender: Any) {
        
    }
    func setAttributeString(text : String,underlinePosition: [[Int]])
    {
        
        let myMutableString = NSMutableAttributedString(string: text, attributes: [NSAttributedString.Key.font :lbName.font!])
        for position in underlinePosition
        {
            myMutableString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "golden")!, range: NSRange(location:position[0],length:position[1]))
        }
        lbName.attributedText = myMutableString
    }
    func initialise(moment : MomentListModel)
    {
        self.moment = moment
        
        let url = "\(ApiKeys.baseUrl)media/\(moment.file ?? "")"
        
        print("found_image --- \(url)")
        if let image = self.moment?.image
        {
            print("found image --- \(url)")
            imImage.image = image
        }
        else{
            if url.contains(".mp4")
            {
                imImage.downloadAndLoad(moment: self.moment, url: url)
            }
            else{
                imImage.loadImage(url: url,moment: self.moment)
            }
        }
        imProfileImage.loadImage(url: moment.url ?? "")
        var commentDescription = ""
        if let descriptions = moment.momentDescriptionPaginated
        {
            for description in descriptions {
                if let val = description
                {
                    if val.count > 0
                    {
                        commentDescription = "\(commentDescription)\(commentDescription.count > 0 ? " " : "")\(val)"
                    }
                }
            }
        }
        lbComment.text = commentDescription
        let name = moment.fullName ?? ""
        setAttributeString(text: "Near by users \(name) has shared a moment", underlinePosition: [["Near by users".count + 1,name.count]])
        lbTime.text = (moment.createdDate ?? "").getRelativeTime()
        
        btnLikes.setTitle(" \(moment.likeCount ?? 0)", for: .normal)
        btnComments.setTitle(" \(moment.commentCount ?? 0)", for: .normal)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "MomentsTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "MomentsTableViewCell")
    }
    static func getCell(tableView : UITableView) -> MomentsTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MomentsTableViewCell") as! MomentsTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
}
