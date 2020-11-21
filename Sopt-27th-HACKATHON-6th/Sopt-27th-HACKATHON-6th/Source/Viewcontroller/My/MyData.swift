//
//  MyData.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/11/22.
//

import UIKit

struct MyData {
    var name: String
    var subtitle: String
    var imageName: String
    var bookmark: String
    
    func makeImage() -> UIImage? {
        return UIImage(named: imageName)
    }
}
