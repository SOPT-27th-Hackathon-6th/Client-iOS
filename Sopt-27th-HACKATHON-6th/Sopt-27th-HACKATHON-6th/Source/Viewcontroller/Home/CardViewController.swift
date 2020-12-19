//
//  CardViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/12/19.
//

import UIKit

class CardViewController: UIViewController {

    
    @IBOutlet var cardView: UIView!
    @IBOutlet var storeNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var foodImageView: UIImageView!
    @IBOutlet var reviewLabel: UILabel!
    @IBOutlet var divideBarLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardSet()
        
        // Do any additional setup after loading the view.
    }
    

    func cardSet() {
        cardView.layer.cornerRadius = 15
        dateLabel.textColor = UIColor(displayP3Red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
        divideBarLabel.backgroundColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
    }
    
    @IBAction func touchUpList(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "HomeList", bundle: nil)
        if let nextVC = storyboard.instantiateViewController (identifier: "HomeListViewController") as? HomeListViewController {
            self.present(nextVC, animated: true, completion: nil)
            
        }
        
    }
    

}
