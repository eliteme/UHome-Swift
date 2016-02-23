//
//  SearchViewController.swift
//  UHome
//
//  Created by wjl on 16/2/20.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate{

    var cityTableVC = CityTableViewController()
    var searchBar: UISearchBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        setUpSearchBar()
    }

    func setUpTableView(){
        view.addSubview(cityTableVC.view)
        cityTableVC.view.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(globalNavigationBarHeight)
            make.left.equalTo(0)
            make.width.equalTo(ScreenWidth)
            make.bottom.equalTo(view).offset(-globalTabbarHeight)
        }
            print(cityTableVC.view.frame)
    }
    
    func setUpSearchBar(){
        
        searchBar = UISearchBar()
        searchBar?.placeholder = "输入城市名称"
        searchBar?.searchBarStyle = UISearchBarStyle.Default
        searchBar?.backgroundColor = UIColor.blueColor()
        searchBar?.showsCancelButton = true
        searchBar!.delegate = self
        view.addSubview(searchBar!);
        searchBar?.snp_makeConstraints(closure: { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(ScreenWidth)
            make.height.equalTo(60)
        })
        print(searchBar?.frame);
    }
}
