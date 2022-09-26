//
//  SearchUserViewController.swift
//  i69
//
//  Created by The Mac Store on 28/04/2022.
//

import UIKit

protocol SearchUserViewControllerProtocol: AnyObject {
    
    func getUserMomentsResponse(data : GetAllUserMomentsQuery.Data?,error : Error?)
}
class SearchUserViewController: pagerViewController {
    
    var presenter: SearchUserViewPresenterProtocol?
    var pagerMainController : ProfilePageViewController?
    
    @IBOutlet weak var tbMoments: UITableView!
    var moments = [MomentListModel]()
    var loading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MomentsTableViewCell.registerNib(tableView: tbMoments)
        tbMoments.dataSource = self
        tbMoments.delegate = self
        moments = [MomentListModel]()
        loadData()
        tbMoments.isScrollEnabled = pagerMainController?.parentController?.svScroll.isScrollEnabled ?? false
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
        tbMoments.reloadData()
        pagerMainController?.indexSelected(self.controllerIndex)
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



}

extension SearchUserViewController : UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate
{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let yOffset = scrollView.contentOffset.y

        print("scrollViewDidScroll tbdata \(yOffset) -- \(scrollView.contentSize.height)")
        
        if yOffset <= 0
        {
            scrollView.isScrollEnabled = false
            pagerMainController?.parentController?.svScroll.isScrollEnabled = true
        }
//        if scrollView == self.scrollView {
//            if yOffset >= scrollViewContentHeight - screenHeight {
//                scrollView.scrollEnabled = false
//                tableView.scrollEnabled = true
//            }
//        }
//
//        if scrollView == self.tableView {
//            if yOffset <= 0 {
//                self.scrollView.scrollEnabled = true
//                self.tableView.scrollEnabled = false
//            }
//        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = MomentsTableViewCell.getCell(tableView: tableView)
        cell.initialise(moment: moments[indexPath.row])
        cell.likeButton.tag  = indexPath.row
        cell.commentButton.tag  = indexPath.row
        cell.likeMomentCallBack = { index,previousLikes in
            let indexPath = IndexPath(row: index!, section: 0)
            let moment = self.moments
            moment[index!].likeCount = previousLikes! + 1
            self.moments = moment
            cell.likeButton.setTitle("\(previousLikes!+1)", for: .normal)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        if indexPath.row == (moments.count)
        {
            loadData()
        }
        return cell
    }
    
    
}
extension SearchUserViewController :SearchUserViewControllerProtocol
{
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
