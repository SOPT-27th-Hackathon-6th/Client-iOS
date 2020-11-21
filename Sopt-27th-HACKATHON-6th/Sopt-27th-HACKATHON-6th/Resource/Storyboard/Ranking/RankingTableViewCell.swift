//
//  RankingTableViewCell.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by soyounglee on 2020/11/21.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    static let identifier = "RankingTableViewCell"
    
    
    @IBOutlet weak var innerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.innerView.layer.borderWidth = 3
        self.innerView.layer.cornerRadius = 5
        
        
        
        
        
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
