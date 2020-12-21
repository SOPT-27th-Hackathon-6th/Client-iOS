//
//  SetUpViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/12/21.
//

import UIKit

class SetUpViewController: UIViewController {

    @IBOutlet var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = "국밥마라 닉네임을\n입력해주세요"
    }
    

    @IBAction func TouchUpHome(_ sender: UIButton) {
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        
        guard let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {return}
        
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    

}
