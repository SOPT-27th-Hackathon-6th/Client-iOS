//
//  TabBarViewController.swift
//  SOPT-27th-HACKATHON
//
//  Created by 송지훈 on 2020/11/21.
//

import UIKit

class TabBarViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabBarView: UIView!
    
    
    
    @IBOutlet weak var rankingTabBarIconImageView: UIImageView!
    @IBOutlet weak var homeTabBarIconImageView: UIImageView!
    @IBOutlet weak var userIconImageView: UIImageView!
    
    
    @IBOutlet weak var rankingLabel: UILabel!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var MyLabel: UILabel!
    
    
    
    
    
    
    
    
    let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
    let MyStoryboard = UIStoryboard(name: "My", bundle: nil)
    let RankingStoryboard = UIStoryboard(name: "Ranking", bundle: nil)
    
    var homeVC = UIViewController()
    var myVC = UIViewController()
    var RankingVC = UIViewController()
    
    var VClist : [UIViewController] = []
    
    var selectIndex : Int = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeVC()
        setVCList()
        moveVC()
        


        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addObserver()
    }
    
    
    @IBAction func rankingViewClicked(_ sender: Any) {
        removeVC()
        selectIndex = 0
        moveVC()
    }
    
    
    @IBAction func homeViewClicked(_ sender: Any) {
        removeVC()
        selectIndex = 1
        moveVC()
    }
    
    @IBAction func myViewClicked(_ sender: Any) {
        removeVC()
        selectIndex = 2
        moveVC()
    }
    
    
    func addObserver()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(goLEVELUP), name: NSNotification.Name("levelUP"), object: nil)
    }
    
    @objc func goLEVELUP()
    {
        selectIndex = 2
        moveVC()
    }
    
    func setVCList()
    {
        VClist.append(RankingVC)
        VClist.append(homeVC)
        VClist.append(myVC)

        
    }
    
    func removeVC()
    {
        VClist[selectIndex].willMove(toParent: nil)
        VClist[selectIndex].view.removeFromSuperview()
        VClist[selectIndex].removeFromParent()
        
        
    }
    
    func tabBarDefaultSetting()
    {
        rankingTabBarIconImageView.image = UIImage(named: "icRankingUnselected")
        homeTabBarIconImageView.image = UIImage(named: "icHomeUnselected")
        userIconImageView.image = UIImage(named: "icUserUnselected")
        
        
        rankingLabel.textColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        homeLabel.textColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        MyLabel.textColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
    func moveVC()
    {
        tabBarDefaultSetting()
        if selectIndex == 0
        {
            rankingTabBarIconImageView.image = UIImage(named: "icRankingSelected")
            
            rankingLabel.textColor = .init(red: 203/255, green: 65/255, blue: 30/255, alpha: 1)

        }
        else if selectIndex == 1
        {
            homeTabBarIconImageView.image = UIImage(named: "icHomeSelected")
            
            homeLabel.textColor = .init(red: 203/255, green: 65/255, blue: 30/255, alpha: 1)
        }
        else
        {
            userIconImageView.image = UIImage(named: "icUserSelected")
            
            MyLabel.textColor = .init(red: 203/255, green: 65/255, blue: 30/255, alpha: 1)
        }
        
        addChild(VClist[selectIndex])
        VClist[selectIndex].view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100)
        VClist[selectIndex].didMove(toParent: self)
        
        self.addChild(VClist[selectIndex])
        self.containerView.addSubview(VClist[selectIndex].view)
        self.containerView.bringSubviewToFront(tabBarView)

    }
    
    
    
    
    func makeVC()
    {
        homeVC = (homeStoryboard.instantiateViewController(identifier: "HomeViewController") as? HomeViewController)!
        myVC = (MyStoryboard.instantiateViewController(identifier: "MyViewController") as? MyViewController)!
        RankingVC = (RankingStoryboard.instantiateViewController(identifier: "RankingViewController") as? RankingViewController)!

    }
    

   

}
