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
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        super.touchesBegan(touches, with: event)
        if let touch = touches.first , touch.view == self.view {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
//    @IBAction func touchUpList(_ sender: UIButton) {
//        let storyboard = UIStoryboard(name: "HomeList", bundle: nil)
//        if let nextVC = storyboard.instantiateViewController (identifier: "HomeListViewController") as? HomeListViewController {
////            self.modalPresentationStyle = .overCurrentContext
//            nextVC.type = self.type
//            self.present(nextVC, animated: true, completion: nil)
//
//        }
//
//    }
    
    func register() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        let cardCVNib = UINib(nibName: "CardCollectionViewCell", bundle: nil)
        collectionView.register(cardCVNib, forCellWithReuseIdentifier: "CardCollectionViewCell")
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
        cell.setCell()
        cell.setItem(store: "신룽푸마라탕", date: "2020.10.24", review: "신룽푸는 소세지가 존맛인관계로 최소 8개는 넣어야한다 그게진리다신룽푸는 소세지가 존맛인관계로 최소 8개는 넣어야한다 그게진리다")
        return cell
    }
    
    
}
extension CardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = collectionView.frame.height
        let cellWidth = (collectionView.frame.width - horizonInset - horizonInset)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: horizonInset, bottom: 0, right: horizonInset)
        
    }
}
