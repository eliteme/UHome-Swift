//
//  HomeDetailViewController.swift
//  UHome
//
//  Created by 张星宇 on 16/2/24.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class HomeDetailViewController: UIViewController {
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
    
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupView() {
        view.addSubview(scrollView)
        scrollView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view)
        }
        scrollView.backgroundColor = UIColor.whiteColor()
        
        let containerView = UIView()
        scrollView.addSubview(containerView)
        containerView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(scrollView)
            make.width.equalTo(MainBounds.width)
        }
        containerView.backgroundColor = UIColor.whiteColor()
        
        /// 圆角房屋图片
        let housePhotoImageView = UIImageView(image: UIImage(named: "train"))
        containerView.addSubview(housePhotoImageView)
        housePhotoImageView.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(containerView.snp_centerX)
            make.width.height.equalTo(80)
            make.top.equalTo(containerView).offset(20)
        }
        housePhotoImageView.layer.cornerRadius = 40
        housePhotoImageView.layer.masksToBounds = true
        housePhotoImageView.layer.shouldRasterize = true
        
        /// 房屋名称
        
        containerView.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(housePhotoImageView.snp_bottom).offset(600)
//            make.height.equalTo(600)
        }
    }

}
