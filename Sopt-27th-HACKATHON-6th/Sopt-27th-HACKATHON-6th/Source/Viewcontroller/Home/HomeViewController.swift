//
//  HomeViewController.swift
//  SOPT-27th-HACKATHON
//
//  Created by 송지훈 on 2020/11/21.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKLink
import KakaoSDKTemplate

class HomeViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    //MARK:- IBOutlet Part
    /// Label, ColelctionView, TextField, ImageView 등 @IBOutlet 변수들을 선언합니다.  // 변수명 lowerCamelCase 사용
    /// ex)  @IBOutlet weak var qnaTextBoxBackgroundImage: UIImageView!
    

    @IBOutlet weak var maraAreaView: UIView!
    @IBOutlet weak var gukbabAreaView: UIView!
    
    
    @IBOutlet weak var maraImageView: UIImageView!
    @IBOutlet weak var gukbabImageView: UIImageView!
    @IBOutlet weak var maraLabel: UILabel!
    @IBOutlet weak var gukbabLabel: UILabel!
    
    
    
    
    @IBOutlet weak var titleTopLabel: UILabel!
    @IBOutlet weak var titleBottomLabel: UILabel!
    @IBOutlet weak var subtitleBottomLabel: UILabel!
    
    
    
    @IBOutlet weak var stampCollectionView: UICollectionView! // 스탬프가 들어가는 전체 콜렉션 뷰
    @IBOutlet weak var currentPageController: UIPageControl!
    // 현재 페이지가 어딘지 나타내는 pageControl
    

    //MARK:- Variable Part
    /// 뷰컨에 필요한 변수들을 선언합니다  // 변수명 lowerCamelCase 사용
    /// ex)  var imageViewList : [UIImageView] = []
    
    
    let imagePicker = UIImagePickerController()

    var selectIndex : Int = 0
    
    
    var maraCount : Int = 0
    var gukbabCount : Int = 0
    
    
    
    

    //MARK:- Constraint Part
    /// 스토리보드에 있는 layout 에 대한 @IBOutlet 을 선언합니다. (Height, Leading, Trailing 등등..)  // 변수명 lowerCamelCase 사용
    /// ex) @IBOutlet weak var lastImageBottomConstraint: NSLayoutConstraint!
    
    

    //MARK:- Life Cycle Part
    /// 앱의 Life Cycle 부분을 선언합니다
    /// ex) override func viewWillAppear() { }
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetting()
        
        
        titleTopLabel.text = "이번달 마라 먹은지"
        titleBottomLabel.text = "벌써 4일"
        subtitleBottomLabel.text = "이나 됐다"
        


    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        getGukbabCount()
        getMaraCount()
        
    }
    
    //MARK:- IBAction Part
    /// 버튼과 같은 동작을 선언하는 @IBAction 을 선언합니다 , IBAction 함수 명은 동사 형태로!!  // 함수명 lowerCamelCase 사용
    /// ex) @IBAction func answerSelectedButtonClicked(_ sender: Any) {  code .... }
    
    
    @IBAction func maraButtonClicked(_ sender: Any) {

        maraSelect()

        
    }
    
    @IBAction func gukbabButtonClicked(_ sender: Any) {
        
        gukbabSelect()
    }
    
    
    
    @IBAction func shareActionClicked(_ sender: Any) {
        

        
        let feedTemplateJsonStringData =
            """
                    {
                        "object_type": "feed",
                        "content": {
                            "title": "국밥마라",
                            "description": "내가 이런 사람이야~~~~",
                            "image_url": "http://mud-kage.kakao.co.kr/dn/NTmhS/btqfEUdFAUf/FjKzkZsnoeE4o19klTOVI1/openlink_640x640s.jpg",
                            "link" : {
                                    "mobile_web_url": "https://developers.kakao.com",
                                    "web_url": "https://developers.kakao.com"
                            }

                        },
                    
                        "buttons": [
                    
                            {
                                "title": "앱으로 이동하기",
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
    
    @IBAction func addPhotoButotnClicked(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "" , message: "인증 방식을 선택해주세요", preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "카메라로 찍기", style: .default) { (_) in
            
            self.imagePicker.sourceType = .camera
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let galleryAction = UIAlertAction(title: "갤러리에서 선택하기", style: .default) { (_) in
            
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
            

        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(cameraAction)
        alert.addAction(galleryAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- default Setting Function Part
    /// 기본적인 세팅을 위한 함수 부분입니다 // 함수명 lowerCamelCase 사용
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }

    
    func defaultSetting()
    {
        stampCollectionView.delegate = self
        stampCollectionView.dataSource = self
        stampCollectionView.isPagingEnabled = true
        currentPageController.currentPage = 0
        
        
        imagePicker.delegate = self
        
        maraLabel.text = "마라"
    
        gukbabLabel.text = "국밥"
        
        maraSelect()
            
    }
    


    //MARK:- Function Part
    /// 로직을 구현 하는 함수 부분입니다. // 함수명 lowerCamelCase 사용
    /// ex) func tableViewSetting() {
    ///         myTableView.delegate = self
    ///         myTableView.datasource = self
    ///    }
    
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage) else { return }
        
        
        guard let confirmVC = self.storyboard?.instantiateViewController(identifier: "AddPhotoViewController") as? AddPhotoViewController else {return}
        
        confirmVC.modalPresentationStyle = .fullScreen
        
        
        dismiss(animated: true) {
            
            var isMara = false
            if self.selectIndex == 0
            {
                isMara = true
            }
            
            //할까말까 했을때는
            //마라
            AddStampService.shared.addStamp(isMara: isMara) { (result) in
                switch(result)
                {
                case .success(_):
                    
                    
                    self.titleTopLabel.text = "이번달 마라 먹은지"
                    self.titleBottomLabel.text = "벌써 4일"
                    self.subtitleBottomLabel.text = "이나 됐다"
                    
                    self.present(confirmVC, animated: true, completion: nil)

                default :
                    makeAlert(title: "오류", message: "등록에 실패하였습니다", vc: self)
                }
            }
            
            
            
        }
        
    

        
    }
    
    func getMaraCount()
    {
        getStampCountService.shared.getStamp(isMara: true) { (result) in
            switch(result)
            {
            case .success(let count):
                self.maraCount = count as? Int ?? 0
                print("마라 개수 갱신",self.maraCount)
                NotificationCenter.default.post(name: NSNotification.Name("showMaraCount"), object: self.gukbabCount)
                self.stampCollectionView.reloadData()
                
                
            default:
                makeAlert(title: "알림", message: "개수 정보를 가져오는데 실패하였습니다", vc: self)
            }
        }

    }
    
    func getGukbabCount()
    {
        getStampCountService.shared.getStamp(isMara: false) { (result) in
            switch(result)
            {
            case .success(let count):
                self.gukbabCount = count as? Int ?? 0
            
                NotificationCenter.default.post(name: NSNotification.Name("showGukbabCount"), object: self.gukbabCount)
                
                
                
            default:
                makeAlert(title: "알림", message: "개수 정보를 가져오는데 실패하였습니다", vc: self)
            }
        }
    }
    
    func maraSelect()
    {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "maraClicked"), object: nil)
        
        selectIndex = 0
        
        
        
        maraImageView.image = UIImage(named: "malaIconSeleceted")
        gukbabImageView.image = UIImage(named: "gukbapIconUnseleceted")
           maraLabel.textColor = .init(red: 208/255, green: 56/255, blue: 56/255, alpha: 1)
        maraLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(700))

           
           gukbabLabel.textColor = .init(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
           gukbabLabel.font = UIFont.systemFont(ofSize: 16)
           
    }
    
    func gukbabSelect()
    {
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "gukbabClicked"), object: nil)

        selectIndex = 1
        
        maraImageView.image = UIImage(named: "malaIconUnseleceted")
        gukbabImageView.image = UIImage(named: "gukbapIconSeleceted")
        
        
        maraLabel.textColor = .init(red: 97/255, green: 97/255, blue: 97/255, alpha: 1)
        maraLabel.font = UIFont.systemFont(ofSize: 16)
        
             
      
        gukbabLabel.textColor = .init(red: 111/255, green: 79/255, blue: 40/255, alpha: 1)
        
        gukbabLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight(700))
    }


}



//MARK:- extension 부분
/// UICollectionViewDelegate 부분 처럼 외부 프로토콜을 채택하는 경우나, 외부 클래스 확장 할 때,  extension을 작성하는 부분입니다
/// ex) extension ViewController : UICollectionViewDelegate {  code .... }


extension HomeViewController : UICollectionViewDelegate
{
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.stampCollectionView.frame.width)
        
        self.currentPageController.currentPage = page
    }
}

extension HomeViewController : UICollectionViewDataSource
{
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let stampPageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "StampPageCell", for: indexPath) as? StampPageCell else  { return UICollectionViewCell ()}
        
        stampPageCell.gukbabCount = self.gukbabCount
        stampPageCell.maraCount = self.maraCount
        
        stampPageCell.setStampCollectionView()
        stampPageCell.pageNum(num: indexPath.row)
        
        
        return stampPageCell
    }
    
    
}

extension HomeViewController : UICollectionViewDelegateFlowLayout
{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.stampCollectionView.frame.width ,  height: self.stampCollectionView.frame.height )
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


