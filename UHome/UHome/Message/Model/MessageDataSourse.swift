//
//  MessageDataSourse.swift
//  UHome
//
//  Created by wjl on 16/2/21.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class MessageDataSourse: NSObject ,UITableViewDataSource {
    
    override init() {
        super.init()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "MessageCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? MessageCell
        if cell == nil{
            cell = NSBundle.mainBundle().loadNibNamed("MessageCell", owner: nil, options: nil).last as? MessageCell
        }
        cell?.configureForCell()
        return cell!
    }
    
}