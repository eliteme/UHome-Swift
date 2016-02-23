//
//  SearchViewController.swift
//  UHome
//
//  Created by wjl on 16/2/20.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController, UITableViewDelegate{

    var cityTableVC = CityTableViewController()
    var searchBar: UISearchBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setUpTableView()
    }

    func setUpSearchBar(){
        
        searchBar?.placeholder = "输入城市名称"
        searchBar?.searchBarStyle = UISearchBarStyle.Default
        searchBar?.backgroundColor = UIColor.blueColor()
        searchBar?.showsCancelButton = true
        view.addSubview(searchBar!);
        searchBar?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(5)
            make.right.equalTo(-5)
            make.height.equalTo(60)
        })
        
    }
    
    func setUpTableView(){
        view.addSubview(cityTableVC.view)
        cityTableVC.view.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(globalNavigationBarHeight)
            make.left.equalTo(0)
            make.width.equalTo(ScreenWidth)
            make.bottom.equalTo(view).offset(-globalTabbarHeight)
        }
        
    }
}
