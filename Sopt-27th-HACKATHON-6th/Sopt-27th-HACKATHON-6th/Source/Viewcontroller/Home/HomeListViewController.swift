//
//  HomeListViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/12/19.
//

import UIKit

class HomeListViewController: UIViewController {

    @IBOutlet var topUIView: UIView!
    @IBOutlet var countUIView: UIView!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        listSet()
        let ListTableCellNib = UINib(nibName: "HomeListTableViewCell", bundle: nil)
        tableView.register(ListTableCellNib, forCellReuseIdentifier: "HomeListTableViewCell")
    }
    
    func listSet() {
        
        
        countUIView.layer.cornerRadius = countUIView.frame.height * 0.1
        
    }

}
extension HomeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeListTableViewCell.identifier) as? HomeListTableViewCell else {
            return UITableViewCell()
        }
        return cell
    }
    
    
}
extension HomeListViewController: UIScrollViewDelegate {
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//        self.topUIView.layer.shadowOpacity = 0.1
//        self.topUIView.layer.shadowOffset = CGSize(width: 0, height: 4)
//        self.topUIView.layer.shadowRadius = 10
//    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.topUIView.layer.shadowOpacity = 0.1
        self.topUIView.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.topUIView.layer.shadowRadius = 10
        self.topUIView.layoutIfNeeded()
    }
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        UIView.animate(withDuration: 0.5, animations: {
//            self.topViewHeightConstraint.constant = 88
//            self.rootView.layoutIfNeeded()
//        })
//    }
//
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if (decelerate) {
//            UIView.animate(withDuration: 0.5, animations: {
//                self.topViewHeightConstraint.constant = 0
//                self.rootView.layoutIfNeeded()
//            })
//        }
//    }
}
