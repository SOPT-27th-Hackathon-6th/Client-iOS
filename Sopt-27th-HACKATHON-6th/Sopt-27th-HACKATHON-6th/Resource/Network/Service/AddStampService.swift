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
    private func makeParameter(_ title : String,_ content: String) -> Parameters {
        return [
                    "resName": title,
                    "review": content
                ]
    }

    
        

    func write(isMala: Bool ,title: String,content: String,photo : UIImage, completion: @escaping (NetworkResult<Any>) -> Void)
    {
            
//            guard let userToken = UserDefaults.standard.string(forKey: "token") else {return}
        
        let tempToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWR4IjoyNCwiaWF0IjoxNjEzMTI4NTM5LCJleHAiOjE2MTQ5NDI5MzksImlzcyI6Imd1a2JhYk1hbGEifQ.A9gk9vww5izrLzjkJcGdgiqvdT-yyHQQkM_q4tEKGzo"

            let header: HTTPHeaders = ["content-Type": "multipart/form-data",
                                       "token" : tempToken]
        
        var articleURL : String = ""
        
        if isMala { articleURL = APIConstants.baseURL + "/mala"}
        else { articleURL = APIConstants.baseURL + "/rice"}
        
        AF.upload(multipartFormData: { multipartFormData in
         
            print("URLURL",articleURL)
            if let imageData = photo.jpegData(compressionQuality: 1){
                multipartFormData.append(imageData, withName: "imageLink",fileName: ".jpeg",mimeType: "image/jpeg")
            }

            for (key, value) in self.makeParameter(title, content)
            {
                multipartFormData.append((value as! String).data(using: .utf8)!, withName: key)
            }
            
        },  to: articleURL ,usingThreshold:  UInt64.init(), method: .post,
        headers: header).response{ response in
            
            switch(response.result)
            {
    
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let json = JSON(value)
                
                
                dump(response)
                print("hello",json)
                
                let networkResult = self.judge(by: statusCode, json)
                completion(networkResult)
            case .failure:
                
                dump(response)
                completion(.networkFail)
            
            
        }
    
            
            
        }
    
   
    }
        
        private func judge(by statusCode: Int, _ json: JSON) -> NetworkResult<Any>  {
            switch statusCode {
                
            case 200...299: return .success("1")
            case 400...499: return .pathErr(json["message"].stringValue)
            case 500: return .serverErr
            default: return .networkFail
            }
        }
        
        
        

}
