//
//  CardViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/12/19.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet var rootView: UIView!
    @IBOutlet var cardView: UIView!
    @IBOutlet var storeNameLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var foodImageView: UIImageView!
    @IBOutlet var reviewLabel: UILabel!
    @IBOutlet var divideBarLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultCardSet()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesBegan(touches, with: event)
        if let touch = touches.first , touch.view == self.view {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    @IBAction func touchUpList(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "HomeList", bundle: nil)
        if let nextVC = storyboard.instantiateViewController (identifier: "HomeListViewController") as? HomeListViewController {
            self.present(nextVC, animated: true, completion: nil)
            
        }
        
    }
    
    func defaultCardSet() {
        rootView.backgroundColor = UIColor(displayP3Red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
        
        cardView.layer.cornerRadius = 15
        dateLabel.textColor = UIColor(displayP3Red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
        divideBarLabel.backgroundColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
    }

}
