//
//  PersonalFilterTableViewCell.swift
//  i69
//
//  Created by The Mac Store on 26/04/2022.
//

import UIKit

class PersonalFilterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tfFamilyPlans: UITextField!
    @IBOutlet weak var rsAge: RangeSeekSlider!
    @IBOutlet weak var lbAge: UILabel!
    
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
        rsAge.delegate = self
    }
    static func registerNib(tableView : UITableView)
    {
        let nibName = UINib(nibName: "PersonalFilterTableViewCell", bundle:nil)
        tableView.register(nibName, forCellReuseIdentifier: "PersonalFilterTableViewCell")
    }
    static func getCell(tableView : UITableView) -> PersonalFilterTableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonalFilterTableViewCell") as! PersonalFilterTableViewCell
        cell.selectionStyle = .none
        cell.initialise()
        return cell
    }
}

extension PersonalFilterTableViewCell : RangeSeekSliderDelegate
{
    
    func rangeSeekSlider(_ slider: RangeSeekSlider, didChange minValue: CGFloat, maxValue: CGFloat)
    {
        
        StorageHelper.shared.minHeight = Int(minValue)
        StorageHelper.shared.maxHeight = Int(maxValue)
        let min = Measurement(value: minValue, unit: UnitLength.centimeters)
        let max = Measurement(value: maxValue, unit: UnitLength.centimeters)
        let minHeightFeet = min.converted(to: UnitLength.feet)
        let maxHeightFeet = max.converted(to: UnitLength.feet)
        
        if #available(iOS 15, *)
        {
            lbAge.text = "\(minHeightFeet.formatted()) - \(maxHeightFeet.formatted())"
        }
        else{
            lbAge.text = "\(String(format: "%.2f", minHeightFeet.value)) ft - \(String(format: "%.2f", maxHeightFeet.value)) ft"
        }
    }
}
