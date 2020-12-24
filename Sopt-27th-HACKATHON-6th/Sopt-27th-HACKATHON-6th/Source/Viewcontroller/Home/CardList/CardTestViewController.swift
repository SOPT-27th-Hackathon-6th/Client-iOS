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
        if let nextVC = storyboard?.instantiateViewController (identifier: "CardViewController") as? CardViewController {
//            self.modalPresentationStyle = .fullScreen
            self.present(nextVC, animated: true, completion: nil)
            
        }
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
