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
    let indexPath: NSIndexPath
    
    init(style: UITableViewCellStyle, reuseIdentifier: String?, indexPath: NSIndexPath) {
        self.indexPath = indexPath
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = UITableViewCellSelectionStyle.None
        accessoryType = .DisclosureIndicator
        
        setupSubViews()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureForCell(titles: Array<String>){
        if indexPath.section == 0 {
            customImageView.image = UIImage(named: GlobalInfoManager.currentUser.name)
        }
        else {
            self.textLabel?.text = titles[indexPath.row]
        }
    }
    
    func setupSubViews() {
        if indexPath.section == 0 {
            contentView.addSubview(customImageView)
            customImageView.snp_makeConstraints(closure: { (make) -> Void in
                make.width.height.equalTo(100)
                make.centerX.equalTo(contentView.snp_centerX)
                make.top.equalTo(contentView).offset(20)
                make.bottom.equalTo(contentView).offset(-50)
            })
            customImageView.layer.cornerRadius = 30 // TODO：使用高效的 corner
            
            let usernameLabel = UILabel()
            contentView.addSubview(usernameLabel)
            usernameLabel.snp_makeConstraints(closure: { (make) -> Void in
                make.centerX.equalTo(contentView.snp_centerX)
                make.top.equalTo(customImageView.snp_bottom).offset(20)
            })
            let labelContent = GlobalInfoManager.currentUser.isRenter ? "房客：" : "房东："
            usernameLabel.text = labelContent + GlobalInfoManager.currentUser.name
            usernameLabel.font = UIFont.systemFontOfSize(20)
        }
        else {
            
        }
    }

}
