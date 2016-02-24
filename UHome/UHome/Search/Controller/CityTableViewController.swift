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
    var allCity = ["北京","广州"]
    var searchResult: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        cell?.textLabel?.text = searchResult[indexPath.row]
        return cell!
        
    }
}

extension CityTableViewController{
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("1")
        let apartmentListVC = ApartmentListController()
        navigationController?.pushViewControllerWithTabbarHidden(apartmentListVC, animated: true)
        print(2)
    }
    
}



