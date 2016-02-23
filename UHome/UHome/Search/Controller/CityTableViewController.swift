//
//  CityTableViewController.swift
//  UHome
//
//  Created by wjl on 16/2/23.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class CityTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        
        setUpTableView()
    }
    
    func setUpTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view)
        }
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "CityCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
        }
        cell?.textLabel?.text = "爱丁堡"
        return cell!

    }


}
