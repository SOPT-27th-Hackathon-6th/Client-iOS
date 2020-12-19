//
//  LoginViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by 송지훈 on 2020/12/18.
//

import UIKit
import AuthenticationServices

class LoginViewController: UIViewController {

    //MARK:- IBOutlet Part
    

    //MARK:- Variable Part

    //MARK:- Constraint Part
    

    //MARK:- Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true


    }
    
    //MARK:- IBAction Part
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        
        guard let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {return}
        
        self.navigationController?.pushViewController(homeVC, animated: true)
    
    }
    
    
    //MARK:- default Setting Function Part
    

    //MARK:- Function Part
    

    
    //MARK:- @objc function Part
   
}

    //MARK:- extension 부분
