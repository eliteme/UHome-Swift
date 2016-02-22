//
//  MyInfoTableViewCell.swift
//  UHome
//
//  Created by 张星宇 on 16/2/22.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class MyInfoTableViewCell: UITableViewCell {
    let customImageView = UIImageView()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureForCell(section: Int){
        if section == 0 {
            contentView.addSubview(customImageView)
            customImageView.snp_makeConstraints(closure: { (make) -> Void in
                make.width.height.equalTo(100)
                make.centerX.equalTo(contentView.snp_centerX)
                make.top.equalTo(contentView).offset(20)
                make.bottom.equalTo(contentView).offset(-50)
            })
            customImageView.layer.cornerRadius = 30 // 高效的 corner
        }
        else {
            self.textLabel?.text = "测试内容"
        }
    }

}
