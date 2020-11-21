//
//  AddPhotoViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by 송지훈 on 2020/11/21.
//

import UIKit

class AddPhotoViewController: UIViewController {
    
    
    //MARK:- IBOutlet Part
    
    
    
    @IBOutlet weak var photoImageView: UIImageView!
        
    
    
    //MARK:- Variable Part

    var imageData = UIImage()

    //MARK:- Constraint Part
    
    
    
    
    //MARK:- Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()

        self.photoImageView.image = imageData
    }
    //MARK:- IBAction Part
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- default Setting Function Part
    

    //MARK:- Function Part
    

    
    //MARK:- @objc function Part

    
    


}


//MARK:- extension 부분
