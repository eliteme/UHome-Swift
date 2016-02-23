//
//  ConfirmViewController.swift
//  UHome
//
//  Created by 张星宇 on 16/2/23.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController {
    var realName: String?
    var readID: String?
    var realPhotoName: String?
    var realPhoneNumber: String?
    
    let realNameConfirmArea = UIView()
    let realPhotoConfirmArea = UIView()
    let realPhoneConfirmArea = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureConfirmation()
        
        view.addSubview(realPhotoConfirmArea)
        realPhotoConfirmArea.snp_makeConstraints { (make) -> Void in
            make.top.left.equalTo(view).offset(-0.3)
            make.centerX.equalTo(view)
            make.height.equalTo(view).multipliedBy(1.0 / 3.0)
        }
        realPhotoConfirmArea.layer.borderWidth = 0.3
        realPhotoConfirmArea.layer.borderColor = "203 205 206".ktcolor.CGColor
        realPhotoConfirmArea.backgroundColor = "250 251 252".ktcolor
        
        /**
        实名认证区域
        */
        view.addSubview(realNameConfirmArea)
        realNameConfirmArea.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view).offset(-0.3)
            make.top.equalTo(realPhotoConfirmArea.snp_bottom)
            make.centerX.equalTo(view)
            make.height.equalTo(view).multipliedBy(1.0 / 3.0)
        }
        realNameConfirmArea.layer.borderWidth = 0.3
        realNameConfirmArea.layer.borderColor = "203 205 206".ktcolor.CGColor
        realNameConfirmArea.backgroundColor = "250 251 252".ktcolor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func configureConfirmation() {
        let mainDic = NSDictionary.init(contentsOfFile: NSBundle.mainBundle().pathForResource("Database", ofType: "plist")!)
        let confirmDic = mainDic!["Confirm"]
        for var user in confirmDic as! NSArray {
            user = user as! NSDictionary
            if user.objectForKey("username") as? String == GlobalInfoManager.currentUser.name {
                realName = user.objectForKey("realname") as? String
                readID = user.objectForKey("id") as? String
                realPhotoName = user.objectForKey("image") as? String
                realPhoneNumber = user.objectForKey("phone") as? String
            }
        }
    }

}
