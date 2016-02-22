//
//  DataModel.swift
//  UHome
//
//  Created by 张星宇 on 16/2/22.
//  Copyright © 2016年 Martin. All rights reserved.
//

import Foundation

struct User {
    let name: String
    let isRenter: Bool
    let sex: String
    let nickname: String // 昵称
    let age: Int
    let education: String  // 学历
    let work: String // 工作
    let location: String
    var points: Int // 积分
}