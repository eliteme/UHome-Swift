//
//  GlobalInfoManager.swift
//  UHome
//
//  Created by 张星宇 on 16/2/22.
//  Copyright © 2016年 Martin. All rights reserved.
//

import Foundation

class GlobalInfoManager {
    static var currentUser: User = User(name: "",
                                        isRenter: false,
                                        sex: "",
                                        nickname: "",
                                        age: 0,
                                        education: "",
                                        work:  "",
                                        location: "",
                                        points: 0)

    static var currentConfirmInfo: ConfirmInfo = ConfirmInfo(realName: "",
                                                             realID: "",
                                                             realPhotoName: "",
                                                             realPhoneNumber: "")
}