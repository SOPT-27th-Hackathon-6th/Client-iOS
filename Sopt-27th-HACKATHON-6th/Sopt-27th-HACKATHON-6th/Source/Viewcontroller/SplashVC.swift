//
//  SplashVC.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2021/02/14.
//

import UIKit
import AuthenticationServices
import KakaoSDKAuth
import KakaoSDKUser

class SplashVC: UIViewController {

    var kakaoId: String!
    var appleId: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        kakaoLogin()
        appleId = KeychainItem.currentUserIdentifier

        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            if self.kakaoId != nil {
                // 나중에 서버에 snsId, provider POST
                print("splash kakao \(self.kakaoId)")
                let vc = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(identifier: "HomeViewController") as? HomeViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else if self.appleId != nil {
                // 나중에 서버에 snsId, provider POST
                print("splash apple \(self.appleId)")
                let vc = UIStoryboard.init(name: "Home", bundle: nil).instantiateViewController(identifier: "HomeViewController") as? HomeViewController
                self.navigationController?.pushViewController(vc!, animated: true)
            }
            else {
                let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginViewController")
                self.navigationController?.pushViewController(vc, animated: true)
            }
        })
    }
    
    func kakaoLogin() {
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("splash kakao me() success.")
                _ = user
                if let snsId = user?.id {
                    self.kakaoId = String(snsId)
                }
            }
        }
    }
}
