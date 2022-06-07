//
//  TimerViewController.swift
//  mOVe
//
//  Created by 哈哈 on 2022/6/7.
//  Copyright © 2022 MengHeng. All rights reserved.
//

import UIKit

/// 定时器的相关操作
class TimerViewController: UIViewController {
    var killTimer:MHSecondKillManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        killTimer = MHSecondKillManager(seconds: 12 * 60 * 60, callBack: {[weak self] (text) in
                 
        })
               
        
    }
}
