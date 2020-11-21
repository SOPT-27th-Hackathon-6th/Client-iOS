//
//  MyViewController.swift
//  SOPT-27th-HACKATHON
//
//  Created by 송지훈 on 2020/11/21.
//

import UIKit

class MyViewController: UIViewController {

    
    //MARK:- IBOutlet Part
    /// Label, ColelctionView, TextField, ImageView 등 @IBOutlet 변수들을 선언합니다.  // 변수명 lowerCamelCase 사용
    /// ex)  @IBOutlet weak var qnaTextBoxBackgroundImage: UIImageView!
    
    @IBOutlet var topUIView: UIView!
    @IBOutlet var profileBackgroundLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var userNameLabel: UILabel!
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var fooldLabel: UILabel!
    @IBOutlet var percentageLabel: UILabel!
    @IBOutlet var countLabel: UILabel!
    
    @IBOutlet var levelProgressView: UIProgressView!
    


    //MARK:- Variable Part
    /// 뷰컨에 필요한 변수들을 선언합니다  // 변수명 lowerCamelCase 사용
    /// ex)  var imageViewList : [UIImageView] = []
    
    

    //MARK:- Constraint Part
    /// 스토리보드에 있는 layout 에 대한 @IBOutlet 을 선언합니다. (Height, Leading, Trailing 등등..)  // 변수명 lowerCamelCase 사용
    /// ex) @IBOutlet weak var lastImageBottomConstraint: NSLayoutConstraint!
    
    

    //MARK:- Life Cycle Part
    /// 앱의 Life Cycle 부분을 선언합니다
    /// ex) override func viewWillAppear() { }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 임시로 여기에
        topUIView.backgroundColor  = UIColor(displayP3Red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        
        //progress bar
        levelProgressView.progress = 0.8
        
        levelProgressView.progressTintColor = UIColor(displayP3Red: 196/255, green: 196/255, blue: 196/255, alpha: 1)
        levelProgressView.trackTintColor = UIColor(displayP3Red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
        levelProgressView.transform = levelProgressView.transform.scaledBy(x: 1, y: 1.5)
        
        // Set the rounded edge for the outer bar
//        levelProgressView.layer.cornerRadius = 0
//        levelProgressView.clipsToBounds = true

        // Set the rounded edge for the inner bar
//        levelProgressView.layer.sublayers![1].cornerRadius = 0
//        levelProgressView.subviews[1].clipsToBounds = true
        
        profileBackgroundLabel.layer.masksToBounds = true
        profileBackgroundLabel.layer.cornerRadius = 60

    }
    
    //MARK:- IBAction Part
    /// 버튼과 같은 동작을 선언하는 @IBAction 을 선언합니다 , IBAction 함수 명은 동사 형태로!!  // 함수명 lowerCamelCase 사용
    /// ex) @IBAction func answerSelectedButtonClicked(_ sender: Any) {  code .... }
    
    @IBAction func touchUpShare(_ sender: Any) {
        
    }
    
    
    
    //MARK:- default Setting Function Part
    /// 기본적인 세팅을 위한 함수 부분입니다 // 함수명 lowerCamelCase 사용
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }


    //MARK:- Function Part
    /// 로직을 구현 하는 함수 부분입니다. // 함수명 lowerCamelCase 사용
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }


}



//MARK:- extension 부분
/// UICollectionViewDelegate 부분 처럼 외부 프로토콜을 채택하는 경우나, 외부 클래스 확장 할 때,  extension을 작성하는 부분입니다
/// ex) extension ViewController : UICollectionViewDelegate {  code .... }
