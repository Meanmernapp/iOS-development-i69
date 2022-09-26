//
//  StoriesTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 22/04/2022.
//

import UIKit

class StoriesTableViewCell: UITableViewCell {
    
    
    var addPhotoCallBack : (()->())?
    var callback : ((MomentListModel)->())?
    var stories = [MomentListModel]()
    @IBOutlet weak var cvStories: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initialise(stories : [MomentListModel])
    {
        self.stories = stories
        AddStoriyCollectionViewCell.registerNib(collectionView: cvStories)
        StoryItemCollectionViewCell.registerNib(collectionView: cvStories)
        cvStories.dataSource = self
        cvStories.delegate = self
        cvStories.reloadData()
    }
    
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "StoriesTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "StoriesTableViewCell")
    }
    static func getCell(tableView : UITableView) -> StoriesTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoriesTableViewCell") as! StoriesTableViewCell
        cell.selectionStyle = .none
        return cell
    }
}

extension StoriesTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = 128
        
        return CGSize(width: width, height: 183)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count + 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddStoriyCollectionViewCell", for: indexPath) as! AddStoriyCollectionViewCell
            
            
            return  cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryItemCollectionViewCell", for: indexPath) as! StoryItemCollectionViewCell
        
        cell.initialise(edge: stories[indexPath.row - 1])
        return  cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row > 0
        {
            callback?(stories[indexPath.row - 1])
        }
        else{
            addPhotoCallBack?()
        }
    }
}
