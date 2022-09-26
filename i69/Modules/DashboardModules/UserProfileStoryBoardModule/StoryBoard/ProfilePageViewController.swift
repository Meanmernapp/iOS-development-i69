//
//  ProfilePageViewController.swift
//  i69
//
//  Created by The Mac Store on 27/04/2022.
//

import UIKit

class ProfilePageViewController: UIPageViewController {
    var controllers = [UIViewController]()
    var parentController : ProfileViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        for i in 0..<2
        {
            
            let controller = UIStoryboard.init(name: "UserProfile", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProfileUserViewController") as! ProfileUserViewController
            controller.controllerIndex = i
            controller.pagerMainController = self
            
            self.controllers.append(controller)
            
        }
        
        
        let feedController = SearchUserViewRouter.setupModule(pagerMainController: self)
        feedController.controllerIndex = 2
        self.controllers.append(feedController)
        
        
        let momentsController = SearchUserFeedViewRouter.setupModule(pagerMainController: self)
        momentsController.controllerIndex = 3
        self.controllers.append(momentsController)
        self.setViewControllers([controllers[0]], direction: .forward, animated: false)
        
        // Do any additional setup after loading the view.
    }
    func indexSelected(_ index : Int)
    {
        self.parentController?.setIndex(index)
    }
    func updateParentViewControler(parentViewController : ProfileViewController)
    {
        self.parentController = parentViewController
    }

}// MARK: UIPageViewControllerDataSource

extension ProfilePageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let controller = viewController as? pagerViewController
        {
            if controller.controllerIndex > 0
            {
                return self.controllers[controller.controllerIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let controller = viewController as? pagerViewController
        {
            if controller.controllerIndex < (self.controllers.count - 1)
            {
                return self.controllers[controller.controllerIndex + 1]
            }
        }
        return nil
    }

}
