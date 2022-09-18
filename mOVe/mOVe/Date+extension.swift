//
//  Date+extension.swift
//  mOVe
//
//  Created by 哈哈 on 2022/9/18.
//  Copyright © 2022 MengHeng. All rights reserved.
//

import Foundation

extension Date {
 
    /// 获取当前 秒级 时间戳 - 10位
    var timestamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let timestamp = Int(timeInterval)
        return "\(timestamp)"
    }
 
    /// 获取当前 毫秒级 时间戳 - 13位
    var milliStamp : String {
        let timeInterval: TimeInterval = self.timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return "\(millisecond)"
    }
}
