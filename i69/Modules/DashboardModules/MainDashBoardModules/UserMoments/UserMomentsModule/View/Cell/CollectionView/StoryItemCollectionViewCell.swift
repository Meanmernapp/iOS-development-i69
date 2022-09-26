//
//  StoryItemCollectionViewCell.swift
//  i69
//
//  Created by The Mac Store on 22/04/2022.
//

import UIKit
import AVKit

class StoryItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imProfile: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var imStory: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func registerNib(collectionView : UICollectionView)
    {
        let nib = UINib(nibName: "StoryItemCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "StoryItemCollectionViewCell")
    }
    var edge : MomentListModel?
    func initialise(edge : MomentListModel)
    {
        self.edge = edge
        imProfile.loadImage(url: edge.url ?? "")
        lbName.text = edge.fullName ?? ""
        if let image = edge.image
        {
            self.imStory.image = image
        }
        else{
            let url = "\(ApiKeys.baseUrl)media/\(edge.file ?? "")"
            if (edge.fileType ?? "video").compare("video").rawValue == 0
            {
                imStory.downloadAndLoad(moment: self.edge, url: url)
            }
            else
            {
                imStory.loadImage(url: url)
            }
        }
    }
    
    func imageFromVideo(url: URL, at time: TimeInterval) -> UIImage? {
        let asset = AVURLAsset(url: url)

        let assetIG = AVAssetImageGenerator(asset: asset)
        assetIG.appliesPreferredTrackTransform = true
        assetIG.apertureMode = .encodedPixels

        let cmTime = CMTime(seconds: time, preferredTimescale: 60)
        let thumbnailImageRef: CGImage
        do {
            thumbnailImageRef = try assetIG.copyCGImage(at: cmTime, actualTime: nil)
        } catch let error {
            print("Error: \(error)")
            return nil
        }

        return UIImage(cgImage: thumbnailImageRef)
    }
}
