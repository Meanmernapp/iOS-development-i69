//
//  ChatImageTableViewCell.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 02/06/2022.
//

import UIKit
import AVKit
protocol playButton {
    func buttonUrl(tag:Int)
}
class ChatImageTableViewCell: UITableViewCell {
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var leftConstant: NSLayoutConstraint!
    @IBOutlet weak var rightConstant: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var playButton: UIButton!
    
    //MARK: - Variables
    var delegate : playButton?
    var image : UIImage?
    
    
    //MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    //MARK: - Functions
    
    func config(message : ChatMessage) {
        self.playButton.isHidden = true
        imgView.loadImageWithCallBack(url: message.content) { image in
            if image == nil {
                if let _ = URL(string: message.content) {
                    self.getThumbnailFromUrl(message.content) { image in
                        if image == nil {
                            self.imgView.image = UIImage(named: "broken")
                            self.playButton.isHidden = true
                        }
                        else {
                            self.playButton.isHidden = false
                            self.imgView.image = image
                        }
                    }

                }
            }
            else {
                self.playButton.isHidden = true
            }
        }
    }
    @IBAction func playButtonAction(_ sender: UIButton) {
        self.delegate?.buttonUrl(tag: sender.tag)
    }
    
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "ChatImageTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "ChatImageTableViewCell")
    }
    static func getCell(tableView : UITableView) -> ChatImageTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatImageTableViewCell") as! ChatImageTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    func getThumbnailFromUrl(_ url: String?, _ completion: @escaping ((_ image: UIImage?)->Void)) {
            
            guard let url = URL(string: (url ?? "")) else { return }
            DispatchQueue.main.async {
                let asset = AVAsset(url: url)
                let assetImgGenerate = AVAssetImageGenerator(asset: asset)
                assetImgGenerate.appliesPreferredTrackTransform = true
                
                let time = CMTimeMake(value: 2, timescale: 1)
                do {
                    let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
                    let thumbnail = UIImage(cgImage: img)
                    completion(thumbnail)
                } catch let error{
                    print("Error :: ", error)
                    completion(nil)
                }
            }
        }
}
