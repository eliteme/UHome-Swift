//
//  ApartmentData.swift
//  UHome
//
//  Created by wjl on 16/2/24.
//  Copyright © 2016年 Martin. All rights reserved.
//

import UIKit

class ApartmentData: NSObject {

    var title: String!
    var describe: String!
    var imgView: String!
    
    init(title: String, describe: String, imgView: String) {
        self.title = title
        self.describe = describe
        self.imgView = imgView
    }
}
