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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(settingLabel(_:)), name: NSNotification.Name("dataReceived"), object: nil)
    }
  
    // 보내고 나면 mail화면 dismiss
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
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
    

    
}
