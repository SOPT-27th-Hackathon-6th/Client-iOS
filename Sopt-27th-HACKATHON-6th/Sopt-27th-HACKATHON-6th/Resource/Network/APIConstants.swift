//
//  APIConstants.swift
//  SOPT-27th-HACKATHON
//
//  Created by 송지훈 on 2020/11/21.
//

import Foundation

struct APIConstants
{
    
    static let baseURL = "http://52.79.217.77:3000" //"http://52.79.150.197:3000"
    
    // 추가할거면 여기에
    
    // ex) static let checkServerURL = APIConstants.baseURL + "/version"
    
    
    
    
    // 홈 뷰
    
    static let maraStampURL = APIConstants.baseURL + "/mala"
    static let gukbabStampURL = APIConstants.baseURL + "/rice"
    
    
    
    
    // 혈중 농도 뷰
    static let levelURL = APIConstants.baseURL + "/level"
    static let percentURL = APIConstants.baseURL + "/percent"
    
    
    // 랭킹뷰
    
    
}
