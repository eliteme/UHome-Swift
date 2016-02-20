//
//  MainTabBarController.swift
//  UHome
//
//  Created by wjl on 16/2/20.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAllChildViewController()
    }
}

// MARK: - 子视图
extension MainTabBarController{
    func addAllChildViewController(){
        // 主页
        addChildVC(HomeViewController(), title: "首页", image: "icon_tabbar_home", selected: "icon_tabbar_home_active")
        // 搜寻
        addChildVC(SearchViewController(), title: "搜索", image: "icon_tabbar_subscription", selected: "icon_tabbar_subscription_active")
        // 消息
        addChildVC(MessageViewController(), title: "消息", image: "icon_tabbar_activity", selected: "icon_tabbar_activity_active")
        // 我的
        addChildVC(MyViewController(), title: "我的", image: "icon_tabbar_me", selected: "icon_tabbar_me_active")
    }
    
    /**
     添加子视图控制器
     
     :param: childVC  NavigationViewController的根视图类型
     :param: title    tabbar item的文字
     :param: image    tabbar item的默认图片的名称
     :param: selected tabbar item的选中状态下图片的名称
     */
    func addChildVC(childVC: UIViewController, title: String?, image: String, selected: String) {
        childVC.tabBarItem.title = title
        childVC.tabBarItem.image = UIImage(named: image)
        childVC.tabBarItem.selectedImage = UIImage(named: selected)?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        // 设置点击之后字体的颜色
        childVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.blueColor()], forState:UIControlState.Selected)
        // 设置导航控制器
        let childNaviagation = UINavigationController(rootViewController: childVC)
        addChildViewController(childNaviagation)
    }
}


