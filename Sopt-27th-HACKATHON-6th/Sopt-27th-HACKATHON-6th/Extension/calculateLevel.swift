//
//  calculateLevel.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by soyounglee on 2020/11/22.
//

import Foundation

public func calculateLevel(index: Int, count: Int) -> String
{
    
    var level: String = ""
    
    switch count {
    case 0...2:
        level = "초 1학년"
    case 3...5:
        level = "초 2학년"
    case 6...8:
        level = "초 3학년"
    case 9...11:
        level = "초 4학년"
    case 12...14:
        level = "초 5학년"
    case 15...17:
        level = "초 6학년"
    case 18...20:
        level = "중 1학년"
    case 21...23:
        level = "중 2학년"
    default:
        print("error")
        
    }
    
    if index == 0 {
        level = "마라" + level
    }
    else {
        level = "국밥" + level
    }

    
    print(level)
    return level
}
