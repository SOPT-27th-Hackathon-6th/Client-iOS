//
//  HomeListViewController.swift
//  Sopt-27th-HACKATHON-6th
//
//  Created by ✨EUGENE✨ on 2020/12/19.
//

import UIKit

class HomeListViewController: UIViewController {

    @IBOutlet var rootView: UIView!
    @IBOutlet var topUIView: UIView!
    @IBOutlet var countUIView: UIView!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var foodLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        defaultListSet()
    }
    
    
    @IBAction func touchUpDismiss(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    func defaultListSet() {
        topUIView.backgroundColor = .white
        countUIView.layer.cornerRadius = countUIView.frame.height * 0.1
        
        let ListTableCellNib = UINib(nibName: "HomeListTableViewCell", bundle: nil)
        tableView.register(ListTableCellNib, forCellReuseIdentifier: "HomeListTableViewCell")
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

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView.contentOffset.y > 0) {
          
            self.topUIView.layer.shadowOpacity = 0.1
            self.topUIView.layer.shadowOffset = CGSize(width: 0, height: 4)
            self.topUIView.layer.shadowRadius = 10
            self.rootView.layoutIfNeeded()
        }
    }
}
