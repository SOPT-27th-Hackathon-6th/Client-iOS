//
//  getStoreListService.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2021/02/12.
//

import Alamofire
import SwiftyJSON
import Foundation


struct getStoreListService {
    static let shared = getStoreListService()
    
    func getMalaStoreList(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        // 임시 토큰 값
        let header : HTTPHeaders = ["token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWR4IjoyNCwiaWF0IjoxNjEzMTA5NzkzLCJleHAiOjE2MTMxMTMzOTMsImlzcyI6Imd1a2JhYk1hbGEifQ.C8eb1cmmUFzjdSase2vu9QFkUEkzkczx7dlYmFx3Rhk"]
        
        let url = APIConstants.maraStampURL
            
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
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
    
    func getGukbapStoreList(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        // 임시 토큰 값
        let header : HTTPHeaders = ["token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWR4IjoyNCwiaWF0IjoxNjEzMTA5NzkzLCJleHAiOjE2MTMxMTMzOTMsImlzcyI6Imd1a2JhYk1hbGEifQ.C8eb1cmmUFzjdSase2vu9QFkUEkzkczx7dlYmFx3Rhk"]

        let url = APIConstants.gukbabStampURL
            
        let dataRequest = AF.request(url,
                                     method: .get,
                                     encoding: JSONEncoding.default,
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
        case 200...299: return getStore(by: json)
        case 400...499: return .pathErr("")
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func getStore(by json: JSON) -> NetworkResult<Any> {
        let data = json["data"] as JSON //[0]
        var storeData = StoreListModel(stampIdx: data["stampIdx"].intValue,
                                       imageLink: data["imageLink"].stringValue,
                                       resName: data["resName"].stringValue,
                                       review: data["review"].stringValue,
                                       userIdx2: data["userIdx2"].intValue,
                                       updatedAt: data["updatedAt"].stringValue)
        return .success(storeData)
    }
}

