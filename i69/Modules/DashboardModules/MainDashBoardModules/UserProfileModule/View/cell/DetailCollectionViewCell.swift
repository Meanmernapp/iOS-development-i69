//
//  DetailCollectionViewCell.swift
//  i69
//
//  Created by The Mac Store on 21/04/2022.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tbData: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var index : Int = 0
    func initialise(index : Int)
    {
        self.index = index
        AboutTableViewCell.registerNib(tableView: tbData)
        InterestedProfileTableViewCell.registerNib(tableView: tbData)
        tbData.dataSource = self
        tbData.delegate = self
    }
    
    static func registerNib(collectionView : UICollectionView)
    {
        let nib = UINib(nibName: "DetailCollectionViewCell", bundle: nil)
        
        collectionView.register(nib, forCellWithReuseIdentifier: "DetailCollectionViewCell")
    }
}

extension DetailCollectionViewCell : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return index == 0 ? 2 : 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 && index == 0
        {
            let cell = AboutTableViewCell.getCell(tableView: tableView)
            cell.lbName.text = StorageHelper.shared.user?.fullName ?? ""
            cell.lbAbout.text = StorageHelper.shared.user?.about ?? ""
            cell.initialise()
            return cell
        }
        let cell = InterestedProfileTableViewCell.getCell(tableView: tableView)
        cell.initialise()
        cell.lbName.text = StorageHelper.shared.user?.fullName ?? ""
        return cell
    }
}
