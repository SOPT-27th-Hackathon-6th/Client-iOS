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
        guard let nextVC = storyboard?.instantiateViewController (identifier: "CardViewController") as? CardViewController else {return}
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    

}
