//
//  GiftViewController.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 05/06/2022.
//

import UIKit
import CoreAudio
import Apollo

class GiftViewController: BaseViewController {
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var receivedGiftView: UIView!
    @IBOutlet weak var sendGiftsView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var receiveBtn: UIButton!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var giftSendBtn: GradientButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: - Variables
    
    var receiveData : [GetReceivedGiftsQuery.Data.AllUserGift.Edge?]?
    var sendData : [GetSentGiftsQuery.Data.AllUserGift.Edge?]?
    var giftData : [AllGiftsQuery.Data.AllGift?]?
    var giftDataForTable : [AllGiftsQuery.Data.AllGift?]?
    var recieve = false
    var isAllGifts = false
    var senderId = ""
    var index = -1
    var giftId : GraphQLID?
    
    
    //MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.giftSendBtn.isHidden = true
        if isAllGifts {
            tableView.isHidden = true
            self.sendBtn.setTitle("VIRTUAL GIFTS", for: .normal)
            self.receiveBtn.setTitle("REAL GIFTS", for: .normal)
        }
        else {
            collectionView.isHidden = true
        }
        
        self.sendGiftsView.backgroundColor = UIColor(named: "golden")
        self.receivedGiftView.backgroundColor = .clear
        if isAllGifts {
            self.sendGiftsView.backgroundColor = .clear
            self.receivedGiftView.backgroundColor = UIColor(named: "golden")
            GraphQLClient.shared.fetchQuery(query: AllGiftsQuery()) { result, error in
                self.giftData = result?.allGift
                self.giftDataForTable = self.giftData?.filter{$0?.type.rawValue == "REAL"}
                self.collectionView.reloadData()
            }
        }
        else {
            GraphQLClient.shared.apollo.clearCache()
            GraphQLClient.shared.fetchQuery(query: GetSentGiftsQuery(user_Id: ProfileStorageHelper.shared.user?.id ?? "")) { result, errr in
                self.sendData = result?.allUserGifts?.edges
                self.tableView.reloadData()
            }
        }
        
    }
    
    
    //MARK: - IBAction
    
    
    @IBAction func giftSendAction(_ sender: Any) {
        self.purchaseGift(giftID: self.giftId ?? "", userID: self.senderId)
    }
    
    @IBAction func receiveAction(_ sender: Any) {
        
        self.receivedGiftView.backgroundColor = UIColor(named: "golden")
        self.sendGiftsView.backgroundColor = .clear
        nilValues()
        if isAllGifts {
            self.giftDataForTable = self.giftData?.filter{$0?.type.rawValue == "REAL"}
            collectionView.reloadData()
        }
        else {
            receiveData?.removeAll()
            sendData?.removeAll()
            self.tableView.reloadData()
            GraphQLClient.shared.fetchQuery(query: GetReceivedGiftsQuery(receiver_Id: ProfileStorageHelper.shared.user?.id ?? "")) { result, errr in
                self.recieve = true
                self.receiveData = result?.allUserGifts?.edges
                self.tableView.reloadData()
            }
            
        }
    }
    
    @IBAction func sendAction(_ sender: Any) {
        self.receivedGiftView.backgroundColor = .clear
        self.sendGiftsView.backgroundColor = UIColor(named: "golden")
        nilValues()
        if isAllGifts {
            self.giftDataForTable = self.giftData?.filter{$0?.type.rawValue == "VIRTUAL"}
            collectionView.reloadData()
        }
        else {
            receiveData?.removeAll()
            sendData?.removeAll()
            self.tableView.reloadData()
            GraphQLClient.shared.fetchQuery(query: GetSentGiftsQuery(user_Id: ProfileStorageHelper.shared.user?.id ?? "")) { result, errr in
                self.recieve = false
                self.sendData = result?.allUserGifts?.edges
                self.tableView.reloadData()
            }
        }
        
    }
    func purchaseGift (giftID:GraphQLID,userID:GraphQLID)  {
        GraphQLClient.shared.performMutation(mutation: GiftPurchaseMutation(gid: giftID, uId: userID)) { res, err in
                if let error = err as NSError? {
                    if error.debugDescription.contains("You cannot gift yourself") {
                        self.showErrorMessage("You cannot gift yourself")
                    }
                    else if error.debugDescription.contains("Not enough coins") {
                        self.showErrorMessage("Not enough coins")
                    }
                    else {
                        self.showErrorMessage(error.localizedDescription)
                    }
                    
                }
            else {
                self.giftSendBtn.isHidden = true
                self.showErrorMessage("Gift Send")
                self.dismiss(animated: true)
            }
        }
    }
    func nilValues () {
        self.giftId = nil
        self.giftSendBtn.isHidden = true
        self.index = -1
    }
    func firstButton() {
        
    }
    func secondButton() {
        
    }
    
}


//MARK: - TableViews

extension GiftViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if recieve {
            return receiveData?.count ?? 0
        }
        else {
            return sendData?.count ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.register(GiftsTableViewCell.self, indexPath: indexPath)
        if recieve {
            cell.configForReceive(data: self.receiveData?[indexPath.row])
            
        }
        else {
            cell.config(data: self.sendData?[indexPath.row])
        }
        cell.selectionStyle = .none
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension GiftViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.giftDataForTable?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.register(GiftsCollectionViewCell.self, indexPath: indexPath)
        cell.config(data: self.giftDataForTable?[indexPath.row])
        if isAllGifts {
            if self.index == indexPath.item {
                cell.checkImage.isHidden = false
            }
            else {
                cell.checkImage.isHidden = true
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: collectionView.layer.bounds.width/2.3, height: collectionView.layer.bounds.width/2.3)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.giftSendBtn.isHidden = true
        
        if self.sendGiftsView.backgroundColor == .clear {
            if let data = self.giftDataForTable?[indexPath.item] {
                print(data.giftName,data.id)
                if indexPath.item == self.index {
                    nilValues()
                }
                else {
                    self.index = indexPath.item
                    self.giftId = data.id
                    self.giftSendBtn.isHidden = false
                }
                print(self.giftId ?? 0)
            }
        }
        else {
            if let data = self.giftDataForTable?[indexPath.item] {
                print(data.giftName,data.id)
                if indexPath.item == self.index {
                    nilValues()
                }
                else {
                    self.index = indexPath.item
                    self.giftId = data.id
                    self.giftSendBtn.isHidden = false
                }

            }
            print(self.giftId ?? 0)
        }
        self.collectionView.reloadData()
    }

}
