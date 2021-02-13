//
//  getStampCountService.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by 송지훈 on 2020/11/22.
//

import Alamofire
import SwiftyJSON
import Foundation


struct getStampCountService {
    static let shared = getStampCountService()
    

    
    // 임시로 eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWR4IjoyNCwiaWF0IjoxNjEzMDY0NzA1LCJleHAiOjE2MTMwNjgzMDUsImlzcyI6Imd1a2JhYk1hbGEifQ.NtScLtJa0Vm2ud_blrfTa8dueGvlxkMnN_ncFjPqPDc
    
    let tempToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWR4IjoyNCwiaWF0IjoxNjEzMTI4NTM5LCJleHAiOjE2MTQ5NDI5MzksImlzcyI6Imd1a2JhYk1hbGEifQ.A9gk9vww5izrLzjkJcGdgiqvdT-yyHQQkM_q4tEKGzo"

    func getStamp(isMara : Bool, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        let header : HTTPHeaders = ["token": tempToken]
        // 여기 수정되어야 하는 부분 -> 나중에 실제 유저 토큰값으로


        var stampURL = ""
        if isMara == true
        {
            stampURL = APIConstants.maraStampURL
        }
        else
        {
            stampURL = APIConstants.gukbabStampURL
        }

            
            let dataRequest = AF.request(stampURL, method  : .get,
                                         encoding:
                                            JSONEncoding.default, headers: header)
            
            
            
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
                
            case 200...299: return getStampCount(by: json)
            case 400...499: return .pathErr("")
            case 500: return .serverErr
            default: return .networkFail
            }
        }
    
    
    
    private func getStampCount(by json: JSON) -> NetworkResult<Any> {
        
        
        let data = json["data"] as JSON

        
        return .success(data.arrayValue.count)
    }
        
        
        

}
