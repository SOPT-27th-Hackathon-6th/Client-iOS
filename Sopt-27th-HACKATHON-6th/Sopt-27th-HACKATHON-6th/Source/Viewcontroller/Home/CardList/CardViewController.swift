//
//  CardViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/12/19.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet var rootView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    var type: String!
    let horizonInset: CGFloat = 30
    let lineSpacing: CGFloat = 20
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        register()
        setCollectionView()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesBegan(touches, with: event)
        if let touch = touches.first , touch.view == self.view {
            self.dismiss(animated: true, completion: nil)
        }
    }
    func setCollectionView() {
        let collectionViewLayout: UICollectionViewFlowLayout = {
            let layout = CustomCVFL()
            let cellHeight = collectionView.frame.height
            let cellWidth = collectionView.frame.width - (2 * horizonInset)
            layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
            layout.minimumLineSpacing = lineSpacing
            layout.sectionInset = UIEdgeInsets(top: 0, left: horizonInset, bottom: 0, right: horizonInset)
            layout.scrollDirection = .horizontal
            return layout
        }()
        collectionView.collectionViewLayout = collectionViewLayout
        
        collectionView.decelerationRate = .fast
        collectionView.isPagingEnabled = false
    }
    func register() {
        collectionView.dataSource = self
        
        let cardCVNib = UINib(nibName: "CardCollectionViewCell", bundle: nil)
        collectionView.register(cardCVNib, forCellWithReuseIdentifier: "CardCollectionViewCell")
        
        NotificationCenter.default.addObserver(self, selector: #selector(touchUpListTap(_:)), name: Notification.Name("touchUpList"), object: nil)
    }
    
    @objc func touchUpListTap(_ noti: NSNotification) {
        let storyboard = UIStoryboard(name: "HomeList", bundle: nil)
        if let nextVC = storyboard.instantiateViewController (identifier: "HomeListViewController") as? HomeListViewController {
//            nextVC.type = self.type
            let getType = noti.object as! String
            nextVC.type = getType
            self.present(nextVC, animated: true, completion: nil)

        }
    }

}
extension CardViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12 //일단 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardCollectionViewCell.identifier, for: indexPath) as? CardCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.type = self.type
        if type == "Mala" {
            cell.setItem(store: "신룽푸마라탕", date: "2020.10.24", review: "신룽푸는 소세지가 존맛인관계로 최소 8개는 넣어야한다 그게진리다 신룽푸는 소세지가 존맛인관계로 최소 8개는 넣어야한다 그게진리다")
        } else {
            cell.setItem(store: "국밥국밥", date: "2020.10.24", review: "국밥 웅앵 국밥 웅앵 국밥 웅앵 국밥 웅앵 국밥 웅앵 국밥 웅앵")
        }
        return cell
    }
    
}
