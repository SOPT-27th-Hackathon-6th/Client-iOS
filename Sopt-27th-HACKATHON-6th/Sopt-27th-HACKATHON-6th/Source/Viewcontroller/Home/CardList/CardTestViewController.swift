//
//  CardTestViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/12/24.
//

import UIKit

class CardTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func touchUpCard(_ sender: Any) {
        if let cardVC = self.storyboard?.instantiateViewController(withIdentifier: "CardViewController") {
            cardVC.providesPresentationContextTransitionStyle = true
            cardVC.definesPresentationContext = true
            cardVC.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext;
            cardVC.view.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
            self.present(cardVC, animated: true, completion: nil)
        }
    }
    
}
