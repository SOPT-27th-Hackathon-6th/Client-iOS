//
//  RankingTableViewCell.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by soyounglee on 2020/11/21.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    static let identifier = "RankingTableViewCell"
    
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var rankNameLabel: UILabel!
    @IBOutlet weak var rankGradeLabel: UILabel!
    @IBOutlet weak var rankCountLabel: UILabel!
    
    @IBOutlet weak var innerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.innerView.layer.borderWidth = 1
        self.innerView.layer.cornerRadius = 5
        self.innerView.backgroundColor = .white
        
        innerView.layer.shadowColor = UIColor.black.cgColor // 검정색 사용
        innerView.layer.masksToBounds = false
        innerView.layer.shadowOffset = CGSize(width: 0, height: 4) // 반경에 대해서 너무 적용이 되어서 4point 정도 ㅐ림.
        innerView.layer.shadowRadius = 1 // 반경?
        innerView.layer.shadowOpacity = 0.15 // alpha값입니다.

        
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
