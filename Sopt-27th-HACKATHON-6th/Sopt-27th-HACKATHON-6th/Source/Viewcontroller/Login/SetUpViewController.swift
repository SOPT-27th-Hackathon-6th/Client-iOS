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
    @IBOutlet var enterBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateSetting()
        defaultSetting()
    }
    
    //MARK:- IBAction Part
    /// 버튼과 같은 동작을 선언하는 @IBAction 을 선언합니다 , IBAction 함수 명은 동사 형태로!!  // 함수명 lowerCamelCase 사용
    /// ex) @IBAction func answerSelectedButtonClicked(_ sender: Any) {  code .... }
    
    @IBAction func TouchUpHome(_ sender: UIButton) {
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        
        guard let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {return}
//        homeVC.nickName = nicknameTF.text
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    
    //MARK:- default Setting Function Part
    /// 기본적인 세팅을 위한 함수 부분입니다 // 함수명 lowerCamelCase 사용
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }
    func delegateSetting(){
        nicknameTF.delegate = self
    }
    func defaultSetting() {
        // label
        descriptionLabel.text = "국밥마라 닉네임을\n입력해주세요"
        // textfield
        nicknameTF.borderStyle = .none
        let border = CALayer()
        border.frame = CGRect(x: 0, y: nicknameTF.frame.size.height-1, width: nicknameTF.frame.width, height: 1)
        border.backgroundColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1).cgColor
        nicknameTF.attributedPlaceholder = NSAttributedString(string: "닉네임", attributes: [NSAttributedString.Key.foregroundColor: UIColor(displayP3Red: 196/255, green: 196/255, blue: 196/255, alpha: 1)])
        nicknameTF.layer.addSublayer((border))
        nicknameTF.textAlignment = .left
        nicknameTF.textColor = UIColor.black
        
        // enter button
        enterBtn.backgroundColor = UIColor(displayP3Red: 203/255, green: 65/255, blue: 30/255, alpha: 1)
        enterBtn.layer.cornerRadius = enterBtn.frame.height / 2
        enterBtn.tintColor = UIColor.white
    }
}
extension SetUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
