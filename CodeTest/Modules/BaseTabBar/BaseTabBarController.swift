//
//  BaseTabBarController.swift
//  CodeTest
//
//  Created by Ku Ku Zan on 9/25/22.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarUI()
        insertTabBar()
    }
    
    fileprivate func setupTabBarUI() {
        tabBar.backgroundColor = .appColor(.primaryColor)
        tabBar.tintColor = .white
        tabBar.unselectedItemTintColor = .appColor(.primaryTextColor)
        UITabBarItem.appearance()
            .setTitleTextAttributes(
                [NSAttributedString.Key.font: UIFont(name: "Avenir Next", size: 12)!],
            for: .normal)
       
    }
    
    fileprivate func insertTabBar() {
        //RentCarTab
        let rentCarVC = DashBoardRouter().viewController
        rentCarVC.tabBarItem.image = UIImage.imageName(.dashboard)
        rentCarVC.tabBarItem.title = "Rent a car"
        rentCarVC.tabBarItem.tag = 0
        

        //BookingTab
        let bookingVC = UIViewController()
        if #available(iOS 13.0, *) {
            bookingVC.tabBarItem.image = UIImage.init(systemName: "square.and.pencil")
        } else {
            // Fallback on earlier versions
        }
        bookingVC.tabBarItem.title = "Booking"
        bookingVC.tabBarItem.tag = 1
        
        //ReferFriendTab
        let referFriendVC = UIViewController()
        if #available(iOS 13.0, *) {
            referFriendVC.tabBarItem.image = UIImage.init(systemName: "cube.box")
        } else {
            // Fallback on earlier versions
        }
        referFriendVC.tabBarItem.title = "Refer a friend"
        referFriendVC.tabBarItem.tag = 2
        
        //AccountTab
        let accountVC = UIViewController()
        if #available(iOS 13.0, *) {
            accountVC.tabBarItem.image = UIImage.init(systemName: "person")
        } else {
            // Fallback on earlier versions
        }
        accountVC.tabBarItem.title = "Account"
        accountVC.tabBarItem.tag = 2
        
        viewControllers = [rentCarVC, bookingVC, referFriendVC, accountVC]
        self.selectedIndex = 0
    }
}
