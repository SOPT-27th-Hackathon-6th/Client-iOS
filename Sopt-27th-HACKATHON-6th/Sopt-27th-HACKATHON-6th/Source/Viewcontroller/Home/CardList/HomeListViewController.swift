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
        tableView.delegate = self
        tableView.dataSource = self
        defaultListSet()
        print(self.tableView.contentOffset.y)
    }
    
    
    @IBAction func touchUpDismiss(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    func defaultListSet() {
        topUIView.backgroundColor = .white
        countUIView.layer.cornerRadius = countUIView.frame.height * 0.1
        
        let ListTableCellNib = UINib(nibName: "HomeListTableViewCell", bundle: nil)
        tableView.register(ListTableCellNib, forCellReuseIdentifier: "HomeListTableViewCell")
        
        self.topUIView.layer.shadowOpacity = 0.1
        self.topUIView.layer.shadowOffset = CGSize(width: 0, height: 6)
        self.topUIView.layer.shadowRadius = 10
        self.topUIView.layer.shouldRasterize = true
        self.topUIView.layer.masksToBounds = true
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
extension HomeListViewController: UITableViewDelegate {
    
}
extension HomeListViewController: UIScrollViewDelegate {

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (self.tableView.contentOffset.y > 0) {
            self.topUIView.layer.masksToBounds = false
        } else {
            self.topUIView.layer.masksToBounds = true
        }
    }

}
