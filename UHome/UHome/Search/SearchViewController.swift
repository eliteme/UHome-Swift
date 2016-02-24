//
//  SearchViewController.swift
//  UHome
//
//  Created by wjl on 16/2/20.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit
import SnapKit

class SearchViewController: UIViewController, UITableViewDelegate, UISearchBarDelegate,UITableViewDataSource{

    var tableView = UITableView()
    var searchBar: UISearchBar?
    var allCity = ["北京","广州"]
    var searchResult: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "城市查找"
        searchResult = allCity
        
        setUpTableView()
        setUpSearchBar()
    }

    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(ScreenWidth)
            make.bottom.equalTo(view).offset(-globalTabbarHeight)
        }
 
    }
    
    func setUpSearchBar(){
        searchBar = UISearchBar(frame: CGRectMake(0.0, 0.0, ScreenWidth , 45))
        searchBar?.placeholder = "输入城市名称"
        searchBar?.searchBarStyle = UISearchBarStyle.Default
        searchBar!.delegate = self
        tableView.tableHeaderView = searchBar
    }
}

extension SearchViewController{
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {     
        if searchText == ""{
            searchResult = allCity
        }
        else{
            searchResult = []
            for city in allCity{
                if city.uppercaseString.hasPrefix(searchText){
                    searchResult.append(city)
                }
            }
        }
        tableView.reloadData()
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return searchResult.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var titleStr = ""
        let str = NSMutableString(string: allCity[section]) as CFMutableString
        if CFStringTransform(str, nil, kCFStringTransformMandarinLatin, false) == true{
            titleStr = str as String
        }
        let title = "\(titleStr[titleStr.startIndex])"
        return title
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "CityCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: identifier)
            cell?.selectionStyle = UITableViewCellSelectionStyle.None
        }
        cell?.textLabel?.text = searchResult[indexPath.section]
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        navigationController?.pushViewController(ApartmentListController(), animated: true)
    }

}














