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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
