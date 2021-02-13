//
//  putUserInfoService.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by soyounglee on 2021/02/12.
//

import Alamofire
import SwiftyJSON
import Foundation


struct putUserInfoService {
    static let shared = putUserInfoService()
    
    func putUserInfo(_ nickname: String, _ profileImage:UIImage, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        // 임시 토큰 값
        let header : HTTPHeaders = ["token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWR4IjoyNCwiaWF0IjoxNjEzMTA5NzkzLCJleHAiOjE2MTMxMTMzOTMsImlzcyI6Imd1a2JhYk1hbGEifQ.C8eb1cmmUFzjdSase2vu9QFkUEkzkczx7dlYmFx3Rhk"]
        
        let body: Parameters = [
            "nickname" : nickname
        ]
        
        let imageData = profileImage.jpegData(compressionQuality: 1)!
        
        print("nickname: \(nickname) , profileImage: \(profileImage)")
        
        var userInfoURL = APIConstants.userInfoURL
        
        AF.upload(
            multipartFormData: { multipartFormData in
                print(profileImage)
                
                multipartFormData.append(imageData, withName: "profileImg",fileName: "profile_image.jpg", mimeType: "image/jpg")
                for (key, value) in body { multipartFormData.append("\(value)".data(using: .utf8)!, withName: key, mimeType: "text/plain") }

            },
            to: userInfoURL,
            method: .put,
            headers: header).responseJSON { response in
                print(response)
            }
        
    }
}


