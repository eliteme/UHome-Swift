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
        tableView.rowHeight = 300
        
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
           make.edges.equalTo(view)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "apartmentListCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? ApartmentListCell
        if cell == nil{
            cell = NSBundle.mainBundle().loadNibNamed("ApartmentListCell", owner: nil, options: nil).last as? ApartmentListCell
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
        }
        cell?.titleLabel.text = "于古色古香的徽派客栈，偷得浮生半日闲"
        cell?.describeLabel.text = "一房一厅，可住三人：¥321/晚起"
        cell?.imageView?.image = UIImage(named: "tempImg")
        return cell!
    }


}
