//
//  MHSecondKillManager.swift
//  mOVe
//
//  Created by 哈哈 on 2022/6/7.
//  Copyright © 2022 MengHeng. All rights reserved.
//

import UIKit
/// 秒杀倒计时
class MHSecondKillManager {
    var secondsToEnd: Int = 0
    var myTimer :MHCustomTimer!
    /// 回调
    var callBack:((String) -> ())?
    
     init(seconds: Int,callBack:((String)->())?) {
        self.secondsToEnd = seconds

        myTimer = MHCustomTimer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
        //如果希望对Timer做自定义的操作，使用_Timer属性
               RunLoop.current.add(myTimer._timer, forMode: RunLoop.Mode.common)
               myTimer.fire()
               self.callBack = callBack
    }
    
    @objc func timerRun() {
           secondsToEnd -= 1
           if secondsToEnd == 0 {
               myTimer.invalidate()
           }
           callBack?(secondsToTimeString(seconds: secondsToEnd))
           
       }
    
    /// 秒数转化为时间字符串
    func secondsToTimeString(seconds: Int) -> String {
           //天数计算
           let days = (seconds)/(24*3600);
           
           //小时计算
           let hours = (seconds)%(24*3600)/3600;
           
           //分钟计算
           let minutes = (seconds)%3600/60;
           
           //秒计算
           let second = (seconds)%60;
           
           let timeString  = String(format: "%lu天 %02lu:%02lu:%02lu", days, hours, minutes, second)
           return timeString
       }
}
