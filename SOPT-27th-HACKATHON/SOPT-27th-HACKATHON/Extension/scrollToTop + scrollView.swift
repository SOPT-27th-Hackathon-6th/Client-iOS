//
//  scrollToTop + scrollView.swift
//  SOPT-27th-HACKATHON
//
//  Created by 송지훈 on 2020/11/21.
//


import Foundation
import UIKit

extension UITableView{
    func scrollToTop()
    {
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
    }
}

extension UICollectionView {
    func scrollToTop() {
        
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
   }
}
