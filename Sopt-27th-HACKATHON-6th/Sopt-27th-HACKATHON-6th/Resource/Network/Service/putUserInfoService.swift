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
    
    func putUserInfo(_ nickname: String, _ profileImage:String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        // 임시 토큰 값
        let header : HTTPHeaders = ["token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWR4IjoyNCwiaWF0IjoxNjEzMTA5NzkzLCJleHAiOjE2MTMxMTMzOTMsImlzcyI6Imd1a2JhYk1hbGEifQ.C8eb1cmmUFzjdSase2vu9QFkUEkzkczx7dlYmFx3Rhk"]
        let body: Parameters = [
            "profileImg" : profileImage,
            "nickname" : nickname
        ]
        
        var userInfoURL = APIConstants.userInfoURL
        
        let dataRequest = AF.request(userInfoURL, method  : .put,
                                     parameters: body,
                                     encoding:JSONEncoding.default,
                                     headers: header)
        
        
        
        dataRequest.responseData { dataResponse in
            
            switch dataResponse.result {
            case .success:
                
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                
                let json = JSON(value)
                
                let networkResult = self.judge(by: statusCode, json)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    
    private func judge(by statusCode: Int, _ json: JSON) -> NetworkResult<Any>  {
        switch statusCode {
        
        case 200...299: return .success(json)
        case 400...499: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    

    
    
}
