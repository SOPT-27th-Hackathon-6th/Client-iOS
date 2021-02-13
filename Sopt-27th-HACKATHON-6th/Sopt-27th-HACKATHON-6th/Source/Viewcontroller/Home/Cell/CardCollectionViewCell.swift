//
//  CardCollectionViewCell.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2021/02/13.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CardCollectionViewCell"

    @IBOutlet var cardView: UIView!
    @IBOutlet var storeNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var foodImageView: UIImageView!
    @IBOutlet var reviewLabel: UILabel!
    
    var type: String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cardView.layer.cornerRadius = 15
        // Initialization code
    }
    
    // 이미지는 나중에
    func setItem(store: String, date: String, review: String) {
        storeNameLabel.text = store
        dateLabel.text = date
        reviewLabel.text = review
    }
    
    @IBAction func touchUpList(_ sender: UIButton) {
        NotificationCenter.default.post(name: Notification.Name("touchUpList"),
                                        object: type)
    }
}
