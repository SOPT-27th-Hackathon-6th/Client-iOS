//
//  MyCollectionCell.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/11/22.
//

import UIKit

class MyCollectionCell: UICollectionViewCell {
    static let identifier = "MyCollectionCell"
    

    @IBOutlet var cellContentView: UIView!
    @IBOutlet var profileBackgroundLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var fooldLabel: UILabel!
    @IBOutlet var percentageLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var mainDialogLabel: UILabel!
    @IBOutlet var subDialogLabel: UILabel!
    
    
    @IBOutlet var levelProgressView: UIProgressView!
    
    func setCell() {
        userNameLabel.text = "마라탕"
    }
    
    func setShadow() {
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 2.0
        layer.shadowOpacity = 0.5
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds,
                                        cornerRadius: contentView.layer.cornerRadius).cgPath
    }
//    func setCell() {
//        boldNormal()
//        // 임시로 여기에
//        topUIView.backgroundColor  = UIColor(displayP3Red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
//
//        //progress bar
//        levelProgressView.progress = 0.8
//
//        levelProgressView.progressTintColor = UIColor(displayP3Red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
//        levelProgressView.trackTintColor = UIColor(displayP3Red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
//        levelProgressView.transform = levelProgressView.transform.scaledBy(x: 1, y: 1.5)
//
//        // Set the rounded edge for the outer bar
////        levelProgressView.layer.cornerRadius = 0
////        levelProgressView.clipsToBounds = true
//
//        // Set the rounded edge for the inner bar
////        levelProgressView.layer.sublayers![1].cornerRadius = 0
////        levelProgressView.subviews[1].clipsToBounds = true
//
//        profileBackgroundLabel.layer.masksToBounds = true
//        profileBackgroundLabel.layer.cornerRadius = 60
//    }
//
//    func boldNormal() {
//        let boldAttribute = [
//            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Bold", size: 18.0)!
//        ]
//        let regularAttribute = [
//            NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-Light", size: 18.0)!
//        ]
//        let boldText = NSAttributedString(string: "Bold", attributes: boldAttribute)
//        let regularText = NSAttributedString(string: " regular", attributes: regularAttribute)
//        let newString = NSMutableAttributedString()
//        newString.append(boldText)
//        newString.append(regularText)
//        mainDialogLabel.attributedText = newString
//    }
}
