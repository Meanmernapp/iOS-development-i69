//
//  UserIntrestTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 15/04/2022.
//

import UIKit

class UserIntrestTableViewCell: UITableViewCell {

    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var cvIntrest: UICollectionView!
    @IBOutlet weak var vLine: UIView!
    var data = [String]()
    var addIntrestClicked : (()->())?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func initialise(title : String)
    {
        data = SignUpHelper.shared.intrest[title] ?? [String]()
        self.lbTitle.text = title.uppercased()
        UserIntrestCollectionViewCell.registerNib(collectionView: cvIntrest)
        AddIntrestCollectionViewCell.registerNib(collectionView: cvIntrest)
        cvIntrest.dataSource = self
        cvIntrest.delegate = self
        cvIntrest.reloadData()
    }
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "UserIntrestTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "UserIntrestTableViewCell")
    }
    static func getCell(tableView : UITableView) -> UserIntrestTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserIntrestTableViewCell") as! UserIntrestTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
}
extension UserIntrestTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView,
                    layout collectionViewLayout: UICollectionViewLayout,
                    sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.row == (data.count)
        {
            return CGSize(width: 40, height: 40 )
        }
        let width = data[indexPath.row].getWidthOFStringWithFontSize(fontSize: 14) + 22
        
        return CGSize(width: width, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count + 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == (data.count)
        {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddIntrestCollectionViewCell", for: indexPath) as! AddIntrestCollectionViewCell
            
            cell.setDesign()
            cell.addIntrestClicked = {
                self.addIntrestClicked?()
            }
            
            return  cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserIntrestCollectionViewCell", for: indexPath) as! UserIntrestCollectionViewCell
        
        cell.initialise(title: data[indexPath.row])
        return  cell
    }
    
    
}
