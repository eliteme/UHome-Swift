//
//  MyViewController.swift
//  UHome
//
//  Created by wjl on 16/2/20.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class MyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    var titles = ["我的积分：", "我的评论：", "认证信息：", "我的房源："]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if GlobalInfoManager.currentUser.isRenter {
//            titles.removeLast()   // 开发环境再加上这句话，目前调试的时候先注释掉
        }
        
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view)
        }
        tableView.backgroundColor = "250 251 252".ktcolor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 50
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MyViewController {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : titles.count
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30 * CGFloat(section)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(String(MyInfoTableViewCell)) as? MyInfoTableViewCell
        if cell == nil{
            cell = MyInfoTableViewCell(style: .Default, reuseIdentifier: String(MyInfoTableViewCell), indexPath: indexPath)
        }
        cell?.configureForCell(titles)
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            self.navigationController?.pushViewController(MyInfoViewController(), animated: true)
        }
        else {
            switch indexPath.row {
            case 1: self.navigationController?.pushViewController(CommentViewController(), animated: true)
            case 2: self.navigationController?.pushViewController(ConfirmViewController(), animated: true)
            default: break
            }
        }
    }
}