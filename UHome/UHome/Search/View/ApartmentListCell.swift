//
//  ApartmentListCell.swift
//  UHome
//
//  Created by wjl on 16/2/24.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class ApartmentListCell: UITableViewCell {

    @IBOutlet weak var describeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .None
        
    }
    
}
