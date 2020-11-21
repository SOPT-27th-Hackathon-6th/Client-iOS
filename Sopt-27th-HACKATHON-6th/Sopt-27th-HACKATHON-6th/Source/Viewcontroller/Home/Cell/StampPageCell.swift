//
//  StampPageCell.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by 송지훈 on 2020/11/21.
//

import UIKit

class StampPageCell: UICollectionViewCell {
    

    
    //MARK:- IBOutlet Part
    /// Label, ColelctionView, TextField, ImageView 등 @IBOutlet 변수들을 선언합니다.  // 변수명 lowerCamelCase 사용
    /// ex)  @IBOutlet weak var qnaTextBoxBackgroundImage: UIImageView!
    
    
    @IBOutlet weak var stampPageCollectionView: UICollectionView!
    
    



    //MARK:- Variable Part
    /// 뷰컨에 필요한 변수들을 선언합니다  // 변수명 lowerCamelCase 사용
    /// ex)  var imageViewList : [UIImageView] = []
    
    var pageNum : Int = 0
    var isMara : Bool = true
    
    
    var maraCount : Int = 0
    var gukbabCount : Int = 0
    

    //MARK:- Constraint Part
    /// 스토리보드에 있는 layout 에 대한 @IBOutlet 을 선언합니다. (Height, Leading, Trailing 등등..)  // 변수명 lowerCamelCase 사용
    /// ex) @IBOutlet weak var lastImageBottomConstraint: NSLayoutConstraint!
    
    

    //MARK:- Life Cycle Part
    /// 앱의 Life Cycle 부분을 선언합니다
    /// ex) override func viewWillAppear() { }

    //MARK:- IBAction Part
    /// 버튼과 같은 동작을 선언하는 @IBAction 을 선언합니다 , IBAction 함수 명은 동사 형태로!!  // 함수명 lowerCamelCase 사용
    /// ex) @IBAction func answerSelectedButtonClicked(_ sender: Any) {  code .... }
    
    
    
    //MARK:- default Setting Function Part
    /// 기본적인 세팅을 위한 함수 부분입니다 // 함수명 lowerCamelCase 사용
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }
    
    
    
    func setStampCollectionView()
    {
        
        self.stampPageCollectionView.delegate = self
        self.stampPageCollectionView.dataSource = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(maraClicked), name: NSNotification.Name("maraClicked"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(gukbabClicked), name: NSNotification.Name("gukbabClicked"), object: nil)
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(showMaraCount), name: NSNotification.Name("showMaraCount"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(showGukbabCount), name: NSNotification.Name("showGukbabCount"), object: nil)
        
    }
    
    @objc func maraClicked()
    {
        isMara = true
        stampPageCollectionView.reloadData()
    }
    
    
    @objc func gukbabClicked()
    {
        isMara = false
        stampPageCollectionView.reloadData()
    }
    
    @objc func showMaraCount(noti : NSNotification)
    {
        maraCount = noti.object as? Int ?? 0
        stampPageCollectionView.reloadData()
        
    }
    
    @objc func showGukbabCount(noti : NSNotification)
    {
        gukbabCount = noti.object as? Int ?? 0
        stampPageCollectionView.reloadData()
    }
    func pageNum(num : Int)
    {
        self.pageNum = num
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

extension StampPageCell : UICollectionViewDelegate
{
    
}

extension StampPageCell : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let stampCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StampCell", for: indexPath) as? StampCell else {return UICollectionViewCell() }

        let index = (pageNum * 12) + indexPath.row + 1
        

        if index % 3 != 0
        {
            if isMara == true
            {
                
                if index <= maraCount
                {
                    stampCell.settingCell(isMara: isMara, count: index, isLevelUP: false,isFilled: true)

                }
                else
                {
                    stampCell.settingCell(isMara: isMara, count: index, isLevelUP: false,isFilled: false)
                }
            }
            else
            {
                if index <= gukbabCount
                {
                    stampCell.settingCell(isMara: isMara, count: index, isLevelUP: false,isFilled: true)

                }
                else
                {
                    stampCell.settingCell(isMara: isMara, count: index, isLevelUP: false,isFilled: false)

                    
                }
            }
        }
        else
        {
            
            if isMara == true
            {
                
                if index <= maraCount
                {
                    stampCell.settingCell(isMara: isMara, count: index, isLevelUP: true,isFilled: true)

                }
                else
                {
                    stampCell.settingCell(isMara: isMara, count: index, isLevelUP: true,isFilled: false)
                }
            }
            else
            {
                if index <= gukbabCount
                {
                    stampCell.settingCell(isMara: isMara, count: index, isLevelUP: true,isFilled: true)

                }
                else
                {
                    stampCell.settingCell(isMara: isMara, count: index, isLevelUP: true,isFilled: false)

                    
                }
            }
            

            
            
            

        }
    
        return stampCell
    }
    
    
    
}

extension StampPageCell : UICollectionViewDelegateFlowLayout
{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (self.frame.width - 34 )/3, height: (self.frame.height-40)/4 )
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
