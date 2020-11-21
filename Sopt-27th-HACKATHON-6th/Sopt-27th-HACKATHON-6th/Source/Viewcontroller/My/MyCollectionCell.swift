//
//  MyCollectionCell.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/11/22.
//

import UIKit

class MyCollectionCell: UICollectionViewCell {
    static let identifier = "MyCollectionCell"
    
    //    @IBOutlet var cellContentView: UIView!
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var profileBackgroundImageView: UIImageView!
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var fooldLabel: UILabel!
    @IBOutlet var percentageLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var mainDialogLabel: UILabel!
    @IBOutlet var subDialogLabel: UILabel!
    
    
    @IBOutlet var levelProgressView: UIProgressView!
    
    
    func setShadow() {
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 5.0)
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.15
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds,
                                        cornerRadius: contentView.layer.cornerRadius).cgPath
    }
    let type: Int = 1
    let foodArr: [String] = ["Mala", "Gukbap"]
    let foodLabelArr: [String] = ["마라", "국밥"]
    
    func setCell(food: String) {
        //        getLevelService.shared.getLevel(foodType: type) { (result) in
        //            switch(result) {
        //            //            id, levelNum: Int
        //            //            let description: String
        //            //            let foodType: Int
        //            //            let levelName: String
        //            case .success(let data):
        //                if let levelDataModel = data as? levelDataModel {
        //                    self.profileImageView.image = UIImage(named: "img\(self.foodArr[levelDataModel.foodType])Profile")
        //                    self.fooldLabel.text = "\(self.foodLabelArr[levelDataModel.foodType])혈중농도"
        //                    self.subDialogLabel.text = levelDataModel.description
        //                    self.levelLabel.text = levelDataModel.levelName
        //                }
        //            case .requestErr(_):
        //                print("error")
        //            case .pathErr:
        //                print("pathErr")
        //            case .serverErr:
        //                print("serverErr")
        //            case .networkFail:
        //                print("networkFail")
        //            }
        //
        //        profileImageView.image = UIImage(named: "img\(food)Profile")
        //        userNameLabel.text = "국밥마라"
        
        if (food == "Mala") {
            userNameLabel.text = "국밥마라"
            profileImageView.image = UIImage(named: "img\(self.foodArr[0])Profile")
            if UserDefaults.standard.bool(forKey: "showLEVELUP") == false {
                levelLabel.text = "마라초 6학년"
                fooldLabel.text = "마라혈중농도"
                subDialogLabel.text = "내가 마라초 짱이다 ㅋ\n최고학년에 오르고 자신감에 가득찬 국밥마라..\n하지만 너에겐 중학교가 기다리고 있어"
                progressBar(percentage: 0.8, r: 203, g: 65, b: 30)
                countLabel.text = "17회"
                boldNormal(food: "마라탕")
            }
            else {
                levelLabel.text = "마라중 1학년"
                fooldLabel.text = "마라혈중농도"
                subDialogLabel.text = "기세등등하던 초딩 국밥마라.\n중학교에 진학하더니 더욱 깊게 마라에 빠지고 마라탕..."
                progressBar(percentage: 1.0, r: 203, g: 65, b: 30)
                countLabel.text = "18회"
                percentageLabel.textColor = .init(red: 203/255, green: 65/255, blue: 30/255, alpha: 1)
                boldNormal(food: "마라탕")
            }
        }
        
        
        
        else {
            profileImageView.image = UIImage(named: "img\(self.foodArr[1])Profile")
            userNameLabel.text = "국밥마라"
                        levelLabel.text = "국밥초 4학년"
                        fooldLabel.text = "국밥혈중농도"
                        subDialogLabel.text = "국밥초 4학년 2반 국밥마라...\n요즘은 6학년 형들이 무섭다.\n겁먹지마 국밥마라! 너도 이젠 고학년이야!!"
            progressBar(percentage: 0.4, r: 0, g: 0, b: 0)
                        countLabel.text = "11회"
            boldNormal(food: "국밥")
        }
        
        
        
        
        
    }
    
    func progressBar(percentage: Float, r: CGFloat, g: CGFloat, b: CGFloat) {
        //progress bar
        percentageLabel.text = String(Int(percentage * 100))+"%"
        
        levelProgressView.progress = percentage
        
        levelProgressView.progressTintColor = UIColor(displayP3Red: r/255, green: g/255, blue: b/255, alpha: 1)
        levelProgressView.trackTintColor = UIColor(displayP3Red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
        levelProgressView.transform = levelProgressView.transform.scaledBy(x: 1, y: 1.5)
        
        // Set the rounded edge for the outer bar
        levelProgressView.layer.cornerRadius = 3
        levelProgressView.clipsToBounds = true
        
        // Set the rounded edge for the inner bar
        levelProgressView.layer.sublayers![1].cornerRadius = 3
        levelProgressView.subviews[1].clipsToBounds = true
    }
    func boldNormal(food: String) {
        let boldAttribute = [
            NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Bold", size: 24.0)!
        ]
        let regularAttribute = [
            NSAttributedString.Key.font: UIFont(name: "AppleSDGothicNeo-Regular", size: 24.0)!
        ]
        let regularText1 = NSAttributedString(string: "오늘 ", attributes: regularAttribute)
        let boldText1 = NSAttributedString(string: food, attributes: boldAttribute)
        let regularText2 = NSAttributedString(string: " 안 먹으면... \n솝커톤 ", attributes: regularAttribute)
        let boldText2 = NSAttributedString(string: "말아먹을", attributes: boldAttribute)
        let regularText3 = NSAttributedString(string: " 것만 같아", attributes: regularAttribute)
        
        let newString = NSMutableAttributedString()
        newString.append(regularText1)
        newString.append(boldText1)
        newString.append(regularText2)
        newString.append(boldText2)
        newString.append(regularText3)
        mainDialogLabel.attributedText = newString
        mainDialogLabel.sizeToFit()
    }
}

