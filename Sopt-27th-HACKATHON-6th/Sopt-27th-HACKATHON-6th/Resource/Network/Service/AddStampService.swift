//
//  AddStampService.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by 송지훈 on 2020/11/21.
//


import Alamofire
import SwiftyJSON
import Foundation


struct AddStampService {
    static let shared = AddStampService()
    
    private func makeParameter() -> Parameters {
        return [
                "isStamp": 1
                ]
    }
    


    func addStamp(isMara : Bool, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        var stampURL = ""
        if isMara == true
        {
            stampURL = APIConstants.maraStampURL
        }
        else
        {
            stampURL = APIConstants.gukbabStampURL
        }
            
            


            
            
            
            let dataRequest = AF.request(stampURL, method  : .post,
                parameters: makeParameter(),
                
                 encoding:
                JSONEncoding.default)
            
            
            
            dataRequest.responseData { dataResponse in
                switch dataResponse.result {
                case .success:
                    
                    guard let statusCode = dataResponse.response?.statusCode else { return }
                    

                    let networkResult = self.judge(by: statusCode)
                    completion(networkResult)
                    
                case .failure: completion(.networkFail)
                }
            }
        }
        
        
        private func judge(by statusCode: Int) -> NetworkResult<Any>  {
            switch statusCode {
                
            case 200...299: return .success("1")
            case 400...499: return .pathErr
            case 500: return .serverErr
            default: return .networkFail
            }
        }
        
        
        

}
