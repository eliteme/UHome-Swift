//
//  ApartmentListCell.swift
//  UHome
//
//  Created by wjl on 16/2/25.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class ApartmentListCell: UITableViewCell {

    var imgView: UIImageView!
    var titleView: UILabel!

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setSubViews(){
        
        imgView = UIImageView()
        contentView.addSubview(imgView);
        imgView.snp_makeConstraints { (make) -> Void in
            make.top.left.equalTo(contentView).offset(10)
            make.height.equalTo(100)
            make.width.equalTo(120)
            make.bottom.equalTo(contentView).offset(-10)
        }
        
        titleView = UILabel()
        contentView.addSubview(titleView)
        titleView.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(imgView.snp_right).offset(10)
            make.top.equalTo(imgView)
            make.right.equalTo(contentView).offset(-10)
            make.height.equalTo(21)
        }
        
    }
}
