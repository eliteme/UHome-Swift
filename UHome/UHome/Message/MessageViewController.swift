//
//  MessageViewController.swift
//  UHome
//
//  Created by wjl on 16/2/20.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit
import SnapKit

class MessageViewController: UIViewController, UITableViewDelegate {

    let globalNavigationBarHeight = 64   //为了防止冲突，我先写在这里了
    var tableView = UITableView()
    var dataSourse = MessageDataSourse()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        
        setUpTableView()
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(globalNavigationBarHeight)
            make.left.right.bottom.equalTo(0)
        }
        tableView.delegate = self
        tableView.dataSource = dataSourse
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.tableFooterView = UIView()
    }
}
extension UINavigationController {
    /**
     调用系统的pushViewController方法，同时隐藏底部Tabbar
     
     :param: viewController 即将跳转的viewController
     :param: animated       是否开启动画
     */
    func pushViewControllerWithTabbarHidden(viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        pushViewController(viewController, animated: true)
    }
}
extension MessageViewController{
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        navigationController?.pushViewControllerWithTabbarHidden(ChatTableController(), animated: true)
    }
}