//
//  HomeListTableViewCell.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/12/19.
//

import UIKit

class HomeListTableViewCell: UITableViewCell {

    static let identifier = "HomeListTableViewCell"
    @IBOutlet var foodImageView: UIImageView!
    @IBOutlet var storeNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var reviewLabel: UILabel!
    @IBOutlet var divideBarLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        foodImageView.layer.cornerRadius = 15
        dateLabel.textColor = UIColor(displayP3Red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
        divideBarLabel.backgroundColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
