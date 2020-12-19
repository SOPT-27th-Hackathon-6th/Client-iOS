//
//  HomeListViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/12/19.
//

import UIKit

class HomeListViewController: UIViewController {

    @IBOutlet var topUIView: UIView!
    @IBOutlet var countUIView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listSet()
        // Do any additional setup after loading the view.
    }
    
    func listSet() {
        topUIView.layer.shadowOpacity = 0.1
        topUIView.layer.shadowOffset = CGSize(width: 0, height: 4)
        topUIView.layer.shadowRadius = 10
        
        countUIView.layer.cornerRadius = countUIView.frame.height * 0.1
        
    }

}
