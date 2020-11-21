//
//  MyViewController.swift
//  SOPT-27th-HACKATHON
//
//  Created by 송지훈 on 2020/11/21.
//

import UIKit
import KakaoSDKLink
import KakaoSDKCommon
import KakaoSDKTemplate





class MyViewController: UIViewController {

    @IBOutlet var myCollectionView: UICollectionView!
    
    //MARK:- IBOutlet Part
    /// Label, ColelctionView, TextField, ImageView 등 @IBOutlet 변수들을 선언합니다.  // 변수명 lowerCamelCase 사용
    /// ex)  @IBOutlet weak var qnaTextBoxBackgroundImage: UIImageView!
    
    
    


    //MARK:- Variable Part
    /// 뷰컨에 필요한 변수들을 선언합니다  // 변수명 lowerCamelCase 사용
    /// ex)  var imageViewList : [UIImageView] = []
    let topInset: CGFloat = 0
    let bottomInset: CGFloat = 0
    let horizonInset: CGFloat = 28
    let rightSpacing: CGFloat = 28
    let lineSpacing: CGFloat = 16

    //MARK:- Constraint Part
    /// 스토리보드에 있는 layout 에 대한 @IBOutlet 을 선언합니다. (Height, Leading, Trailing 등등..)  // 변수명 lowerCamelCase 사용
    /// ex) @IBOutlet weak var lastImageBottomConstraint: NSLayoutConstraint!
    
    

    //MARK:- Life Cycle Part
    /// 앱의 Life Cycle 부분을 선언합니다
    /// ex) override func viewWillAppear() { }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetting()

    }
    
    //MARK:- IBAction Part
    /// 버튼과 같은 동작을 선언하는 @IBAction 을 선언합니다 , IBAction 함수 명은 동사 형태로!!  // 함수명 lowerCamelCase 사용
    /// ex) @IBAction func answerSelectedButtonClicked(_ sender: Any) {  code .... }
    
    @IBAction func touchUpShare(_ sender: Any) {
        
        

        
        let feedTemplateJsonStringData =
            """
                    {
                        "object_type": "feed",
                        "content": {
                            "title": "나 오늘 마라혈중농도 100이다...",
                            "image_url": "https://user-images.githubusercontent.com/60260284/99888080-23595500-2c8d-11eb-9cbc-417580997d60.png",
                            "link" : {
                                    "mobile_web_url": "https://developers.kakao.com",
                                    "web_url": "https://developers.kakao.com"
                            }

                        },
                    
                        "buttons": [
                    
                            {
                                "title": "나의 마라 혈중농도 확인하러 가기",
                                "link": {
                                    "android_execution_params": "key1=value1&key2=value2",
                                    "ios_execution_params": "key1=qna&key2=1"
                                }
                            }
                        ]
                    }
                    """.data(using: .utf8)!
        
        
        // templatable은 메시지 만들기 항목 참고
        
        if let templatable = try?
            SdkJSONDecoder.custom.decode(FeedTemplate.self, from: feedTemplateJsonStringData) {
            LinkApi.shared.defaultLink(templatable: templatable) {(linkResult, error) in
                if let error = error {
                    print("error")
                }
                else {
                    print("defaultLink() success.")
                    
                    if let linkResult = linkResult {
                        UIApplication.shared.open(linkResult.url, options: [:], completionHandler: nil)
                    }
                }
            }
        }
            
        
    }
    
    
    
    //MARK:- default Setting Function Part
    /// 기본적인 세팅을 위한 함수 부분입니다 // 함수명 lowerCamelCase 사용
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }
    
    func collectionViewSetting() {
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }

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
extension MyViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionCell.identifier, for: indexPath) as? MyCollectionCell else {
                return UICollectionViewCell()
            }
            cell.setShadow()
            cell.setCell(food: "Mala")
            
            return cell
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionCell.identifier, for: indexPath) as? MyCollectionCell else {
                return UICollectionViewCell()
            }

            cell.setShadow()
            cell.setCell(food: "Gukbap")
            
            return cell
        default:
            return UICollectionViewCell()
//            break
        }
        
        
    }
    
    
}
extension MyViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = UIScreen.main.bounds.height * (567/812) //collectionView.frame.height
        let cellWidth = (collectionView.frame.width - lineSpacing - rightSpacing)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0 }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: topInset, left: horizonInset, bottom: bottomInset, right: horizonInset) }
}
