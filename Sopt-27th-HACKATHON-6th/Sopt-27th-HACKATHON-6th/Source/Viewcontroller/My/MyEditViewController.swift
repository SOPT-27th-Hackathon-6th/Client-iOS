//
//  MyEditViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by soyounglee on 2020/12/18.
//

import UIKit

class MyEditViewController: UIViewController, UITextFieldDelegate {
    
    
    //MARK:- IBOutlet Part
    /// Label, ColelctionView, TextField, ImageView 등 @IBOutlet 변수들을 선언합니다.  // 변수명 lowerCamelCase 사용
    /// ex)  @IBOutlet weak var qnaTextBoxBackgroundImage: UIImageView!
    
    @IBOutlet weak var doneView: UIImageView!
    @IBOutlet weak var doneBtnImage: UIImageView!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var modalBtn: UIButton!
    @IBOutlet weak var lineImage: UIImageView!
    @IBOutlet weak var nicknameTF: UITextField!
    @IBOutlet weak var warningLabel: UILabel!
    
    
    
    //MARK:- Variable Part
    /// 뷰컨에 필요한 변수들을 선언합니다  // 변수명 lowerCamelCase 사용
    /// ex)  var imageViewList : [UIImageView] = []
    
    
    private let maxLength = 8
    
    
    
    //MARK:- Constraint Part
    /// 스토리보드에 있는 layout 에 대한 @IBOutlet 을 선언합니다. (Height, Leading, Trailing 등등..)  // 변수명 lowerCamelCase 사용
    /// ex) @IBOutlet weak var lastImageBottomConstraint: NSLayoutConstraint!
    
    
    
    //MARK:- Life Cycle Part
    /// 앱의 Life Cycle 부분을 선언합니다
    /// ex) override func viewWillAppear() { }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startViewSetting()
        
        nicknameTF.delegate = self
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textDidChange(_:)),
                                               name: UITextField.textDidChangeNotification,
                                               object: nicknameTF)
        
    }
    
    
    
    //MARK:- IBAction Part
    /// 버튼과 같은 동작을 선언하는 @IBAction 을 선언합니다 , IBAction 함수 명은 동사 형태로!!  // 함수명 lowerCamelCase 사용
    /// ex) @IBAction func answerSelectedButtonClicked(_ sender: Any) {  code .... }
    
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
    
    
    @IBAction func bigBtnClicked(_ sender: Any) {
        self.nicknameTF.resignFirstResponder()
        
    }
    
    
    
    
    //MARK:- default Setting Function Part
    /// 기본적인 세팅을 위한 함수 부분입니다 // 함수명 lowerCamelCase 사용
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }
    
    
    //MARK:- Function Part
    /// 로직을 구현 하는 함수 부분입니다. // 함수명 lowerCamelCase 사용
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else {return false}
    
       
        
        
        // 중간에 추가되는 텍스트 막기
        if text.count >= maxLength && range.length == 0 && range.location < maxLength {
            return false
        }
        
        return true
    }
    
    @objc private func textDidChange(_ notification: Notification) {
        if let textField = notification.object as? UITextField {
            if let text = textField.text {
                // 초과되는 텍스트 제거
                if text.count >= maxLength {
                    let index = text.index(text.startIndex, offsetBy: maxLength)
                    let newString = text[text.startIndex..<index]
                    textField.text = String(newString)
                    
                    // 8글자 넘어가면 자동으로 키보드 내려감
                    textField.resignFirstResponder()
                }

                if text.count < 2 || text.count > 8 {
                    warningLabel.text = "2글자 이상 8글자 이하로 입력해주세요"
                    warningLabel.textColor = .red
                    
                    //완료버튼 비활성화
                    doneBtn.isEnabled = false
                    doneBtnImage.isHidden = true
                }
                else {
                    warningLabel.text = "사용 가능한 닉네임입니다."
                    warningLabel.textColor = .green
                    
                    //완료버튼 활성화
                    doneBtn.isEnabled = true
                    doneBtnImage.isHidden = false
                }
            }
        }
    }
    
    
    func startViewSetting() {
        doneView.isHidden = true
        modalBtn.isEnabled = false
        doneBtn.isEnabled = false
        doneBtnImage.isHidden = true
    }
    
    func editFinish() {
        modalBtn.isEnabled = true
        doneBtn.isEnabled = false
        nicknameTF.isEnabled = false
        
        doneView.isHidden = false
        doneBtnImage.isHidden = true
        lineImage.isHidden = true
        nicknameTF.isHidden = true
        warningLabel.textColor = .clear
        
    }
    
    
    
    
    //MARK:- extension 부분
    /// UICollectionViewDelegate 부분 처럼 외부 프로토콜을 채택하는 경우나, 외부 클래스 확장 할 때,  extension을 작성하는 부분입니다
    /// ex) extension ViewController : UICollectionViewDelegate {  code .... }
    
}
