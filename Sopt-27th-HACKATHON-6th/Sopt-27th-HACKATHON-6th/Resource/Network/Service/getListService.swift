//
//  getListService.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/12/27.
//

import Foundation
import Alamofire
import SwiftyJSON

struct getListService {
    static let shared = getListService()
    
    func getMalaList(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIConstants.maraStampURL
        let dataRequest = AF.request(url,
                                     method : .get,
                                     encoding: JSONEncoding.default)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                
                let json = JSON(value)
                
                let networkResult = self.malaJudge(by: statusCode, json)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    private func malaJudge(by statusCode: Int, _ json: JSON) -> NetworkResult<Any>  {
        switch statusCode {
            
        case 200...299: return getFoodList(by: json)
        case 400...499: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    func getGukbapList(completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIConstants.gukbabStampURL
        let dataRequest = AF.request(url,
                                     method : .get,
                                     encoding: JSONEncoding.default)
        
        dataRequest.responseData { dataResponse in
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else { return }
                guard let value = dataResponse.value else { return }
                
                let json = JSON(value)
                
                let networkResult = self.gukbapJudge(by: statusCode, json)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    private func gukbapJudge(by statusCode: Int, _ json: JSON) -> NetworkResult<Any>  {
        switch statusCode {
            
        case 200...299: return getFoodList(by: json)
        case 400...499: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func getFoodList(by json: JSON) -> NetworkResult<Any> {
        let data = json["data"] as JSON
        var listData = ListModel(stampIdx: data["stampIdx"].intValue,
                                 imageLink: data["imageLink"].stringValue,
                                 resName: data["resName"].stringValue,
                                 review: data["review"].stringValue,
                                 updatedAt: data["updatedAt"].stringValue,
                                 userIdx: data["userIdx"].intValue)
        return .success(listData)
    }
}
