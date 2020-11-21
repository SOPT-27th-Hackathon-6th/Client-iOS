//
//  AddPhotoViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by 송지훈 on 2020/11/21.
//

import UIKit

class AddPhotoViewController: UIViewController {
    
    
    //MARK:- IBOutlet Part
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var subtitleImageView: UIImageView!
    @IBOutlet weak var foodImageView: UIImageView!
    
    
    
    
    //MARK:- Variable Part

    var isMara : Bool = true
    //MARK:- Constraint Part
    
    
    
    
    //MARK:- Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if isMara == true
        {
            backgroundImageView.image = UIImage(named: "imgBackgroundMala")
            subtitleImageView.image = UIImage(named:"mara1" )
            foodImageView.image = UIImage(named: "imgMalaStamp")
        }
        else
        {
            backgroundImageView.image = UIImage(named: "imgBackgroundGukbab")
            subtitleImageView.image = UIImage(named:"gukbab1" )
            foodImageView.image = UIImage(named: "imgGukbabStamp")
        }
        
        
        

    }
    //MARK:- IBAction Part
    

    
    @IBAction func goHomeButtonClicked(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)

    }
    
    //MARK:- default Setting Function Part
    

    //MARK:- Function Part
    

    
    //MARK:- @objc function Part

    
    


}


//MARK:- extension 부분
