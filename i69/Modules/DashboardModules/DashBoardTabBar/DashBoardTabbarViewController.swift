//
//  DashBoardTabbarViewController.swift
//  i69
//
//  Created by The Mac Store on 19/04/2022.
//

import UIKit
import ENSwiftSideMenu
import Apollo

protocol DashBoardTabbarViewControllerProtocol : AnyObject
{
    func getUserProfileByIdResponse(data : GetUserProfileByIdQuery.Data?,error : Error?)
    func fetchDefaultPickerResponse(error : Error?)
    
}
class DashBoardTabbarViewController: UITabBarController {
    var presenter: DashBoardTabbarViewPresenterProtocol?
    var vLeftNavigation: UIView?
    private var subscription: Cancellable?
    var bottomBar: BottomBarView?
    var vLeftNavigationContainer: UIView?
    
    @IBAction func btnCloseNavAction(_ sender: Any) {
    }
    
    var sideMenu: ENSideMenu?
    var sideController = LeftNavigationViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        GraphQLClient.shared.fetchQuery(query: GetNotificationCountQuery()) { result, err in
            let count = result?.unseenCount ?? 0
            SignUpHelper.shared.notificationCount = count
            if count > 0 {
                SignUpHelper.shared.header.notificationView.isHidden = false
                SignUpHelper.shared.header.otificationCount.text = "\(count)"
            }
           
        }
        self.socketforNewMessage()
        bottomBar = BottomBarView.instanceFromNib(tabbar: self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateUserChanges(notification:)), name: .init("notificationWillPresent"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateUserChanges(notification:)), name: .init("notificationDidRecive"), object: nil)
        let button = UIButton(frame: CGRect(x: 0, y: getStatusBarHeight(), width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - getStatusBarHeight()))
        vLeftNavigation = UIView(frame: CGRect(x: 0, y: getStatusBarHeight(), width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - getStatusBarHeight()))
        vLeftNavigationContainer = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width * 0.75, height: UIScreen.main.bounds.height - getStatusBarHeight()))
        view.addSubview(bottomBar!)
        view.addSubview(vLeftNavigation!)
        vLeftNavigation?.addSubview(button)
        vLeftNavigation?.addSubview(vLeftNavigationContainer!)
        vLeftNavigation?.clipsToBounds = true
        vLeftNavigation?.isHidden = true
        
        setUpSideMenu()
        
        ProfileStorageHelper.shared.user = StorageHelper.shared.user
        
        let userProfileViewModule = UIStoryboard.init(name: "UserProfile", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
        userProfileViewModule?.userProfile = true
        
        self.tabBar.isHidden = true
        let controllers = [getNavViewController(viewController: IntrestedInOptionViewRouter.setupModule()),getNavViewController(viewController: UserMomentsViewRouter.setupModule()),getNavViewController(viewController: NewMomentViewController()),getNavViewController(viewController: ChatListViewRouter.setupModule()),getNavViewController(viewController: userProfileViewModule ?? UserProfileViewRouter.setupModule())]
        Global.shared.viewController = controllers
        self.viewControllers = controllers
        if let controller = self.viewControllers?[0]
        {
            self.selectedViewController = controller
        }
        button.addTarget(self, action: #selector(btnCloseAction), for: .touchUpInside)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.presenter?.getAndUpdate()
    }
    @objc func updateUserChanges(notification : Notification){
        GraphQLClient.shared.fetchQuery(query: GetNotificationCountQuery()) { result, err in
            let count = result?.unseenCount ?? 0
            SignUpHelper.shared.notificationCount = count+1
            SignUpHelper.shared.header.notificationView.isHidden = false
            SignUpHelper.shared.header.otificationCount.text = "\(count+1)"
        }
    }
    func socketforNewMessage() {
        let subscription = GetNewMessagesSubscription(token: SignUpHelper.shared.token)
        self.subscription = Apollo.shared.client2
            .subscribe(subscription: subscription) {  result in
                switch result {
                case .success(let data):
                    if data.data?.onNewMessage?.message?.content.count ?? 0 > 0 {
                        GraphQLClient.shared.apollo.clearCache()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
                
            }
    }
    
    @objc func btnCloseAction() {
        sideMenu?.toggleMenu()
    }
    func getNavViewController(viewController : UIViewController) -> UINavigationController
    {
        let navController = BaseNavigationController(rootViewController: viewController)
        navController.navigationBar.isHidden = true
        navController.view.clipsToBounds = true
        return navController
    }
    
    func setUpSideMenu() {
        sideMenu = ENSideMenu(sourceView: self.vLeftNavigationContainer!, menuViewController: sideController, menuPosition: .left)
        sideMenu?.menuWidth = view.frame.size.width * 0.75
        sideMenu?.animationDuration = 0.2
        sideMenu?.bouncingEnabled = false
        
        vLeftNavigationContainer?.layer.cornerRadius = 20
        vLeftNavigationContainer?.layer.maskedCorners = [ .layerMaxXMinYCorner]
        sideMenu?.delegate = self
        
        
        sideController.dashboardController = self
        
    }
    func getStatusBarHeight() -> CGFloat {
        
        return ScreenSizeValues.statusBarHeight
    }

}

extension DashBoardTabbarViewController: ENSideMenuDelegate {
    func sideMenuWillOpen() {
        vLeftNavigation?.isHidden = false
    }

    func sideMenuWillClose() {

    }

    func sideMenuShouldOpenSideMenu() -> Bool {
        true
    }

    func sideMenuDidOpen() {
        

    }

    func sideMenuDidClose() {
        vLeftNavigation?.isHidden = true

    }
}
extension DashBoardTabbarViewController : DashBoardTabbarViewControllerProtocol
{
    func fetchDefaultPickerResponse(error : Error?)
    {
        
    }
    func getUserProfileByIdResponse(data : GetUserProfileByIdQuery.Data?,error : Error?)
    {
        if data != nil
        {
            StorageHelper.shared.user = data?.user
            let url = (data?.user?.avatarPhotos?.count ?? 0) > 0 ? (data?.user?.avatarPhotos?[0]?.url ?? "") : ""
            if url.count > 0
            {
                bottomBar?.loadProfileImage(url: url)
                
            }
        }
    }
}
