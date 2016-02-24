//
//  ApartmentListController.swift
//  UHome
//
//  Created by wjl on 16/2/24.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class ApartmentListController: UIViewController {

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setUpTableView()

    }
    
    func setUpTableView(){
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(globalNavigationBarHeight)
            make.left.equalTo(0)
            make.width.equalTo(ScreenWidth)
            make.bottom.equalTo(view).offset(-globalTabbarHeight)
        }
        
    }
}
