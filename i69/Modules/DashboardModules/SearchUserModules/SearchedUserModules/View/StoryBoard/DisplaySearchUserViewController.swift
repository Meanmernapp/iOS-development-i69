//
//  TestStoryViewController.swift
//  i69
//
//  Created by The Mac Store on 27/04/2022.
//

import UIKit

class DisplaySearchUserViewController: BaseTabBarViewController {
    var childViewController : SearchPagerViewController?
    var selectedButton : UIButton?
    var selectedLine : UIView?
    var selectedIndex : Int = 0
    @IBOutlet weak var vHeader: UIView!
    
    @IBOutlet weak var btnRandom: UIButton!
    @IBOutlet weak var btnPopular: UIButton!
    @IBOutlet weak var btnMostActive: UIButton!
    
    @IBOutlet weak var vLineRandom: UIView!
    @IBOutlet weak var vLinePopular: UIView!
    @IBOutlet weak var vLineMostActive: UIView!
    
    @IBAction func btnRandomAction(_ sender: Any) {
        selectTab(sender,view: vLineRandom,0)
    }
    @IBAction func btnPopularAction(_ sender: Any) {
        selectTab(sender,view: vLinePopular,1)
    }
    @IBAction func btnMostActiveAction(_ sender: Any) {
        selectTab(sender,view: vLineMostActive,2)
    }
    func selectTab(_ sender: Any,view : UIView,_ item : Int = -1)
    {
        selectedLine?.isHidden = true
        selectedLine = view
        selectedLine?.isHidden = false
        selectedButton?.tintColor = .lightGray
        selectedButton = sender as? UIButton
        selectedButton?.tintColor = UIColor(named: "golden")
        if item >= 0
        {
            childViewController?.setViewControllers([childViewController?.controllers[item] ?? UIViewController()], direction: selectedIndex > item ? .reverse : .forward, animated:true)
            selectedIndex = item
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if self.children.count > 0
        {
            if let pager = self.children[0] as? SearchPagerViewController
            {
                self.childViewController = pager
                pager.updateParentViewControler(parentViewController: self)
            }
        }
        selectedButton = btnRandom
        selectedLine = vLineRandom
        // Do any additional setup after loading the view.
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        addHeaderMain(view: self.vHeader, title: "Search Result",SignUpHelper.shared.notificationCount)
    }
    func setIndex(_ index : Int)
    {
        var sender = btnRandom
        var line = vLineRandom
        switch index
        {
        case 1:
            sender = btnPopular
            line = vLinePopular
            break
        case 2:
            sender = btnMostActive
            line = vLineMostActive
            break
        default:
            break
        }
        selectTab(sender as Any,view: line!)
        selectedIndex = index
    }

}
