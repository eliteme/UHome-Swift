//
//  ConfirmViewController.swift
//  UHome
//
//  Created by 张星宇 on 16/2/23.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController {
    let realNameConfirmArea = UIView()
    let realPhotoConfirmArea = UIView()
    let realPhoneConfirmArea = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        self.view.backgroundColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        if let photoName = GlobalInfoManager.currentConfirmInfo.realPhotoName {  // 真实头像认证后的UI控件
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
            
            let label = UILabel()
            realPhotoConfirmArea.addSubview(label)
            label.snp_makeConstraints(closure: { (make) -> Void in
                make.left.equalTo(10)
                make.top.equalTo(clickImageView1.snp_bottom).offset(10)
            })
            label.font = UIFont.systemFontOfSize(14)
            label.text = "成功进行真实头像验证"
        }
        else {  // 未进行头像认证时的代码
            let errorHintLabel = UILabel()
            realPhotoConfirmArea.addSubview(errorHintLabel)
            errorHintLabel.snp_makeConstraints(closure: { (make) -> Void in
                make.center.equalTo(realPhotoConfirmArea.snp_center)
            })
            errorHintLabel.text = "您还没有进行真实头像认证"
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
        
        if let id = GlobalInfoManager.currentConfirmInfo.realID, name = GlobalInfoManager.currentConfirmInfo.realName {
            realNameConfirmArea.addSubview(clickImageView2)
            clickImageView2.snp_makeConstraints(closure: { (make) -> Void in
                make.centerY.equalTo(realNameConfirmArea.snp_centerY)
                make.left.equalTo(20)
                make.width.height.equalTo(100)
            })
            
            let label = UILabel()
            realNameConfirmArea.addSubview(label)
            label.snp_makeConstraints(closure: { (make) -> Void in
                make.left.equalTo(10)
                make.top.equalTo(clickImageView2.snp_bottom).offset(10)
            })
            label.font = UIFont.systemFontOfSize(14)
            label.text = "成功进行真实姓名验证"
            
            let nameLabel = UILabel()
            realNameConfirmArea.addSubview(nameLabel)
            nameLabel.snp_makeConstraints(closure: { (make) -> Void in
                make.top.equalTo(clickImageView2)
                make.left.equalTo(clickImageView2).offset(180)
            })
            nameLabel.text = "姓名：" + name
            
            let idLabel = UITextView()
            realNameConfirmArea.addSubview(idLabel)
            idLabel.snp_makeConstraints(closure: { (make) -> Void in
                make.centerX.equalTo(nameLabel.snp_centerX).offset(10)
                make.top.equalTo(nameLabel.snp_bottom).offset(50)
                make.width.equalTo(160)
                make.height.equalTo(80)
            })
            idLabel.backgroundColor = UIColor.clearColor()
            idLabel.font = UIFont.systemFontOfSize(14)
            idLabel.text = "       身份证号：\n\n" + id
        }
        else {
            let errorHintLabel = UILabel()
            realNameConfirmArea.addSubview(errorHintLabel)
            errorHintLabel.snp_makeConstraints(closure: { (make) -> Void in
                make.center.equalTo(realNameConfirmArea.snp_center)
            })
            errorHintLabel.text = "您还没有进行真实姓名认证"
        }
        
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
        
        if let phoneNumber = GlobalInfoManager.currentConfirmInfo.realPhoneNumber {
            realPhoneConfirmArea.addSubview(clickImageView3)
            clickImageView3.snp_makeConstraints(closure: { (make) -> Void in
                make.centerY.equalTo(realPhoneConfirmArea.snp_centerY)
                make.left.equalTo(20)
                make.width.height.equalTo(100)
            })
            
            let label = UILabel()
            realPhoneConfirmArea.addSubview(label)
            label.snp_makeConstraints(closure: { (make) -> Void in
                make.left.equalTo(10)
                make.top.equalTo(clickImageView3.snp_bottom).offset(10)
            })
            label.font = UIFont.systemFontOfSize(14)
            label.text = "成功进行真实手机号验证"
            
            let hintLabel = UILabel()
            realPhoneConfirmArea.addSubview(hintLabel)
            hintLabel.snp_makeConstraints(closure: { (make) -> Void in
                make.top.equalTo(clickImageView3).offset(30)
                make.left.equalTo(clickImageView3).offset(210)
            })
            hintLabel.text = "手机号码"
            
            let phoneNumberLabel = UILabel()
            realPhoneConfirmArea.addSubview(phoneNumberLabel)
            phoneNumberLabel.snp_makeConstraints(closure: { (make) -> Void in
                make.centerX.equalTo(hintLabel.snp_centerX)
                make.top.equalTo(hintLabel.snp_bottom).offset(30)
            })
            phoneNumberLabel.text = phoneNumber
        }
        else {
            let errorHintLabel = UILabel()
            realPhoneConfirmArea.addSubview(errorHintLabel)
            errorHintLabel.snp_makeConstraints(closure: { (make) -> Void in
                make.center.equalTo(realPhoneConfirmArea.snp_center)
            })
            errorHintLabel.text = "您还没有进行真实手机号认证"
        }
    }
}
