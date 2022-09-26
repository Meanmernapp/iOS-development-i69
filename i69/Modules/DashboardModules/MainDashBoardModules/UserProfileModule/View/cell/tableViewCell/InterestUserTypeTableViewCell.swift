//
//  InterestUserTypeTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 21/04/2022.
//

import UIKit

class InterestUserTypeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var cvTags: UICollectionView!
    var data = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "InterestUserTypeTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "InterestUserTypeTableViewCell")
    }
    static func getCell(tableView : UITableView) -> InterestUserTypeTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InterestUserTypeTableViewCell") as! InterestUserTypeTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    func initialise()
    {
        UserIntrestCollectionViewCell.registerNib(collectionView: cvTags)
        cvTags.dataSource = self
        cvTags.delegate = self
    }
}

extension InterestUserTypeTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = data[indexPath.row].getWidthOFStringWithFontSize(fontSize: 14) + 22
        
        return CGSize(width: width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserIntrestCollectionViewCell", for: indexPath) as! UserIntrestCollectionViewCell
        
        cell.initialise(title: data[indexPath.row])
        return  cell
    }
}
