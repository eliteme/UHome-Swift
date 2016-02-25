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
    let seperateView = UIView()
    let apartmentContainerView = UIView()
    let confirmInfoView = UIView()
    
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
        let nameLabel = UILabel()
        containerView.addSubview(nameLabel)
        nameLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(containerView.snp_centerX)
            make.top.equalTo(housePhotoImageView.snp_bottom).offset(15)
        }
        nameLabel.text = "火车栈"
        nameLabel.font = UIFont.systemFontOfSize(20)
        nameLabel.textColor = "87 99 101".ktcolor
        
        /// 深色分割区域
        seperateView.backgroundColor = "229 236 236".ktcolor
        containerView.addSubview(seperateView)
        seperateView.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(containerView)
            make.top.equalTo(nameLabel.snp_bottom).offset(20)
            make.height.equalTo(60)
        }
        
        addLabels() // 添加那6个标签
        
        /// 房东资料
        let infoLabel = UILabel()
        containerView.addSubview(infoLabel)
        infoLabel.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(seperateView.snp_bottom).offset(20)
            make.centerX.equalTo(containerView.snp_centerX)
        }
        infoLabel.text = "房东资料"
        infoLabel.textColor = "26 32 40".ktcolor
        infoLabel.font = UIFont.systemFontOfSize(18)
        
        /// 上面的分割线
        let lineView1 = UIView()
        containerView.addSubview(lineView1)
        lineView1.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(containerView.snp_centerX)
            make.left.equalTo(20)
            make.top.equalTo(infoLabel.snp_bottom).offset(10)
            make.height.equalTo(1)
        }
        lineView1.backgroundColor = "239 241 241".ktcolor
        
        /// 下面的分割线
        let lineView2 = UIView()
        containerView.addSubview(lineView2)
        lineView2.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(containerView.snp_centerX)
            make.left.equalTo(20)
            make.top.equalTo(lineView1.snp_bottom).offset(150)
            make.height.equalTo(1)
        }
        lineView2.backgroundColor = "239 241 241".ktcolor
        
        containerView.addSubview(confirmInfoView)
        confirmInfoView.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(containerView)
            make.top.equalTo(lineView1)
            make.bottom.equalTo(lineView2)
        }
        addConfirmInfomation()
        
        /// 房源信息的背景视图
        apartmentContainerView.backgroundColor = "229 236 236".ktcolor
        containerView.addSubview(apartmentContainerView)
        apartmentContainerView.snp_makeConstraints { (make) -> Void in
            make.width.equalTo(containerView)
            make.centerX.equalTo(containerView.snp_centerX)
            make.top.equalTo(lineView2.snp_bottom).offset(20)
            make.height.equalTo(200) // TODO：这个地方的依赖逻辑将来要需改一下
        }
        
        addApartment()
        
        containerView.snp_makeConstraints { (make) -> Void in
            make.bottom.equalTo(apartmentContainerView.snp_bottom)
        }
        
    }
    
    func addConfirmInfomation() {
        let clickImageView = UIImageView(image: UIImage(named: "click"))
        confirmInfoView.addSubview(clickImageView)
        clickImageView.snp_makeConstraints { (make) -> Void in
            make.centerY.equalTo(confirmInfoView.snp_centerY)
            make.right.equalTo(confirmInfoView.snp_right).offset(-30)
            make.width.height.equalTo(60)
        }
    }
    
    func addApartment() {
        let label = UILabel()
        apartmentContainerView.addSubview(label)
        label.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(apartmentContainerView.snp_centerX)
            make.top.equalTo(apartmentContainerView).offset(25)
        }
        label.text = "1个房源"
        label.textColor = "26 32 40".ktcolor
        label.font = UIFont(name: "Helvetica-Bold", size: 18)
        
        let apartmentVC = ApartmentThumbnailViewController()
        apartmentContainerView.addSubview(apartmentVC.view)
        apartmentVC.view.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(label.snp_bottom).offset(10)
            make.left.right.equalTo(apartmentContainerView)
        }
        apartmentVC.imageView.image = UIImage(named: "train")
        let attributedString = NSMutableAttributedString(string: "￥168/晚")
        attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSMakeRange(0, 4))
        apartmentVC.priceLabel.attributedText = attributedString
    }
    
    func addLabels() {
        let minuteLabel = UILabel() // 6分钟
        seperateView.addSubview(minuteLabel)
        minuteLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(seperateView.snp_centerX)
            make.top.equalTo(10)
        }
        minuteLabel.text = "6分钟"
        minuteLabel.textColor = UIColor.redColor()
        minuteLabel.font = UIFont.systemFontOfSize(13)
        
        let timeLabel = UILabel() // 平均确认
        seperateView.addSubview(timeLabel)
        timeLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(seperateView.snp_centerX)
            make.top.equalTo(minuteLabel.snp_bottom).offset(5)
        }
        timeLabel.textColor = "20 30 42".ktcolor
        timeLabel.text = "平均确认"
        timeLabel.font = UIFont.systemFontOfSize(15)
        
        let percentLabel = UILabel() // 20%
        seperateView.addSubview(percentLabel)
        percentLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(seperateView.snp_centerX).offset(-110)
            make.top.equalTo(minuteLabel)
        }
        percentLabel.text = "20%"
        percentLabel.textColor = UIColor.redColor()
        percentLabel.font = UIFont.systemFontOfSize(13)
        
        let acceptanceLabel = UILabel() // 33%
        seperateView.addSubview(acceptanceLabel)
        acceptanceLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(seperateView.snp_centerX).offset(110)
            make.top.equalTo(minuteLabel)
        }
        acceptanceLabel.text = "33.33%"
        acceptanceLabel.textColor = UIColor.redColor()
        acceptanceLabel.font = UIFont.systemFontOfSize(13)
        
        let responseLabel = UILabel() // 在线回复率
        seperateView.addSubview(responseLabel)
        responseLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(percentLabel.snp_centerX)
            make.top.equalTo(percentLabel.snp_bottom).offset(5)
        }
        responseLabel.textColor = "20 30 42".ktcolor
        responseLabel.text = "在线回复率"
        responseLabel.font = UIFont.systemFontOfSize(15)
        
        let acceptLabel = UILabel() // 在线回复率
        seperateView.addSubview(acceptLabel)
        acceptLabel.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(acceptanceLabel.snp_centerX)
            make.top.equalTo(acceptanceLabel.snp_bottom).offset(5)
        }
        acceptLabel.textColor = "20 30 42".ktcolor
        acceptLabel.text = "订单接受率"
        acceptLabel.font = UIFont.systemFontOfSize(15)
    }
}
