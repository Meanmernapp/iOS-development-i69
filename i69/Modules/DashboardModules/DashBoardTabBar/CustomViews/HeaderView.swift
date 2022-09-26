//
//  HeaderView.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//

import UIKit

class HeaderView: UIView {
    class func instanceFromNib(tabbar : DashBoardTabbarViewController?) -> HeaderView {
        
        let view = UINib(nibName: "HeaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HeaderView
        view.frame = CGRect(x: 0, y: ScreenSizeValues.statusBarHeight, width: UIScreen.main.bounds.width, height: 60)
        view.backgroundColor = .clear
        view.tabbar = tabbar
        return view
    
    }
    weak var tabbar: DashBoardTabbarViewController?
    @IBOutlet weak var tollBar: UIView!
    var navigationViewController : UINavigationController?
    @IBOutlet weak var lbTitle: UILabel!
    
    @IBOutlet weak var notificationView: UIView!
    
    @IBOutlet weak var otificationCount: UILabel!
    
    @IBAction func btnOpenNavigatonAction(_ sender: Any) {
        if navigationViewController?.viewControllers.count ?? 0 > 1{
            self.navigationViewController?.popViewController(animated: true)
            return
        }
        tabbar?.sideMenu?.toggleMenu()
    }
    
    @IBAction func btnNotificationAction(_ sender: Any) {
        let vc = NotificationsViewController(nibName: "NotificationsViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        if navigationViewController != nil {
            self.navigationViewController?.viewControllers.first?.present(vc, animated: false, completion: nil)
            return
        }
        
    }

}
