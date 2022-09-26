//
//  SearchHeaderTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 26/04/2022.
//

import UIKit


class SearchHeaderTableViewCell: UITableViewCell {
    
    var searchActionCallBack : ((String,String)->())?
    @IBOutlet weak var tfSearch: UITextField!
    @IBOutlet weak var sDistanceSlider: UISlider!
    @IBOutlet weak var rsAge: RangeSeekSlider!
    @IBOutlet weak var lbAge: UILabel!
    @IBOutlet weak var lbMinDistance: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func btnSearcjAction(_ sender: Any) {
        searchActionCallBack?(tfSearch.text ?? "", self.lbAge.text ?? "")
    }
    @IBAction func distanceSliderValueChanged(_ sender: Any) {
        lbMinDistance.text = "\(Int(sDistanceSlider.value * 2500)) km"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initialise()
    {
        rsAge.delegate = self
//        rvRange.size
    }
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "SearchHeaderTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "SearchHeaderTableViewCell")
    }
    static func getCell(tableView : UITableView) -> SearchHeaderTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchHeaderTableViewCell") as! SearchHeaderTableViewCell
        cell.selectionStyle = .none
        cell.initialise()
        return cell
    }
}
extension SearchHeaderTableViewCell : RangeSeekSliderDelegate
{
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat)
    {
        StorageHelper.shared.minAge = Int(minValue)
        StorageHelper.shared.maxAge = Int(maxValue)
        lbAge.text = "\(Int(minValue)) - \(Int(maxValue))"
    }
}
