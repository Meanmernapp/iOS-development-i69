//
//  BaseViewController.swift
//  i69
//
//  Created by The Mac Store on 10/04/2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    static var loadingVView : LoadingView?
    static var errorView : ErrorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
    }
    func push(viewController controller: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
//    override var preferredStatusBarStyle: UIStatusBarStyle {
//        .lightContent
//    }
    func showLoadingIndicator()
    {
        if BaseViewController.loadingVView == nil
        {
            BaseViewController.loadingVView = LoadingView.instanceFromNib()
            if self.navigationController == nil {
                self.view.addSubview(BaseViewController.loadingVView!)
                BaseViewController.loadingVView?.frame = self.view.frame
            }
            else {
                self.navigationController?.view.addSubview(BaseViewController.loadingVView!)
                BaseViewController.loadingVView?.frame = self.navigationController?.view.frame ?? CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

            }
            BaseViewController.loadingVView?.layoutIfNeeded()
            

        }
        self.navigationController?.view.bringSubviewToFront(BaseViewController.loadingVView!)
        BaseViewController.loadingVView?.isHidden = false
    }
    func hideLoadingIndicator()
    {
        BaseViewController.loadingVView?.isHidden = true
    }
    func showErrorMessage(error : NSError?)
    {
        if let err = error
        {
            if err.userInfo.count > 0
            {
                for userInfo in err.userInfo
                {
                    if let message = userInfo.value as? String
                    {
                        showErrorMessage(message)
                        return
                    }
                }
            }
        }
    }
    func showErrorMessage(_ error : String)
    {
        
        if BaseViewController.errorView == nil
        {
            BaseViewController.errorView = ErrorView.instanceFromNib()
            if self.navigationController == nil {
                self.view.addSubview(BaseViewController.errorView!)
                BaseViewController.errorView?.frame = self.view.frame
                BaseViewController.errorView?.layoutIfNeeded()
                self.view.bringSubviewToFront(BaseViewController.errorView!)
            }
            else {
                self.navigationController?.view.addSubview(BaseViewController.errorView!)
                BaseViewController.errorView?.frame = self.navigationController?.view.frame ?? CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                BaseViewController.errorView?.layoutIfNeeded()
                self.navigationController?.view.bringSubviewToFront(BaseViewController.errorView!)
            }
            

        }
        
        BaseViewController.errorView?.lbTitle.text = error
        BaseViewController.errorView?.showView()
    }
    func hideErrorMessage()
    {
        BaseViewController.errorView?.hideView()
    }
    
    func getImageUrlThroughFileName(fileName: String) -> URL? {

      let documentDirectory = FileManager.SearchPathDirectory.documentDirectory

        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)

        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            return imageUrl
//            let image = UIImage(contentsOfFile: imageUrl.path)
//            return image

        }

        return nil
    }
    
    func getImageFromURL(fileName: String) -> UIImage? {

      let documentDirectory = FileManager.SearchPathDirectory.documentDirectory

        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)

        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
//            return imageUrl
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image

        }

        return nil
    }
}

class BaseTabBarViewController: BaseViewController {
    func addHeaderMain(view : UIView,title : String ,_ notificationCount:Int = 0)
    {
        let header = HeaderView.instanceFromNib(tabbar: self.navigationController?.tabBarController as? DashBoardTabbarViewController)
        header.frame = CGRect(x: 0, y: 0, width: view.layer.bounds.width, height: 60)
        header.lbTitle.text = title.uppercased()
        header.clipsToBounds = false
        header.navigationViewController = self.navigationController
        header.backgroundColor = UIColor(named: "toolbar_color")
        if notificationCount > 0 {
            header.notificationView.isHidden = false
        }
        else {
            header.notificationView.isHidden = true
        }
        
        header.otificationCount.text = "\(notificationCount)"
        SignUpHelper.shared.header = header
        view.addSubview(header)
    }
    
}
