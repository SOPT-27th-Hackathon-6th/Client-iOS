//
//  LoginViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by 송지훈 on 2020/12/18.
//

import UIKit
import AuthenticationServices
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {

    //MARK:- IBOutlet Part
    @IBOutlet var appleSignInButton: UIStackView!
    @IBOutlet var introLabel: UILabel!
    @IBOutlet var kakaoBtn: UIButton!
    

    //MARK:- Variable Part

    //MARK:- Constraint Part
    

    //MARK:- Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        defualtSetting()
        setAppleSignInButton()

    }
    
    //MARK:- IBAction Part
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        
        guard let homeVC = homeStoryboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {return}
        
        self.navigationController?.pushViewController(homeVC, animated: true)
    
    }
    
    @IBAction func touchUpNickname(_ sender: Any) {
        
        guard let homeVC = storyboard?.instantiateViewController(withIdentifier: "SetUpViewController") as? SetUpViewController else {return}
        
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    @IBAction func touchUpKakaoLogin(_ sender: Any) {
        // 카카오톡 설치 여부 확인
        if (AuthApi.isKakaoTalkLoginAvailable()) {
            AuthApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        }
        
        AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")

                    //do something
                    _ = oauthToken
                }
            }
    }
    
    //MARK:- default Setting Function Part
    func defualtSetting() {
        introLabel.text = "국밥과 마라에 진심인 당신.\n당신의 진심을 기록하고 공유하세요."
        
        kakaoBtn.backgroundColor = UIColor(displayP3Red: 254/255, green: 229/255, blue: 0/255, alpha: 1)
        kakaoBtn.layer.cornerRadius = kakaoBtn.frame.height / 2
        
        appleSignInButton.layer.cornerRadius = appleSignInButton.frame.height / 2
        
    }

    //MARK:- Function Part
    func setAppleSignInButton() {
        let authorizationButton = ASAuthorizationAppleIDButton(type: .signIn, style: .whiteOutline)
        authorizationButton.addTarget(self, action: #selector(appleSignInButtonPress), for: .touchUpInside)
        self.appleSignInButton.addArrangedSubview(authorizationButton)
    }
    
    
    //MARK:- @objc function Part
    @objc func appleSignInButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
            
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
}

    //MARK:- extension 부분


extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}
extension LoginViewController: ASAuthorizationControllerDelegate {
    // Apple ID 연동 성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        // Apple ID
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                
            // 계정 정보 가져오기
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
                
            print("User ID : \(userIdentifier)")
            print("User Email : \(email ?? "")")
            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
     
            self.saveUserInKeychain(userIdentifier)
            self.showResultViewController(userIdentifier: userIdentifier, fullName: fullName, email: email)
            
        case let passwordCredential as ASPasswordCredential:
        
            // Sign in using an existing iCloud Keychain credential.
            let username = passwordCredential.user
            let password = passwordCredential.password
            
            // For the purpose of this demo app, show the password credential as an alert.
            DispatchQueue.main.async {
                self.showPasswordCredentialAlert(username: username, password: password)
            }
        default:
            break
        }
    }
    private func saveUserInKeychain(_ userIdentifier: String) {
        do {
            try KeychainItem(service: "com.example.apple-samplecode.juice", account: "userIdentifier").saveItem(userIdentifier)
        } catch {
            print("Unable to save userIdentifier to keychain.")
        }
    }
    
    private func showResultViewController(userIdentifier: String, fullName: PersonNameComponents?, email: String?) {
        guard let setUpVC = storyboard?.instantiateViewController(withIdentifier: "SetUpViewController") as? SetUpViewController else {return}

        self.navigationController?.pushViewController(setUpVC, animated: true)

        DispatchQueue.main.async {
//            viewController.userIdentifierLabel.text = userIdentifier
//            if let givenName = fullName?.givenName {
//                viewController.givenNameLabel.text = givenName
//            }
//            if let familyName = fullName?.familyName {
//                viewController.familyNameLabel.text = familyName
//            }
//            if let email = email {
//                viewController.emailLabel.text = email
//            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    private func showPasswordCredentialAlert(username: String, password: String) {
        let message = "The app has received your selected credential from the keychain. \n\n Username: \(username)\n Password: \(password)"
        let alertController = UIAlertController(title: "Keychain Credential Received",
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    // Apple ID 연동 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
    }
}
extension UIViewController {

    func showLoginViewController() {
//        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        guard let setUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SetUpViewController") as? SetUpViewController else {return}
        self.navigationController?.pushViewController(setUpVC, animated: true)
    }
}
