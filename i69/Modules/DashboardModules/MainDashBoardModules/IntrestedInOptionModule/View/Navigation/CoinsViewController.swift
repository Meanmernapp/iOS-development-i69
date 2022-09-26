//
//  CoinsViewController.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 11/06/2022.
//

import UIKit

class CoinsViewController: BaseViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    

}

extension CoinsViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.register(CoinsPricingTableViewCell.self, indexPath: indexPath)
        cell.selectionStyle = .none
        cell.config(index: indexPath.row)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


