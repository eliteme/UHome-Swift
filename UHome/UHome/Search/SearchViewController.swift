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
        cityTableVC.searchResult = cityTableVC.allCity
        
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
 
    }
    
    func setUpSearchBar(){
        searchBar = UISearchBar(frame: CGRectMake(0, 0, ScreenWidth, 60))
        searchBar?.placeholder = "输入城市名称"
        searchBar?.searchBarStyle = UISearchBarStyle.Default
        searchBar!.delegate = self
        view.addSubview(searchBar!);
        navigationItem.titleView = searchBar
    }
}

extension SearchViewController{
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {     
        if searchText == ""{
            cityTableVC.searchResult = cityTableVC.allCity
        }
        else{
            cityTableVC.searchResult = []
            for city in self.cityTableVC.allCity{
                if city.uppercaseString.hasPrefix(searchText){
                    cityTableVC.searchResult.append(city)
                }
            }
        }
        cityTableVC.tableView.reloadData()
    }
}














