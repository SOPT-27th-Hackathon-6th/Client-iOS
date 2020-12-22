//
//  SetUpViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/12/21.
//

import UIKit

class SetUpViewController: UIViewController {

    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var nicknameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = "국밥마라 닉네임을\n입력해주세요"
        setTextField()
    }
    
    
    func setTextField() {
        nicknameTF.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: nicknameTF.frame.size.height-1, width: nicknameTF.frame.width, height: 1)
        border.backgroundColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1).cgColor
        nicknameTF.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 196/255, green: 196/255, blue: 196/255, alpha: 1)])
        nicknameTF.layer.addSublayer((border))
        nicknameTF.textAlignment = .left
        nicknameTF.textColor = UIColor.black
    }

    @IBAction func TouchUpHome(_ sender: UIButton) {
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        
        guard let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {return}
        
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    

}
