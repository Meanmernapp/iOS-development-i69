//
//  BottomBarView.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//

import UIKit
import SDWebImage

class BottomBarView: UIView {

    class func instanceFromNib(tabbar : DashBoardTabbarViewController) -> BottomBarView {
        
        let view = UINib(nibName: "BottomBarView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! BottomBarView
        view.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - 75, width: UIScreen.main.bounds.width, height: 75)
        view.backgroundColor = .clear
        view.tabbar = tabbar
        return view
    
    }
    weak var tabbar: DashBoardTabbarViewController?
    
    @IBOutlet weak var imProfile: UIImageView!
    
    @IBAction func btnSearchAction(_ sender: Any) {
        tabSelected(index: 0)
    }
    @IBAction func btnAddMoment(_ sender: Any) {
        tabSelected(index: 2)
        
        
    }
    @IBAction func btnHomeAction(_ sender: Any) {
        tabSelected(index: 1)
        
        
    }
    @IBAction func btnMessengerAction(_ sender: Any) {
        tabSelected(index: 3)
        
        
    }
    @IBAction func btnUserProfile(_ sender: Any) {
        ProfileStorageHelper.shared.user = StorageHelper.shared.user
        if ProfileStorageHelper.shared.user != nil {
            tabSelected(index: 4)
        }
    }
    func tabSelected(index : Int)
    {
        if let nav = tabbar?.viewControllers?[index] as? UINavigationController
        {
            if nav.viewControllers.count > 1
            {
                nav.popToRootViewController(animated: true)
            }
            
        }
        self.tabbar?.selectedIndex = index
    }
    func loadProfileImage(url : String)
    {
        imProfile.loadBottomBarImageWithCallBack(url: url) { imageData in
            StorageHelper.shared.userImage = imageData ?? UIImage()
        }
        
    }

}
