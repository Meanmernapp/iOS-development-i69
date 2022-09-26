//
//  StoryViewController.swift
//  i69
//
//  Created by The Mac Store on 22/04/2022.
//

import UIKit
import AVKit

class StoryViewController: UIViewController {
    @IBOutlet weak var vMain: UIView!
    @IBOutlet weak var iImageStory: UIImageView!
    @IBOutlet weak var btnLike: UIButton!
    @IBOutlet weak var btnComment: UIButton!
    @IBOutlet weak var imProfileImage: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var pProgress: UIProgressView!
    var edge : MomentListModel?
    var timer = Timer()
    
    @IBAction func btnCloseAction(_ sender: Any) {
        self.timer.invalidate()
        self.dismiss(animated: true)
    }
    @objc func playerStartPlaying(note: NSNotification) {
        print("Video playerStartPlaying")
        startTimer()
    }
    @objc func playerDidFinishPlaying(note: NSNotification) {
        print("Video Finished")
        btnCloseAction(UIButton())
//        startTimer()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        imProfileImage.loadImage(url: edge?.url ?? "")
        
        let url = "\(ApiKeys.baseUrl)media/\(edge?.file ?? "")"
        
        print("baseUrl---- \(url)")
        
        if (edge?.fileType ?? "").lowercased().compare("video").rawValue == 0
        {
            iImageStory.isHidden = true
            
            if let videoUrl = URL(string: url){

                let player = AVPlayer(url: videoUrl)
                let playerLayer = AVPlayerLayer(player: player)
                playerLayer.frame = self.view.bounds
                self.view.layer.addSublayer(playerLayer)
                self.view.bringSubviewToFront(self.vMain)
                player.play()
                NotificationCenter.default
                    .addObserver(self,
                    selector: #selector(playerDidFinishPlaying),
                                 name: .AVPlayerItemDidPlayToEndTime,
                    object: player.currentItem
                )
                NotificationCenter.default
                    .addObserver(self,
                    selector: #selector(playerStartPlaying),
                                 name: .AVCaptureSessionDidStartRunning,
                    object: player.currentItem
                )
            }
        }
        else{
            iImageStory.loadImage(url: url)
            startTimer()
        }
        let name = edge?.fullName ?? ""
        lbName.text = name
        lbTime.text = (edge?.createdDate ?? "").getRelativeTime()
        
        btnLike.setTitle(" \(edge?.likeCount ?? 0)", for: .normal)
        btnComment.setTitle(" \(edge?.commentCount ?? 0)", for: .normal)
        // Do any additional setup after loading the view.
    }
    func startTimer()
    {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
    }
    @objc func updateProgress() {
        self.pProgress.progress = self.pProgress.progress + 0.025
        if self.pProgress.progress >= 1
        {
            btnCloseAction(UIButton() )
        }
    }

}
