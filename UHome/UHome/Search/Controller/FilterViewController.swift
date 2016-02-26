//
//  FilterViewController.swift
//  UHome
//
//  Created by wjl on 16/2/25.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

public let changeNumberOfPeopleNotification = "changeNumberOfPeopleNotification"

class FilterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var datePicker: UIDatePicker!
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        
        setDataPicker()
        setTableView()
    }

    
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "changeNumberOfPeople", name: changeNumberOfPeopleNotification, object: nil)
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    func changeNumberOfPeople(){
        tableView.reloadData()
    }

    func setDataPicker(){
        datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.date = NSDate()
        view.addSubview(datePicker)
        
        datePicker.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(55)
            make.right.equalTo(view).offset(0)
            make.left.equalTo(view).offset(0)
            make.height.equalTo(216)
        }

    }
    
    func setTableView(){
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        view.addSubview(tableView)
        
        tableView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(datePicker.snp_bottom).offset(0)
            make.left.right.equalTo(0)
            make.bottom.equalTo(0)
        }
        
        tableView.tableFooterView = UIView()

    }
    
}

extension FilterViewController{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "NumberOfPeopleCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? NumberOfPeopleCell
        if cell == nil{
             cell = NSBundle.mainBundle().loadNibNamed("NumberOfPeopleCell", owner: nil, options: nil).last as? NumberOfPeopleCell
                cell?.selectionStyle = UITableViewCellSelectionStyle.None
            
        }
        return cell!
    }

    
}
