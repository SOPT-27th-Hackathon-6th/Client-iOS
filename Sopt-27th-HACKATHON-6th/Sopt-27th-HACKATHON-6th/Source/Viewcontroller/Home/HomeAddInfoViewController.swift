//
//  HomeAddInfoViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by 송지훈 on 2021/02/12.
//

import UIKit
import NVActivityIndicatorView

class HomeAddInfoViewController: UIViewController{

    
    //MARK:- IBOutlet Part

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextView!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    //MARK:- Variable Part
    
    var thumbnailImage = UIImage()
    var isMala : Bool = true
    


    //MARK:- Constraint Part

    
    //MARK:- Life Cycle Part

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
        setTextView()
        
    }
    
    //MARK:- IBAction Part
    
    
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func completeButtonClicked(_ sender: Any) {
        let indicator = NVActivityIndicatorView(frame: CGRect(x: view.center.x - 20, y: view.center.y - 20, width: 40, height: 40),
                                                type: .ballPulse,
                                                color: .init(red: 55/255, green: 55/255, blue: 55/255, alpha: 1),
                                                padding: 0)
        
        self.view.addSubview(indicator)

        
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        indicator.startAnimating()
        
        if titleTextField.text != "" &&
            contentTextField.text != ""
        {
            AddStampService.shared.write(isMala: isMala, title: titleTextField.text ?? "" , content: contentTextField.text ?? "", photo: thumbnailImage) { (result) in
                switch(result)
                {
                case .success(_):
                    guard let completeVC = self.storyboard?.instantiateViewController(identifier: "AddPhotoViewController") as? AddPhotoViewController else {return}
                    completeVC.isMara = self.isMala
                    completeVC.foodImage = self.thumbnailImage
                    
                    completeVC.modalPresentationStyle = .fullScreen
                    self.present(completeVC, animated: true) {
                        indicator.stopAnimating()
                    }
                    
                case .pathErr(let message):
                    if let msg = message as? String
                    {
                        makeAlert(title: "알림", message: msg, vc: self)
                    }
                case .networkFail :
                    makeAlert(title: "알림", message: "네트워크 상태를 확인해주세요"	, vc: self)
            
                default:
                    makeAlert(title: "알림", message: "오류가 발생하였습니다", vc: self)
                }
            }
        }
        else
        {
            makeAlert(title: "알림", message: "제목과 내용을 입력해주세요", vc: self)
        }
    }
    
    

    
    //MARK:- default Setting Function Part

    
    
    //MARK:- Notification - Observer & @objc func PART
    
    //MARK:- Function Part
    
    func setImage()
    {
        thumbnailImageView.image = thumbnailImage
    }

    
    func setTextView()
    {
        contentTextField.delegate = self
        
        contentTextField.text = "내용 입력(ex 후기, 식당정보)"
        
        contentTextField.textColor = UIColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        
    
        let contentPadding = contentTextField.textContainer.lineFragmentPadding
        
        contentTextField.textContainerInset = UIEdgeInsets(top: 0, left: -contentPadding, bottom: 0, right: -contentPadding)
        
        
        
        
        let toolBarKeyboard = UIToolbar()
                toolBarKeyboard.sizeToFit()
                let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
                let btnDoneBar = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(self.doneBtnClicked))
                toolBarKeyboard.items = [flexSpace,btnDoneBar]
                toolBarKeyboard.tintColor = .black

        contentTextField.inputAccessoryView = toolBarKeyboard
    }
    
    
    @IBAction func doneBtnClicked()
    {
        self.view.endEditing(true)
    }


}
//MARK:- extension 부분

extension HomeAddInfoViewController : UITextViewDelegate
{

        func textViewDidBeginEditing(_ textView: UITextView) {
            if textView.text == "내용 입력(ex 후기, 식당정보)"
            {
                contentTextField.text = ""
                contentTextField.textColor = .black
                
                
            }
            
        }
        // TextView Place Holder
        func textViewDidEndEditing(_ textView: UITextView) {
            if textView.text.isEmpty {
                contentTextField.text = "내용 입력(ex 후기, 식당정보)"
                contentTextField.textColor = UIColor.init(red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
            }
        }
}

