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
    
    // 앨범 연결
    let picker = UIImagePickerController()
    
    override func viewWillAppear(_ animated: Bool) {
        dataInit()
        getMaraCount()
        getGukbabCount()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        picker.delegate = self
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(settingLabel(_:)), name: NSNotification.Name("dataReceived"), object: nil)
    }
    
    // 보내고 나면 mail화면 dismiss
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func editBtnClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "My", bundle: nil)
        
        if let editVC = storyboard.instantiateViewController(withIdentifier: "MyEditViewController") as? MyEditViewController {
            editVC.modalPresentationStyle = .overFullScreen
            editVC.modalTransitionStyle = .crossDissolve
            editVC.beforeNickname = self.nickNameLabel.text!
            editVC.beforeProfileImage = self.profileImage.image
            self.present(editVC, animated: true, completion: {
            })
        }
        
    }
    
    @IBAction func profileImgEditClicked(_ sender: Any) {
        let alert =  UIAlertController(title: "프로필 사진 설정", message: "프로필 변경", preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "앨범에서 사진 선택", style: .default) { (action) in
            self.openLibrary()
        }
        
        let camera =  UIAlertAction(title: "카메라로 촬영", style: .default) { (action) in
            self.openCamera()
        }
        
        let origin = UIAlertAction(title: "기본 이미지로 설정", style: .default) {(action) in
            self.setImgOriginal()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(origin)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
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
    
    
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
        
    }
    
    func openCamera(){
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            picker.sourceType = .camera
            present(picker, animated: false, completion: nil)
        }
        
        else {
            print("카메라 사용 불가")
        }
    }
    
    func setImgOriginal() {
        profileImage.image = UIImage(named: "logo")
    }
    
    
}

extension MyProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            profileImage.image = image
            print(info)
            putUserInfo()
        }
        dismiss(animated: true, completion: nil)
        
    }
    
}

extension MyProfileViewController {
    
    //서버 관련
    
    
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
    
    func putUserInfo() {
        let nickName = self.nickNameLabel.text!
        let profileImg = self.profileImage.image
        putUserInfoService.shared.putUserInfo(nickName, profileImg!) { (result) in
            switch(result) {
            case .success(let data):
                print(data)
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
    
    func getMaraCount() {
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
    
    func getGukbabCount() {
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
