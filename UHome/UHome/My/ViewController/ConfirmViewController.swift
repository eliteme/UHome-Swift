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
        setupView()
        
        self.view.backgroundColor = UIColor.whiteColor()
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

extension ConfirmViewController {
    func setupView() {
        let clickImage = UIImage(named: "click")
        let clickImageView1 = UIImageView(image: clickImage)
        let clickImageView2 = UIImageView(image: clickImage)
        let clickImageView3 = UIImageView(image: clickImage)
        
        view.addSubview(realPhotoConfirmArea)
        realPhotoConfirmArea.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(-0.3).offset(64)
            make.left.equalTo(view).offset(-0.3)
            make.centerX.equalTo(view)
            make.height.equalTo(view).offset(-37).multipliedBy(1.0 / 3.0)
        }
        realPhotoConfirmArea.layer.borderWidth = 0.3
        realPhotoConfirmArea.layer.borderColor = "203 205 206".ktcolor.CGColor
        realPhotoConfirmArea.backgroundColor = "250 251 252".ktcolor
        
        if let photoName = realPhotoName {
            realPhotoConfirmArea.addSubview(clickImageView1)
            clickImageView1.snp_makeConstraints(closure: { (make) -> Void in
                make.centerY.equalTo(realPhotoConfirmArea.snp_centerY)
                make.left.equalTo(20)
                make.width.height.equalTo(100)
            })
            
            let realPhoto = UIImageView(image: UIImage(named: photoName))
            realPhotoConfirmArea.addSubview(realPhoto)
            realPhoto.snp_makeConstraints(closure: { (make) -> Void in
                make.centerY.equalTo(realPhotoConfirmArea.snp_centerY)
                make.right.equalTo(realPhotoConfirmArea.snp_right).offset(-30)
                make.width.height.equalTo(150)
            })
        }
        /**
        实名认证区域
        */
        view.addSubview(realNameConfirmArea)
        realNameConfirmArea.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view).offset(-0.3)
            make.top.equalTo(realPhotoConfirmArea.snp_bottom)
            make.centerX.equalTo(view)
            make.height.equalTo(realPhotoConfirmArea)
        }
        realNameConfirmArea.layer.borderWidth = 0.3
        realNameConfirmArea.layer.borderColor = "203 205 206".ktcolor.CGColor
        realNameConfirmArea.backgroundColor = "250 251 252".ktcolor
        
        view.addSubview(realPhoneConfirmArea)
        realPhoneConfirmArea.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view).offset(-0.3)
            make.top.equalTo(realNameConfirmArea.snp_bottom)
            make.centerX.equalTo(view)
            make.height.equalTo(realPhotoConfirmArea)
        }
        realPhoneConfirmArea.layer.borderWidth = 0.3
        realPhoneConfirmArea.layer.borderColor = "203 205 206".ktcolor.CGColor
        realPhoneConfirmArea.backgroundColor = "250 251 252".ktcolor
    }
}
