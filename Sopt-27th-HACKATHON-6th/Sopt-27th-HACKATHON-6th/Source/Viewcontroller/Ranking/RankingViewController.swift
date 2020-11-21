//
//  RankingViewController.swift
//  SOPT-27th-HACKATHON
//
//  Created by 송지훈 on 2020/11/21.
//

import UIKit

class RankingViewController: UIViewController {

    
    //MARK:- IBOutlet Part
    /// Label, ColelctionView, TextField, ImageView 등 @IBOutlet 변수들을 선언합니다.  // 변수명 lowerCamelCase 사용
    /// ex)  @IBOutlet weak var qnaTextBoxBackgroundImage: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectView: UIView!
    

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
        
        
        // 셀 리소스 파일 가져오기
        let rankingTableViewCellNib = UINib(nibName: "RankingTableViewCell", bundle: nil)
        
        // 셀에 리소스 등록
        tableView.register(rankingTableViewCellNib, forCellReuseIdentifier: "RankingTableViewCell")
        
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.allowsSelection = false

        tableView.delegate = self
        tableView.dataSource = self
        
        
        //그림자
        selectView.layer.shadowColor = UIColor.black.cgColor // 검정색 사용
        selectView.layer.masksToBounds = false
        selectView.layer.shadowOffset = CGSize(width: 0, height: 4) // 반경에 대해서 너무 적용이 되어서 4point 정도 ㅐ림.
        selectView.layer.shadowRadius = 4 // 반경?
        selectView.layer.shadowOpacity = 0.3 // alpha값입니다.

        
    }
    
    //MARK:- IBAction Part
    /// 버튼과 같은 동작을 선언하는 @IBAction 을 선언합니다 , IBAction 함수 명은 동사 형태로!!  // 함수명 lowerCamelCase 사용
    /// ex) @IBAction func answerSelectedButtonClicked(_ sender: Any) {  code .... }
    
    
    
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

extension RankingViewController: UITableViewDelegate {
    
    
}

extension RankingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankingTableViewCell", for: indexPath) as! RankingTableViewCell
        
        let row = indexPath.row
        
        switch row {
        case 0:
            cell.innerView.layer.borderColor = .init(red: 0/255, green: 0/255, blue: 200/255, alpha: 1)
        case 1:
            cell.innerView.layer.borderColor = .init(red: 0/255, green: 200/255, blue: 0/255, alpha: 1)
        case 2:
            cell.innerView.layer.borderColor = .init(red: 200/255, green: 0/255, blue: 0/255, alpha: 1)
        default:
            cell.innerView.layer.borderColor = .init(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
        }
        
        return cell
    }
    
    
}
