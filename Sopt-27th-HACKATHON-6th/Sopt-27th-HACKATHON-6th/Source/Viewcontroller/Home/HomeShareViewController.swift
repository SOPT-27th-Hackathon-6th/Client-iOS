//
//  HomeShareViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by 송지훈 on 2021/02/12.
//

import UIKit
import KakaoSDKTemplate
import KakaoSDKLink
import KakaoSDKCommon

class HomeShareViewController: UIViewController {
    
    
    
    //MARK:- IBOutlet Part
    
    
    //MARK:- Variable Part
    
    var isMala : Bool = true
    var imageForShare = UIImage()
    //MARK:- Constraint Part
    
    
    //MARK:- Life Cycle Part
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK:- IBAction Part
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func kakaoButtonClicked(_ sender: Any) {
        shareAction()
    }
    
    
    @IBAction func instaButtonClicked(_ sender: Any) {
        
        if let storyShareURL = URL(string: "instagram-stories://share") {
            if UIApplication.shared.canOpenURL(storyShareURL)
            {
                
                guard let image = imageForShare.pngData() else {return}
                let pasteboardItems : [String:Any] = [
                    "com.instagram.sharedSticker.stickerImage": image,
                    //           "com.instagram.sharedSticker.backgroundTopColor" : "#636e72",
                    //           "com.instagram.sharedSticker.backgroundBottomColor" : "#b2bec3",
                    
                ]
                
                let pasteboardOptions = [
                    UIPasteboard.OptionsKey.expirationDate : Date().addingTimeInterval(300)
                ]
                UIPasteboard.general.setItems([pasteboardItems], options: pasteboardOptions)
                
                
                UIApplication.shared.open(storyShareURL, options: [:], completionHandler: nil)
            }
            else
            {
                makeAlert(title: "알림", message: "인스타그램이 필요합니다", vc: self)
            }
            
        }
        
    }
        //MARK:- default Setting Function Part
        
        
        
        
        //MARK:- Notification - Observer & @objc func PART
        
        //MARK:- Function Part
        
        func shareAction() // 친구에게 공유하기
        {
            var title : String = ""
            if isMala { title = "오늘도 마라탕에 빠지고 마라탕..."}
            else { title = "오늘도 뜨끈한 국밥 든든하게 먹었다... "}
            
            
            let feedTemplateJsonStringData =
                """
                    {
                        "object_type": "feed",
                        "content": {
                            "title": "\(title)",
                            "image_url": "https://user-images.githubusercontent.com/60260284/99888080-23595500-2c8d-11eb-9cbc-417580997d60.png",
                            "link" : {
                                    "mobile_web_url": "https://developers.kakao.com",
                                    "web_url": "https://developers.kakao.com"
                            }

                        },
                    
                        "buttons": [
                    
                            {
                                "title": "나의 마라 혈중농도 확인하러 가기",
                                "link": {
                                    "android_execution_params": "key1=value1&key2=value2",
                                    "ios_execution_params": "key1=qna&key2=1"
                                }
                            }
                        ]
                    }
                    """.data(using: .utf8)!
            
            
            if let templatable = try?
                SdkJSONDecoder.custom.decode(FeedTemplate.self, from: feedTemplateJsonStringData) {
                LinkApi.shared.defaultLink(templatable: templatable) {(linkResult, error) in
                    if let error = error {
                        print("error")
                    }
                    else {
                        print("defaultLink() success.")
                        
                        if let linkResult = linkResult {
                            UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                        }
                    }
                }
            }
            
        }
        
        
    }
//MARK:- extension 부분
