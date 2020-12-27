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
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
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
        getListService.shared.getMalaList() { (result) in
            switch(result) {
            case .success(let data):
                if let ListModel = data as? ListModel {
                    let url = URL(string: ListModel.imageLink)
                    let data = try? Data(contentsOf: url!)
                    cell.foodImageView.image = UIImage(data: data!)
                    cell.storeNameLabel.text = ListModel.resName
                    cell.dateLabel.text = ListModel.updatedAt
                    cell.reviewLabel.text = ListModel.review
                }
            case .requestErr(_):
                print("error")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
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
