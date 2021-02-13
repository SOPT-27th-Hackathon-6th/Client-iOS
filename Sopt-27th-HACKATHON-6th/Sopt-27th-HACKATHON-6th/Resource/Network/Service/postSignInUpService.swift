//
//  postSignInUpService.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2021/02/13.
//

import Foundation
import Alamofire

struct postSignInUpService {
    static let shared = postSignInUpService()
    
    func signUp(nickName: String,
                snsId: String,
                provider: String,
                completion: @escaping (NetworkResult<Any>) -> ()) {
        
        let url = APIConstants.signUpURL
        
        let header: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        let body: Parameters = [
            "nickName" : nickName,
            "snsId" : snsId,
            "provider" : provider
        ]
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { (response) in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                let networkResult = self.judge(by: statusCode)
                
                completion(networkResult)
                
            case.failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    func signIn(snsId: String,
                provider: String,
                completion: @escaping (NetworkResult<Any>) -> ()) {
        
        let url = APIConstants.signInURL
        let header: HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        let body: Parameters = [
            "snsId" : snsId,
            "provider" : provider
        ]
        
        let dataRequest = AF.request(url,
                                     method: .post,
                                     parameters: body,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { (response) in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                let networkResult = self.judge(by: statusCode)
                
                completion(networkResult)
                
            case.failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    private func judge(by statusCode: Int) -> NetworkResult<Any>  {
        switch statusCode {
            
        case 200...299: return .success("sign in/up service")
        case 400...499: return .pathErr("")
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}

