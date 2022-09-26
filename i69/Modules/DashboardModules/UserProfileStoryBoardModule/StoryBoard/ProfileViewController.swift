//
//  ProfileViewController.swift
//  i69
//
//  Created by The Mac Store on 27/04/2022.
//

import UIKit

class ProfileViewController: BaseTabBarViewController {
    
    var childViewController : ProfilePageViewController?
    var selectedIndex : Int = 0
    var selectedButton : UIButton?
    var selectedLine : UIView?
    var userProfile = false
    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var svScroll: UIScrollView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var cvHeader: UICollectionView!
    @IBOutlet weak var imProfile: UIImageView!
    @IBOutlet weak var lbAge: UILabel!
    @IBOutlet weak var lbHeight: UILabel!
    @IBOutlet weak var lbCoins: UILabel!
    @IBOutlet weak var lbLikes: UILabel!
    @IBOutlet weak var btnAbout: UIButton!
    @IBOutlet weak var btnInterest: UIButton!
    @IBOutlet weak var vBtnChatView: UIView!
    @IBOutlet weak var btnFeed: UIButton!
    @IBOutlet weak var btnMoments: UIButton!
    @IBOutlet weak var vAboutLine: UIView!
    @IBOutlet weak var vInterestLine: UIView!
    @IBOutlet weak var vFeedLine: UIView!
    @IBOutlet weak var vMomentsLine: UIView!
    @IBOutlet weak var vHeader: UIView!
    
