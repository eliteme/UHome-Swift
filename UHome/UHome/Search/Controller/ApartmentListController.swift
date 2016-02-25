//
//  ApartmentListController.swift
//  UHome
//
//  Created by wjl on 16/2/24.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class ApartmentListController: UIViewController ,UITableViewDelegate, UITableViewDataSource{

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setUpTableView()

    }
    
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
           make.edges.equalTo(view)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "ApartmentListCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? ApartmentListCell
        if cell == nil{
            cell = ApartmentListCell(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None

        }
        cell?.titleView.text = "你管我"
        cell?.imgView?.image = UIImage(named: "tempImg")
        return cell!
    }


}
