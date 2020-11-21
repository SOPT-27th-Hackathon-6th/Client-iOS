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
    
    
    let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
    let MyStoryboard = UIStoryboard(name: "My", bundle: nil)
    let RankingStoryboard = UIStoryboard(name: "Ranking", bundle: nil)
    
    var homeVC = UIViewController()
    var myVC = UIViewController()
    var RankingVC = UIViewController()
    
    var VClist : [UIViewController] = []
    
    var selectIndex : Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeVC()
        setVCList()
        moveVC()


        // Do any additional setup after loading the view.
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
    
    func moveVC()
    {
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
    
    func setFirstTab()
    {

        addChild(RankingVC)
        RankingVC.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100)
        RankingVC.didMove(toParent: self)
        
        self.addChild(RankingVC)
        self.containerView.addSubview(RankingVC.view)
        self.containerView.bringSubviewToFront(tabBarView)
        
        
    }
    
    func setSecondTab()
    {
        addChild(homeVC)
        homeVC.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100)
        homeVC.didMove(toParent: self)
        
        self.addChild(homeVC)
        self.containerView.addSubview(homeVC.view)
        self.containerView.bringSubviewToFront(tabBarView)
        
    }
    
    func setThridTab()
    {
        addChild(myVC)
        myVC.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 100)
        myVC.didMove(toParent: self)
        
        self.addChild(myVC)
        self.containerView.addSubview(myVC.view)
        self.containerView.bringSubviewToFront(tabBarView)
        
    }
   

}
