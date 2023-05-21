//
//  MHDeviceModel.swift
//  mOVe
//
//  Created by 哈哈 on 2023/4/16.
//  Copyright © 2023 MengHeng. All rights reserved.
//

import UIKit

class MHDeviceModel: NSObject {
    var devName: String?
    var devId: String?
    var boundStatus: String? // 0:为绑定  1:已绑定
    
    override init() {
       super.init()
    }
}
