//
//  ApartmentListController.swift
//  UHome
//
//  Created by wjl on 16/2/24.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class ApartmentListController: UIViewController ,UITableViewDelegate{

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setUpTableView()

    }
    
    func setUpTableView(){
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
           make.edges.equalTo(view)
        }
        
    }
}
