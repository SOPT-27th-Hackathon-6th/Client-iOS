//
//  MyEditViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by soyounglee on 2020/12/18.
//

import UIKit

class MyEditViewController: UIViewController {
    @IBOutlet weak var doneView: UIImageView!
    @IBOutlet weak var doneBtnImage: UIImageView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var modalBtn: UIButton!
    @IBOutlet weak var lineImage: UIImageView!
    @IBOutlet weak var nicknameTF: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doneView.isHidden = true
        modalBtn.isEnabled = false

    }
    
    
    @IBAction func editFinishBtn(_ sender: Any) {
       NotificationCenter.default.post(name: NSNotification.Name("dataReceived"), object: nicknameTF.text!)
        editFinish()
        
    }
    
    @IBAction func modalBtnClicked(_ sender: Any) {
        print("modalBtnClicked")
       
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func backBtnClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func editFinish() {
        modalBtn.isEnabled = true
        doneBtn.isEnabled = false
        nicknameTF.isEnabled = false
        
        doneView.isHidden = false
        doneBtnImage.isHidden = true
        lineImage.isHidden = true
        nicknameTF.isHidden = true
        
    }
    
    @IBAction func bigBtnClicked(_ sender: Any) {
        self.nicknameTF.resignFirstResponder()
        
    }
    
   
}

