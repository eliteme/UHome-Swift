//
//  MyInfoViewController.swift
//  UHome
//
//  Created by 张星宇 on 16/2/23.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class MyInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let tableView = UITableView()
    var titles = ["昵称：", "性别：", "年龄：", "学历：", "所在地：", "职业："]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "个人信息"
        
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view)
        }
        tableView.backgroundColor = "250 251 252".ktcolor
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 50
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MyInfoViewController {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(String(MyInfoViewController))
        if cell == nil{
            cell = UITableViewCell(style: .Default, reuseIdentifier: String(MyInfoViewController))
        }
        cell?.textLabel?.text = titles[indexPath.row]

        let rightLabel = UILabel()
        cell?.contentView.addSubview(rightLabel)
        rightLabel.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo((cell?.contentView.snp_centerY)!)
            make.right.equalTo((cell?.contentView)!).offset(-20)
        }
        switch indexPath.row {
        case 0: rightLabel.text = GlobalInfoManager.currentUser.nickname
        case 1: rightLabel.text = GlobalInfoManager.currentUser.sex == "male" ? "男" : "女"
        case 2: rightLabel.text = String(GlobalInfoManager.currentUser.age) + " 岁"
        case 3: rightLabel.text = GlobalInfoManager.currentUser.education
        case 4: rightLabel.text = GlobalInfoManager.currentUser.location
        case 5: rightLabel.text = GlobalInfoManager.currentUser.work
        default: break
        }
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        if indexPath.section == 0 {
//            self.navigationController?.pushViewController(MyInfoViewController(), animated: true)
//        }
//        else {
//            switch indexPath.row {
//            case 1: self.navigationController?.pushViewController(CommentViewController(), animated: true)
//            default: break
//            }
//        }
    }
}
