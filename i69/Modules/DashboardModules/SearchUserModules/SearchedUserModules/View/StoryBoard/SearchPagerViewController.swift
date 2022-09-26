//
//  SearchPagerViewController.swift
//  i69
//
//  Created by The Mac Store on 27/04/2022.
//

import UIKit

class SearchPagerViewController: UIPageViewController {
    var controllers = [UserDataViewController]()
    var parentController : DisplaySearchUserViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        for i in 0..<3
        {
            
            let controller = UIStoryboard.init(name: "SearchedUser", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserDataViewController") as! UserDataViewController
            controller.pagerMainController = self
            controller.controllerIndex = i
            
            self.controllers.append(controller)
            
        }
        controllers[0].data = StorageHelper.shared.random
        controllers[1].data = StorageHelper.shared.popular
        self.setViewControllers([controllers[0]], direction: .forward, animated: false)
        
        // Do any additional setup after loading the view.
    }
    func indexSelected(_ index : Int)
    {
        self.parentController?.setIndex(index)
    }
    func updateParentViewControler(parentViewController : DisplaySearchUserViewController)
    {
        self.parentController = parentViewController
    }

}// MARK: UIPageViewControllerDataSource

extension SearchPagerViewController: UIPageViewControllerDataSource {
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
