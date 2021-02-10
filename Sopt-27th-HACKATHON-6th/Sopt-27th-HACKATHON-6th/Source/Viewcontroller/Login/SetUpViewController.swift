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
    @IBOutlet weak var warningLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = "국밥마라 닉네임을\n입력해주세요"
        defaultSetting()
        disableSignupButton()
        
    }
    
    
    
    
    //MARK:- IBAction Part
    /// 버튼과 같은 동작을 선언하는 @IBAction 을 선언합니다 , IBAction 함수 명은 동사 형태로!!  // 함수명 lowerCamelCase 사용
    /// ex) @IBAction func answerSelectedButtonClicked(_ sender: Any) {  code .... }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    
    @IBAction func TouchUpHome(_ sender: UIButton) {
        
        
        
        // 등록 성공했을 때에만 통신을 해야 함 .
        
        
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
    
    func disableSignupButton()
    {
        enterBtn.isEnabled = false
        
        enterBtn.backgroundColor = UIColor(displayP3Red: 214/255, green: 214/255, blue: 214/255, alpha: 1)
        
    }
    
    func enableSignupButton()
    {
        enterBtn.isEnabled = true
        
        enterBtn.backgroundColor = UIColor(displayP3Red: 203/255, green: 65/255, blue: 30/255, alpha: 1)
    }
    
    func defaultSetting() {
        
        nicknameTF.delegate = self
        //textfield
        nicknameTF.borderStyle = .none
        nicknameTF.addTarget(self, action: #selector(checkNickname), for: .allEditingEvents)

        
        //enter button
        
        
        let toolBarKeyboard = UIToolbar()
        toolBarKeyboard.sizeToFit()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let btnDoneBar = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(self.doneBtnClicked))
        toolBarKeyboard.items = [flexSpace,btnDoneBar]
        toolBarKeyboard.tintColor = .black
        
        nicknameTF.inputAccessoryView = toolBarKeyboard

        enterBtn.layer.cornerRadius = enterBtn.frame.height / 2
        enterBtn.tintColor = UIColor.white
    }
    
    
    
    @IBAction func doneBtnClicked()
    {
        self.view.endEditing(true)
    }
    
    
    @objc func checkNickname()
    {
        
        if nicknameTF.text?.count ?? -1 >= 2
            && nicknameTF.text?.count ?? -1 <= 8
        {
            warningLabel.textColor = .init(red: 76/255, green: 216/255, blue: 100/255, alpha: 1)
            warningLabel.text = "사용 가능한 닉네임입니다."
            enableSignupButton()
        }
        
        else
        {
            warningLabel.textColor = .red
            disableSignupButton()
        }
    }
}


extension SetUpViewController : UITextFieldDelegate
{

    
}
