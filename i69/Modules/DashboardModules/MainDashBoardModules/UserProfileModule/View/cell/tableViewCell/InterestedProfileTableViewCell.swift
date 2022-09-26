//
//  InterestedProfileTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 21/04/2022.
//

import UIKit

class InterestedProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var conTbHeight: NSLayoutConstraint!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var tbData: UITableView!
    var data = [tbDataModel]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setValues(name : String,lists : [String?])
    {
        var d = [String]()
        for list in lists
        {
            d.append(list ?? "")
        }
        if d.count > 0
        {
            data.append(tbDataModel(name: name, data: d))
        }
    }
    func initialise(music : [String?],movies : [String?],books : [String?],sports : [String?])
    {
        data = [tbDataModel]()
        setValues(name: "Music", lists: music)
        setValues(name: "Movies", lists: movies)
        setValues(name: "Books", lists: books)
        setValues(name: "Sports Team", lists: sports)
        
        
        
        conTbHeight.constant = CGFloat(data.count * 90)
        InterestUserTypeTableViewCell.registerNib(tableView: tbData)
        tbData.dataSource = self
        tbData.delegate = self
        
    }
    func initialise()
    {
        data = [tbDataModel]()
        setValues(name: "Music", lists: StorageHelper.shared.user?.music ?? [String?]())
        setValues(name: "Movies", lists: StorageHelper.shared.user?.movies ?? [String?]())
        setValues(name: "Books", lists: StorageHelper.shared.user?.books ?? [String?]())
        setValues(name: "Sports Team", lists: StorageHelper.shared.user?.sportsTeams ?? [String?]())
        
        
        
        conTbHeight.constant = CGFloat(data.count * 90)
        InterestUserTypeTableViewCell.registerNib(tableView: tbData)
        tbData.dataSource = self
        tbData.delegate = self
        
    }
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "InterestedProfileTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "InterestedProfileTableViewCell")
    }
    static func getCell(tableView : UITableView) -> InterestedProfileTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "InterestedProfileTableViewCell") as! InterestedProfileTableViewCell
        cell.selectionStyle = .none
        return cell
    }
}
extension InterestedProfileTableViewCell : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = InterestUserTypeTableViewCell.getCell(tableView: tableView)
        cell.data = data[indexPath.row].data
        cell.initialise()
        cell.lbTitle.text = data[indexPath.row].name
        return cell
    }
    
    
}
class tbDataModel{
    var name = ""
    var data = [String]()
    init(name : String,data : [String] )
    {
        self.name = name
        self.data = data
    }
}
