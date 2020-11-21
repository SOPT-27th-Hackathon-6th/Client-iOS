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
    
    private func makeParameter(_ index : Int) -> Parameters {
        return [
                "boardIdx": index
                ]
    }
    
    func addStamp(cateogry : Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        
    }
    

    func like(cate : Int, idx: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
            
            guard let userToken = UserDefaults.standard.string(forKey: "token") else {return}
            
            
            
            let header: HTTPHeaders = ["content-Type": "application/json","token" : userToken]
        
            var addStampURL : String = ""
            // cate : 0번 유링크, 1번 학교 , 2번 과목
            addStampURL = APIConstants.baseURL + "필요한 URL"
        
        

            
            
            
            let dataRequest = AF.request(addStampURL, method  : .post,
                parameters: makeParameter(idx),
                
                 encoding:
                JSONEncoding.default, headers: header)
            
            
            
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
