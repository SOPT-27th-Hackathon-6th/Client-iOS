//
//  getLevelService.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/11/22.
//

import Foundation
import Alamofire
import SwiftyJSON

struct getLevelService {
    static let shared = getLevelService()
    
    func getLevel(foodType: Int,
                  completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let url = APIConstants.levelURL + "/\(foodType)"
     
        let dataRequest = AF.request(url,
                                     method : .get,
                                     encoding: JSONEncoding.default)
        
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
                
            case 200...299: return getLevel(by: json)
            case 400...499: return .pathErr
            case 500: return .serverErr
            default: return .networkFail
            }
        }
    
    
    
    private func getLevel(by json: JSON) -> NetworkResult<Any> {
        let data = json["data"] as JSON
        var levelData = levelDataModel(id: data[0]["id"].intValue, levelNum: data[0]["levelNum"].intValue, description: data[0]["description"].stringValue, foodType: data[0]["foodType"].intValue, levelName: data[0]["levelName"].stringValue)
        return .success(levelData)
    }
        
        
        


}
