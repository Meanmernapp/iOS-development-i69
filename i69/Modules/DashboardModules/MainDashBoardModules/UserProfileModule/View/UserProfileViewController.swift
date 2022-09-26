//
//  UserProfileViewController.swift
//  i69
//
//  Created by The Mac Store on 20/04/2022.
//

import UIKit
protocol UserProfileViewControllerProtocol : AnyObject
{}
class UserProfileViewController: BaseTabBarViewController {
    
    var presenter: UserProfileViewPresenterProtocol?
    var selectedButton : UIButton?
    var selectedLine : UIView?
    
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var cvHeader: UICollectionView!
    @IBOutlet weak var cvDetail: UICollectionView!
    @IBOutlet weak var imProfile: UIImageView!
    @IBOutlet weak var lbAge: UILabel!
    @IBOutlet weak var lbHeight: UILabel!
    @IBOutlet weak var lbCoins: UILabel!
    @IBOutlet weak var lbLikes: UILabel!
    @IBOutlet weak var btnAbout: UIButton!
    @IBOutlet weak var btnInterest: UIButton!
    @IBOutlet weak var btnFeed: UIButton!
    @IBOutlet weak var btnMoments: UIButton!
    @IBOutlet weak var vAboutLine: UIView!
    @IBOutlet weak var vInterestLine: UIView!
    @IBOutlet weak var vFeedLine: UIView!
    @IBOutlet weak var vMomentsLine: UIView!
    @IBOutlet weak var vHeader: UIView!
    
    @IBAction func btnAboutAction(_ sender: Any) {
        selectTab(sender,view : vAboutLine,item: 0)
    }
    @IBAction func btnInterestAction(_ sender: Any) {
        selectTab(sender,view : vInterestLine,item: 1)
    }
    @IBAction func btnFeedAction(_ sender: Any) {
        selectTab(sender,view : vFeedLine)
    }
    @IBAction func btnMomentsAction(_ sender: Any) {
        selectTab(sender,view : vMomentsLine)
        
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
        {
            cvDetail.scrollToItem(at: NSIndexPath(item: item, section: 0) as IndexPath, at: .left, animated: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        pageController.numberOfPages = StorageHelper.shared.user?.avatarPhotos?.count ?? 0
        if let agePicker = SignUpHelper.shared.filter?.agePicker
        {
            if agePicker.count > StorageHelper.shared.user?.age ?? 0
            {
                lbAge.text = ":   \(agePicker[StorageHelper.shared.user?.age ?? 0]?.value ?? 0) YEARS"
            }
        }
        
        if let heightPicker = SignUpHelper.shared.filter?.heightsPicker
        {
            if heightPicker.count > StorageHelper.shared.user?.height ?? 0
            {
                lbHeight.text = ":   \(heightPicker[StorageHelper.shared.user?.height ?? 0]?.value ?? 0) CM"
            }
        }
        if let avatars = StorageHelper.shared.user?.avatarPhotos
        {
            if avatars.count > 0
            {
                if let url = avatars[0]?.url
                {
                    imProfile.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "profile"))
                }
            }
        }
        selectedButton = btnAbout
        selectedLine = vAboutLine
        
        
        
        cvHeader.backgroundColor = .clear
        cvHeader.isPagingEnabled = true
        cvHeader.showsHorizontalScrollIndicator = false

        PhotoHeaderCollectionViewCell.registerNib(collectionView: cvHeader)

        cvHeader.dataSource = self
        cvHeader.delegate = self
        
        
        
        
        cvDetail.backgroundColor = .clear
        cvDetail.isPagingEnabled = true
        cvDetail.showsHorizontalScrollIndicator = false

        DetailCollectionViewCell.registerNib(collectionView: cvDetail)

        cvDetail.dataSource = self
        cvDetail.delegate = self
        
        
        btnFeed.setTitle("FEED", for: .normal)
        btnMoments.setTitle("MOMENT", for: .normal)
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addHeaderMain(view: vHeader, title: "User Profile",SignUpHelper.shared.notificationCount)
    }

}
extension UserProfileViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == cvDetail
        {
            return 2
        }
        return StorageHelper.shared.user?.avatarPhotos?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == cvDetail
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(DetailCollectionViewCell.self)", for: indexPath) as! DetailCollectionViewCell
            cell.initialise(index: indexPath.row)
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PhotoHeaderCollectionViewCell.self)", for: indexPath) as? PhotoHeaderCollectionViewCell
        let url = StorageHelper.shared.user?.avatarPhotos?[indexPath.row]?.url ?? ""
        cell?.imImageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: ""))
        return cell ?? PhotoHeaderCollectionViewCell()
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == cvDetail
        {
            if indexPath.row == 1
            {
                selectTab(btnInterest,view : vInterestLine)
            }
            else{
                selectTab(btnAbout,view : vAboutLine)
            }
            return
        }
        pageController.currentPage = indexPath.row
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
}

extension UserProfileViewController : UserProfileViewControllerProtocol
{}
