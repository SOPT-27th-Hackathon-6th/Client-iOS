//
//  CardTestViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/12/24.
//

import UIKit

class CardTestViewController: UIViewController {
    // navi는 테스트용
    override func viewDidLoad() {
        super.viewDidLoad()        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func touchUpCard(_ sender: Any) {
        if let cardVC = self.storyboard?.instantiateViewController(withIdentifier: "CardViewController") as? CardViewController {
            cardVC.modalPresentationStyle = .overCurrentContext
//            cardVC.modalPresentationStyle = .overFullScreen
            cardVC.modalTransitionStyle = .crossDissolve
            cardVC.view.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
            cardVC.type = "Mala"
            self.present(cardVC, animated: true, completion: nil)
        }
    }
    
    @IBAction func touchUpGukbap(_ sender: Any) {
        if let cardVC = self.storyboard?.instantiateViewController(withIdentifier: "CardViewController") as? CardViewController {
            cardVC.modalPresentationStyle = .overCurrentContext
            cardVC.modalTransitionStyle = .crossDissolve
            cardVC.view.backgroundColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.7)
            cardVC.type = "Gukbap"
            self.present(cardVC, animated: true, completion: nil)
        }
    }
}
