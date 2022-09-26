//
//  BlockingViewController.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 12/06/2022.
//

import UIKit

class BlockingViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var blockedUsers : [BlockedUsersQuery.Data.BlockedUser?]?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.users()
    }

    @IBAction func BACKACTION(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - Functions
    
    func users() {
        showLoadingIndicator()
        GraphQLClient.shared.fetchQuery(query: BlockedUsersQuery()) { result, err in
            self.hideLoadingIndicator()
            self.blockedUsers = result?.blockedUsers
            self.tableView.reloadData()
        }
    }
    //MARK: - Unblock User
    
    @objc func unblockUser(sender :UIButton) {
        GraphQLClient.shared.performMutation(mutation: UnBlockingUserMutation(UserID: SignUpHelper.shared.user.id, BlockUserID: self.blockedUsers?[sender.tag]?.id)) { result, err in
            GraphQLClient.shared.apollo.clearCache()
            self.users()
        }
    }

}

extension BlockingViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.blockedUsers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.register(BlockedTableViewCell.self, indexPath: indexPath)
        cell.config(blockedUser: self.blockedUsers?[indexPath.row])
        cell.unblockButton.tag = indexPath.row
        cell.unblockButton.addTarget(self, action: #selector(unblockUser(sender:)), for: .touchUpInside)
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


