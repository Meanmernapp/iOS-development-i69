//
//  UserMomentsViewController.swift
//  i69
//
//  Created by The Mac Store on 21/04/2022.
//

import UIKit
import Apollo

protocol UserMomentsViewControllerProtocol: AnyObject {
    
    func getUserMomentsResponse(data : GetAllUserMomentsQuery.Data?,error : Error?)
    func getUserStoriesResponse(data : GetAllUserStoriesQuery.Data?,error : Error?)
    
}
class UserMomentsViewController: BaseTabBarViewController {
    var presenter: UserMomentsViewPresenterProtocol?
    
    @IBOutlet weak var imTest: UIImageView!
    @IBOutlet weak var vHeader: UIView!
    @IBOutlet weak var tbMoments: UITableView!
    
    var moments = [MomentListModel]()
    var stories = [MomentListModel]()
    var loading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getUserStories()
        StoriesTableViewCell.registerNib(tableView: tbMoments)
        MomentsTableViewCell.registerNib(tableView: tbMoments)
        tbMoments.dataSource = self
        tbMoments.delegate = self
        moments = [MomentListModel]()
        stories = [MomentListModel]()
        loadData()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addHeaderMain(view: vHeader, title: "Moments",SignUpHelper.shared.notificationCount)
        
    }
    func loadData()
    {
        if loading
        {
            return
        }
        loading = true
        showLoadingIndicator()
        self.presenter?.getUserMoments()
        
    }
    func presentStoryView(story : MomentListModel)
    {
        let storyView = StoryViewController()
        storyView.edge = story
        present(storyView, animated: true, completion: nil)
    }
    func getSavedImage(named: String) -> URL? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return URL(fileURLWithPath: "\(dir.absoluteString)/\(named)")
        }
        return nil
    }
    func presentCameraView()
    {
        let storyView = CustomCameraController()
        storyView.uploadVideo = {data,name,video in
            if let url = self.getImageUrlThroughFileName(fileName: "\(name).jpeg")
            {
//                if let image = self.getImageFromURL(fileName: "\(name).jpeg")
//                {
//                    self.imTest.image = image
//                }
                print("absoluteString  \(url.absoluteString)")
                let fileName = "i69_\("".randomString())"
                let file = try! GraphQLFile(fieldName: "file", originalName: "\(fileName).jpeg",mimeType: "image/jpeg", fileURL: url)
                self.showLoadingIndicator()
                GraphQLClient.shared.upload(mutation: StoryMutation(file: "\(name).jpeg"), file: file)
                {
                    data,error in
                    GraphQLClient.shared.apollo.clearCache()
                    self.presenter?.getUserStories()
                    self.hideLoadingIndicator()
                }
            }
            else{
                print("notfount")
            }
        }
        present(storyView, animated: true, completion: nil)
    }
    
}

extension UserMomentsViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moments.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0
        {
            let cell = StoriesTableViewCell.getCell(tableView: tableView)
            cell.initialise(stories: stories)
            cell.callback = { story in
                self.presentStoryView(story: story)
            }
            cell.addPhotoCallBack = {
                self.presentCameraView()
            }
            return cell
        }
        let cell = MomentsTableViewCell.getCell(tableView: tableView)
        cell.initialise(moment: moments[indexPath.row - 1])
        cell.likeButton.tag = indexPath.row-1
        cell.commentButton.tag = indexPath.row-1
        
        cell.likeMomentCallBack = { index,previousLikes in
            let indexPath = IndexPath(row: index!, section: 0)
            let moment = self.moments
            moment[index!].likeCount = previousLikes! + 1
            self.moments = moment
            cell.likeButton.setTitle("\(previousLikes!+1)", for: .normal)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        cell.giftPurchaseCallback = { momentForGift in
            let vc = GiftViewController(nibName: "GiftViewController", bundle: nil)
                vc.modalPresentationStyle = .custom
                vc.transitioningDelegate = self
                vc.isAllGifts = true
                vc.senderId = momentForGift?.userID ?? ""
            self.present(vc, animated: true, completion: nil)
        }
        cell.commentCallback = { momentForComment in
            let vc = MomentDetailViewController(nibName: "MomentDetailViewController", bundle: nil)
            vc.momentData = momentForComment!
            self.navigationController?.tabBarController?.navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == (moments.count)
        {
            loadData()
            
        }
            
            return cell
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if self.moments.count > 0 {
            let vc = MomentDetailViewController(nibName: "MomentDetailViewController", bundle: nil)
            vc.momentData = self.moments[indexPath.row-1]
            self.navigationController?.tabBarController?.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    }

extension UserMomentsViewController :UserMomentsViewControllerProtocol
{
    
    func getUserStoriesResponse(data : GetAllUserStoriesQuery.Data?,error : Error?)
    {
        if let edges = data?.allUserStories?.edges
        {
            for edge in edges {
                if let edge = edge {
                    self.stories.append(MomentListModel(edge: edge))
                }
            }
        }
        tbMoments.reloadData()
    }
    func getUserMomentsResponse(data : GetAllUserMomentsQuery.Data?,error : Error?)
    {
        
        hideLoadingIndicator()
        if error != nil {
            showErrorMessage(error: error as? NSError)
            return
        }
        loading = data?.allUserMoments?.edges.count ?? 0 == 0
        if let edges = data?.allUserMoments?.edges
        {
            for edge in edges {
                if let edge = edge {
                    self.moments.append(MomentListModel(edge: edge))
                }
            }
        }
        
        tbMoments.reloadData()
    }
}

extension UserMomentsViewController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