    @IBAction func btnStartChat(_ sender: Any) {
        
        showLoadingIndicator()
        GraphQLClient.shared.performMutation(mutation: CreateChatMutationMutation(username: ProfileStorageHelper.shared.user?.username ?? ""))
        {(data,error) in
            self.hideLoadingIndicator()
            var roomId = -1
            if let chatRoom = Int(data?.data?.createChat?.room?.id ?? "0")
            {
                roomId = chatRoom
            }
            print(roomId)
            
            ProfileStorageHelper.shared.newChatId = roomId
            
            self.navigationController?.tabBarController?.navigationController?.pushViewController(ChatViewRouter.setupModule(), animated: true)
            
        }
    }
    @IBAction func btnAboutAction(_ sender: Any) {
        selectTab(sender,view : vAboutLine,item: 0)
    }
    @IBAction func btnInterestAction(_ sender: Any) {
        selectTab(sender,view : vInterestLine,item: 1)
    }
    @IBAction func btnFeedAction(_ sender: Any) {
        selectTab(sender,view : vFeedLine,item: 2)
    }
    @IBAction func btnMomentsAction(_ sender: Any) {
        selectTab(sender,view : vMomentsLine,item: 3)
        
    }
    @IBAction func editProfileAction(_ sender: Any) {
        
        
        
        self.push(viewController: CompleteProfileViewRouter.setupModule(), animated: true)
    }
    @IBAction func notificationAction(_ sender: Any) {
        let vc = NotificationsViewController(nibName: "NotificationsViewController", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    @IBAction func giftAction(_ sender: Any) {
        let yourVC = GiftViewController(nibName: "GiftViewController", bundle: nil)
            yourVC.modalPresentationStyle = .custom
            yourVC.transitioningDelegate = self
        self.present(yourVC, animated: true, completion: nil)
        

    }
    
    @IBAction func heartAction(_ sender: Any) {
    }
    func selectTab(_ sender: Any,view : UIView,item : Int = -1)
    {
        selectedLine?.isHidden = true
        selectedLine = view
        selectedLine?.isHidden = false
        selectedButton?.tintColor = .lightGray
        selectedButton = sender as? UIButton
        selectedButton?.tintColor = UIColor(named: "golden")
        if item >= 0
        { childViewController?.setViewControllers([childViewController?.controllers[item] ?? UIViewController()], direction: selectedIndex > item ? .reverse : .forward, animated:true)
            selectedIndex = item
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileSetup()
        selectedButton = btnAbout
        selectedLine = vAboutLine
        
        
        
        cvHeader.backgroundColor = .clear
        cvHeader.isPagingEnabled = true
        cvHeader.showsHorizontalScrollIndicator = false
        
        PhotoHeaderCollectionViewCell.registerNib(collectionView: cvHeader)
        
        cvHeader.dataSource = self
        cvHeader.delegate = self
        
        
        
        if self.children.count > 0
        {
            if let pager = self.children[0] as? ProfilePageViewController
            {
                self.childViewController = pager
                pager.updateParentViewControler(parentViewController: self)
            }
        }
        
        
        btnFeed.setTitle("FEED", for: .normal)
        btnMoments.setTitle("MOMENT", for: .normal)
        
        
        
        svScroll.delegate = self
        
        
        vBtnChatView.isHidden = userProfile
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.profileSetup()
        addHeaderMain(view: vHeader, title: "User Profile",SignUpHelper.shared.notificationCount)
    }
    
    //MARK: - Functions
    func profileSetup() {
        DispatchQueue.main.async {
            self.pageController.numberOfPages = ProfileStorageHelper.shared.user?.avatarPhotos?.count ?? 0
            if let agePicker = SignUpHelper.shared.filter?.agePicker
            {
                if agePicker.count > ProfileStorageHelper.shared.user?.age ?? 0
                {
                    self.lbAge.text = ": \(agePicker[ProfileStorageHelper.shared.user?.age ?? 0]?.value ?? 0) YEARS"
                }
            }
            
            
            if let heightPicker = SignUpHelper.shared.filter?.heightsPicker
            {
                if heightPicker.count > ProfileStorageHelper.shared.user?.height ?? 0
                {
                    self.lbHeight.text = ":\(heightPicker[ProfileStorageHelper.shared.user?.height ?? 0]?.value ?? 0) CM"
                }
            }
            if let avatars = ProfileStorageHelper.shared.user?.avatarPhotos
            {
                if avatars.count > 0
                {
                    if let url = avatars[0]?.url
                    {
                        self.imProfile.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "profile"))
                    }
                }
            }
            self.lbCoins.text = "\(ProfileStorageHelper.shared.user?.purchaseCoins ?? 0)"
            self.nameText.text = ProfileStorageHelper.shared.user?.fullName ?? ""
            if let likes = ProfileStorageHelper.shared.user?.likes
            {
                self.lbLikes.text = "\(likes.count)"
            }
        }
    }
    
    
    func setIndex(_ index : Int)
    {
        var sender = btnAbout
        var line = vAboutLine
        switch index
        {
        case 1:
            sender = btnInterest
            line = vInterestLine
            break
        case 2:
            sender = btnFeed
            line = vFeedLine
            break
        case 3:
            sender = btnMoments
            line = vMomentsLine
            break
        default:
            break
        }
        selectTab(sender as Any,view: line!)
        selectedIndex = index
        svScroll.isScrollEnabled = true
        enableDisablePagerTableScroll()
    }
    
}
extension ProfileViewController : UIScrollViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y
        
        
        
        if yOffset >= (scrollView.contentSize.height - scrollView.frame.height)
        {
            if selectedIndex >= 2
            {
                scrollView.isScrollEnabled = false
                enableDisablePagerTableScroll()
            }
        }
    }
    func enableDisablePagerTableScroll()
    {
        let controllers = childViewController?.controllers ?? [UIViewController]()
        
        for i in 0..<controllers.count
        {
            switch i{
            case 2:
                if let con = controllers[i] as? SearchUserViewController
                {
                    con.tbMoments?.isScrollEnabled = !svScroll.isHidden
                }
                break
            case 3:
                if let con = controllers[i] as? SearchUserFeedViewController
                {
                    con.tbMoments?.isScrollEnabled = !svScroll.isHidden
                }
                break
            default:
                
                if let con = controllers[i] as? ProfileUserViewController
                {
                    con.tbData?.isScrollEnabled = !svScroll.isHidden
                }
            }
        }
    }
}
extension ProfileViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProfileStorageHelper.shared.user?.avatarPhotos?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoHeaderCollectionViewCell.self)", for: indexPath) as? PhotoHeaderCollectionViewCell
        let url = ProfileStorageHelper.shared.user?.avatarPhotos?[indexPath.row]?.url ?? ""
        cell?.imImageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: ""))
        return cell ?? PhotoHeaderCollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageController.currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

extension ProfileViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
