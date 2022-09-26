//
//  NotificationsViewController.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 04/06/2022.
//

import UIKit

class NotificationsViewController: BaseViewController {
    
    
    //MARK: - IBOutlets

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var tableView: UITableView!
    var data : [GetAllNotificationQuery.Data.Notification.Edge?]?
    var count = 20
    var totalCount = -1
    var error : Error?
    
    //MARK: - Variables
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popUpView.transform = CGAffineTransform(scaleX: 0.0, y: 0.0)
        SignUpHelper.shared.notificationCount = 0
        SignUpHelper.shared.header.notificationView.isHidden = true
        loadNewNotification(count: self.count)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupDidappear()
    }
    
    @IBAction func crossAction(_ sender: Any) {
        self.hidePopup()
    }
    @IBAction func hideAction(_ sender: Any) {
        self.hidePopup()
    }
    
    //MARK: - Functions
    func loadNewNotification(count:Int) {
        self.showLoadingIndicator()
            GraphQLClient.shared.fetchQuery(query: GetAllNotificationQuery(first: count)) { data, err in
                self.hideLoadingIndicator()
                
                if err == nil && self.error == nil {
                    if data?.notifications?.edges.count ?? 0 > 0 {
                    self.data = data?.notifications?.edges
                        self.tableView.reloadData()
                    }
                }
                else {
                    self.error = err
                    self.showErrorMessage(err?.localizedDescription ?? "Notification Not fetched")
                }
                
            }

    }
    func setupDidappear() {
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: [],  animations: {
            
            self.popUpView.transform = .identity
        })
        
    }
    
    func hidePopup() {
        popUpView.alpha = 1
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: {
            
            self.popUpView.alpha = 0
            self.popUpView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            
        }) { (success) in
            
            self.dismiss(animated: false, completion: nil)
            
        }
    }
    
    
}
extension NotificationsViewController : UITableViewDelegate,UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.register(NotificationsTableViewCell.self, indexPath: indexPath)
        cell.selectionStyle = .none
        cell.config(data: self.data?[indexPath.row])
        
        return cell
        
    }
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height )){
//            self.count = self.count + 10
//            self.loadNewNotification(count: self.count)
//        }
//    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type, indexPath: IndexPath) -> T {
        self.register(UINib(nibName: String(describing: T.self), bundle: .main), forCellReuseIdentifier: String(describing: T.self))
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
        return cell
    }
}

