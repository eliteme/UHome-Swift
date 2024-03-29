//
//  LoginViewController.swift
//  UHome
//
//  Created by 张星宇 on 16/2/21.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit
import SnapKit
import MBProgressHUD

class LoginViewController: UIViewController {
    let loginButton = UIButton()
    let logoImageView = UIImageView(image: UIImage(named: "clear_logo"))
    var usernameField = UITextField()
    let passwordField = UITextField()
    var topConstraint: Constraint?
    
    override func viewDidLoad() {
        view.backgroundColor = "250 251 252".ktcolor
        navigationController?.navigationBar.hidden = true
        let tapGesture = UITapGestureRecognizer(target: self, action: Selector("closeTextFiled:"))
        view.addGestureRecognizer(tapGesture)
        /**
        *  logo
        */
        view.addSubview(logoImageView)
        logoImageView.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view.snp_centerX)
            make.width.equalTo(165)
            make.height.equalTo(120)
            self.topConstraint = make.top.equalTo(30).constraint
        }
        
        /// 白色区域
        let whiteContainer = UIView()
        view.addSubview(whiteContainer)
        whiteContainer.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(view).offset(-0.5)
            make.width.equalTo(view).offset(1)
            make.height.equalTo(80)
            make.top.equalTo(logoImageView.snp_bottom).offset(50)
        }
        whiteContainer.backgroundColor = UIColor.whiteColor()
        whiteContainer.layer.borderWidth = 0.6
        whiteContainer.layer.borderColor = "203 205 206".ktcolor.CGColor
        
        /// 分割线
        let seperateLine = UIView()
        view.addSubview(seperateLine)
        seperateLine.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.centerX.equalTo(view.snp_centerX)
            make.height.equalTo(0.6)
            make.top.equalTo(whiteContainer.snp_top).offset(40)
        }
        seperateLine.backgroundColor = "203 205 206".ktcolor
        
        /**
        *  username
        */
        view.addSubview(usernameField)
        usernameField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.centerX.equalTo(view.snp_centerX)
            make.height.equalTo(40)
            make.top.equalTo(logoImageView.snp_bottom).offset(50)
        }
        usernameField.placeholder = "请输入您的用户名"
        
        /**
        *  password
        */
        view.addSubview(passwordField)
        passwordField.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(20)
            make.centerX.equalTo(view.snp_centerX)
            make.height.equalTo(40)
            make.top.equalTo(usernameField.snp_bottom)
        }
        passwordField.placeholder = "请输入您的密码"
        
        /**
        *  Button
        */
        view.addSubview(loginButton)
        loginButton.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view.snp_centerX)
            make.width.equalTo(300)
            make.top.equalTo(logoImageView.snp_bottom).offset(200)
        }
        
        loginButton.setTitle("登陆", forState: .Normal)
        loginButton.backgroundColor = "91 152 160".ktcolor
        loginButton.addTarget(self, action: Selector("loginButtonClicked:"), forControlEvents: .TouchUpInside)
    }
    
    func loginButtonClicked(sender: AnyObject) {
        // Autolayout 下的动画
//        self.topConstraint?.updateOffset(50)
//        UIView.animateWithDuration(0.5, animations: { () -> Void in
//            self.view.layoutIfNeeded()
//            }) { (isFinishd: Bool) -> Void in
//                
//        }
        let mainDic = NSDictionary.init(contentsOfFile: NSBundle.mainBundle().pathForResource("Database", ofType: "plist")!)
        let usersDic = mainDic!["Users"]
        let task = delay(1) {
            self.navigationController?.pushViewController(MainTabBarController(), animated: false)
        }
        let hud = MBProgressHUD.showHUDAddedTo(view, animated: true)
        var isUserExist = false
        
        for var user in usersDic as! NSArray {
            user = user as! NSDictionary
            if user.objectForKey("username") as? String == usernameField.text {
                isUserExist = true
                hud.labelText = "登录中"
                GlobalInfoManager.currentUser =
                User(name: user.objectForKey("username") as! String,
                     isRenter: user.objectForKey("identify") as! String == "renter",
                     sex: user.objectForKey("sex") as! String,
                     nickname: user.objectForKey("nickname") as! String,
                     age: user.objectForKey("age") as! Int,
                     education: user.objectForKey("education") as! String,
                     work:  user.objectForKey("work") as! String,
                     location: user.objectForKey("location") as! String,
                     points: user.objectForKey("points") as! Int)
                if user.objectForKey("password") as? String != passwordField.text {
                    cancel(task)
                    hud.mode = MBProgressHUDMode.Text
                    hud.labelText = "密码错误"
                }
            }
        }
        if !isUserExist {
            cancel(task)
            hud.mode = MBProgressHUDMode.Text
            hud.labelText = "用户不存在"
        }
        hud.hide(true, afterDelay: 1)
    }
    
    func closeTextFiled(sender: AnyObject) {
        usernameField.endEditing(true)
        passwordField.endEditing(true)
    }
}
