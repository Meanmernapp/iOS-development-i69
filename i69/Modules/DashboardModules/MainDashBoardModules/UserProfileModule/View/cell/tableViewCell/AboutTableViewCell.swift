//
//  AboutTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 21/04/2022.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAbout: UILabel!
    @IBOutlet weak var cvTags: UICollectionView!
    var data = [String]()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initialise()
    {
        data = [String]()
        if let tags = StorageHelper.shared.user?.tags
        {
            if let tagFilter = SignUpHelper.shared.filter?.tagsPicker
            {
                for tag in tags {
                    if let tag = tag {
                        if tagFilter.count > tag
                        {
                            data.append(tagFilter[tag]?.value ?? "")
                        }

                    }
                }
            }
        }
        UserIntrestCollectionViewCell.registerNib(collectionView: cvTags)
        cvTags.dataSource = self
        cvTags.delegate = self
    }
    
    func initialise(tags : [Int?]?)
    {
        data = [String]()
        if let tags = tags
        {
            if let tagFilter = SignUpHelper.shared.filter?.tagsPicker
            {
                for tag in tags {
                    if let tag = tag {
                        if tagFilter.count > tag
                        {
                            data.append(tagFilter[tag]?.value ?? "")
                        }
                        
                    }
                }
            }
        }
        UserIntrestCollectionViewCell.registerNib(collectionView: cvTags)
        cvTags.dataSource = self
        cvTags.delegate = self
    }
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "AboutTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "AboutTableViewCell")
    }
    static func getCell(tableView : UITableView) -> AboutTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutTableViewCell") as! AboutTableViewCell
        cell.selectionStyle = .none
        return cell
    }
}

extension AboutTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
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
