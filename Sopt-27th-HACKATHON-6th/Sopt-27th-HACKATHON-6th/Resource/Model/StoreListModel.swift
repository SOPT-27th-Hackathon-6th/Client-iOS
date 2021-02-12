//
//  StoreListModel.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2021/02/12.
//

import Foundation

struct StoreListModel: Codable {
    let stampIdx: Int
    let imageLink: String
    let resName, review: String
    let userIdx2: Int
    let updatedAt: String
}
