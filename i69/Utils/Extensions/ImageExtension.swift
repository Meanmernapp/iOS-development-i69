//
//  ImageExtension.swift
//  i69
//
//  Created by The Mac Store on 22/04/2022.
//

import UIKit
import AVKit
import SDWebImage

extension UIImageView
{
    func loadImage(url : String,placeholder : String = "",moment : MomentListModel? = nil)
    {
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_imageIndicator?.startAnimatingIndicator()
        self.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: placeholder),completed: {image,error,_,_ in
            self.sd_imageIndicator?.stopAnimatingIndicator()
            moment?.image = image
        })
    }
    func loadImageWithoutPlaceHolder(url : String,placeholder : String = "")
    {
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_imageIndicator?.startAnimatingIndicator()
        self.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: placeholder),completed: {image,error,_,_ in
            self.sd_imageIndicator?.stopAnimatingIndicator()
        })
    }
    
    func loadImageWithCallBack(url : String,callBack : @escaping ((_ imageData:UIImage?)-> Void))
    {
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_imageIndicator?.startAnimatingIndicator()
        self.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: ""),completed: {(image,error,_,_) in
            self.sd_imageIndicator?.stopAnimatingIndicator()
            callBack(image)
        })
    }
    func loadBottomBarImageWithCallBack(url : String,callBack : @escaping ((_ imageData:UIImage?)-> Void))
    {
        self.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.sd_imageIndicator?.startAnimatingIndicator()
        self.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "profile"),completed: {(image,error,_,_) in
            self.sd_imageIndicator?.stopAnimatingIndicator()
            callBack(image)
        })
    }
    func downloadAndLoad(moment : MomentListModel?,url : String)
    {
        let u = URL(string: url)
        DispatchQueue.global(qos: .background).async {
            let image = self.imageFromVideo(url: u!, at: 0)

            DispatchQueue.main.async {
                let fileUrl = "\(ApiKeys.baseUrl)media/\(moment?.file ?? "")"
                if url.compare(fileUrl).rawValue == 0
                {
                    self.image = image
                }
                moment?.image = image
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
