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

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    
    @IBOutlet weak var contentAreaView: UIView!
    
    
    
    //MARK:- Variable Part

    var foodImage = UIImage()
    var isMara : Bool = true
    
    var imageForShare = UIImage()
    //MARK:- Constraint Part
    
    
    
    
    //MARK:- Life Cycle Part
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        titleLabel.alpha = 0
        subtitleLabel.alpha = 0
        foodImageView.alpha = 0
        showAnimation()

        
        
        

    }
    //MARK:- IBAction Part
    
    @IBAction func downloadButtonClicked(_ sender: Any) {
        
        let renderer = UIGraphicsImageRenderer(size: contentAreaView.bounds.size)
        let image = renderer.image { ctx in
            contentAreaView.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        imageForShare = image
        
        UIImageWriteToSavedPhotosAlbum(image, nil, #selector(self.savedImage), nil)
        
        
        makeAlert(title: "알림", message: "이미지가 저장되었습니다", vc: self)
        
        
    }
    
    @objc func savedImage(image : UIImage, error : Error?)
    {
        if let error = error
        {
            print(error)
            return
        }
        else
        {

        }

    }
    
    @IBAction func shareButtonClicked(_ sender: Any) {
        
        guard let shareVC = self.storyboard?.instantiateViewController(identifier: "HomeShareViewController") as? HomeShareViewController else {return}
        
        shareVC.modalPresentationStyle = .fullScreen
        shareVC.isMala = isMara
        shareVC.imageForShare = imageForShare
        self.present(shareVC, animated: true
                     , completion: nil)
        
        
    }
    
    
    
    
    @IBAction func goHomeButtonClicked(_ sender: Any) {
        
        self.dismiss(animated: true) {
            self.dismiss(animated: true, completion: nil)
        }

    }
    
    //MARK:- default Setting Function Part
    

    func setLabel()
    {
        
        
        backgroundImageView.image = foodImage
        
        if isMara == true
        {
            subtitleLabel.text = "오늘도 내 마음에 마라를 찍고 말았다..."
            if let image = UIImage(named: "malaStampShare")
            {
                foodImageView.image = image
            }
        }
        else
        {
            subtitleLabel.text = "오늘도 내 마음에 국밥을 찍고 말았다..."
            if let image = UIImage(named: "gukbabStampShare")
            {
                foodImageView.image = image
            }
        }
    }
    
    
    func showAnimation()
    {
        UIView.animateKeyframes(withDuration: 2.5, delay: 0, animations: {

                    UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0/3.0, animations: {

                        self.titleLabel.alpha = 1

                    })

                    UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1.0/3.0, animations: {

                        self.subtitleLabel.alpha = 1

                    })

            UIView.addKeyframe(withRelativeStartTime: 1.5/3.0, relativeDuration: 1.0/3.0, animations: {

                        self.foodImageView.alpha = 1

                    })

                })


    }
    //MARK:- Function Part
    

    
    //MARK:- @objc function Part

    
    


}


//MARK:- extension 부분
