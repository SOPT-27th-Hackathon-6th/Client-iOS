//
//  MyProfileViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by 송지훈 on 2020/12/18.
//

import UIKit
import MessageUI

class MyProfileViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    @IBOutlet weak var nickNameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var maraCountLabel: UILabel!
    @IBOutlet weak var gukbabCountLabel: UILabel!
    
    var imageURLString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataInit()
        getMaraCount()
        getGukbabCount()
        
        NotificationCenter.default.addObserver(self, selector: #selector(settingLabel(_:)), name: NSNotification.Name("dataReceived"), object: nil)
    }
    
    // 보내고 나면 mail화면 dismiss
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    func dataInit() {
        getUserInfoService.shared.getUserInfo() { (result) in
            switch(result) {
            case .success(let data):
                print(data)
                if let userInfoModel = data as? UserInfoModel {
                    self.nickNameLabel.text = userInfoModel.nickname
                    print(userInfoModel)
                    self.imageURLString = userInfoModel.profileImg
                    if userInfoModel.profileImg == "" {
                        self.profileImage.image = UIImage(named: "logo")
                    }
                    else {
                        let url = URL(string: userInfoModel.profileImg)
                        DispatchQueue.global().async {
                            let data = try? Data(contentsOf: url!)
                            DispatchQueue.main.async {
                                self.profileImage.image = UIImage(data: data!)
                                
                            }
                        }
  
                    }
                }
            case .requestErr(_):
                print("error")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
        
    
        
    }
    
    @IBAction func editBtnClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "My", bundle: nil)
        
        if let editVC = storyboard.instantiateViewController(withIdentifier: "MyEditViewController") as? MyEditViewController {
            editVC.modalPresentationStyle = .overFullScreen
            editVC.modalTransitionStyle = .crossDissolve
            editVC.beforeNickname = self.nickNameLabel.text!
            editVC.beforeProfileImage = self.imageURLString
            self.present(editVC, animated: true, completion: {
            })
        }
        
    }
    
    
    @IBAction func emailBtnClicked(_ sender: Any) {
        let mc = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setToRecipients(["gukbabmala@gmail.com"])
        if MFMailComposeViewController.canSendMail() { self.present(mc, animated: true, completion: nil) }
        else { let alertController: UIAlertController = UIAlertController(title:"메일 보내기", message:"\n현재 디바이스에서 이메일을 보낼수가 없습니다. 설정에서 이메일 관련 설정을 확인해주세요", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "확인", style: .default, handler: { (alert: UIAlertAction!) in })
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil) }
        
    }
    
    
    
    @objc func settingLabel(_ noti: NSNotification) {
        nickNameLabel.text = noti.object as? String ?? ""
    }
    
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func getMaraCount()
    {
        getStampCountService.shared.getStamp(isMara: true) { (result) in
            switch(result)
            {
            case .success(let count):
                let maraCount = count as? Int ?? 0
                self.maraCountLabel.text = "\(maraCount)회"
                
  
            default:
                makeAlert(title: "알림", message: "개수 정보를 가져오는데 실패하였습니다", vc: self)
            }
        }

    }
    
    func getGukbabCount()
    {
        getStampCountService.shared.getStamp(isMara: false) { (result) in
            switch(result)
            {
            case .success(let count):
                print(count)
                let gukbabCount = count as? Int ?? 0
                self.gukbabCountLabel.text = "\(gukbabCount)회"
                
                
            default:
                makeAlert(title: "알림", message: "개수 정보를 가져오는데 실패하였습니다", vc: self)
            }
        }
    }
    
    
}
