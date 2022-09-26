//
//  SearchUserFeedViewController.swift
//  i69
//
//  Created by The Mac Store on 28/04/2022.
//

import UIKit

protocol SearchUserFeedViewControllerProtocol: AnyObject {
    
    func getUserMomentsResponse(data : GetUserMomentsQuery.Data?,error : Error?)
}
class SearchUserFeedViewController: pagerViewController {
    
    var presenter: SearchUserFeedViewPresenterProtocol?
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
        tbMoments.isScrollEnabled =  pagerMainController?.parentController?.svScroll.isScrollEnabled ?? false

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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

extension SearchUserFeedViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = MomentsTableViewCell.getCell(tableView: tableView)
        cell.initialise(moment: moments[indexPath.row])
        if indexPath.row == (moments.count)
        {
            loadData()
        }
        return cell
    }
    
    
}
extension SearchUserFeedViewController :SearchUserFeedViewControllerProtocol
{
    func getUserMomentsResponse(data : GetUserMomentsQuery.Data?,error : Error?)
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
