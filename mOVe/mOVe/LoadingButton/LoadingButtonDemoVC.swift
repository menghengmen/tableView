//
//  LoadingButtonDemoVC.swift
//  mOVe
//
//  Created by 哈哈 on 2022/6/19.
//  Copyright © 2022 MengHeng. All rights reserved.
//

import UIKit

class LoadingButtonDemoVC: UIViewController {
    var loadingButton:LoadingButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

         loadingButton  = LoadingButton(frame: CGRect(x: 10, y: 50, width: 300, height: 100));
        loadingButton.backgroundColor = .red
       // loadingButton.indicatorAlignment = .Left
        loadingButton.loadingText = "正在检测"
       // loadingButton.indicatorColor = .green
        loadingButton.addTarget(self, action:#selector(click(_:)), for:.touchUpInside)
        view.addSubview(loadingButton)
       

    }
    
      /// 点击事件
       @objc func click(_ button:UIButton){
        loadingButton.loading = true
       
//        延时代码有问题
//        let delay = DispatchTime.init(uptimeNanoseconds:UInt64(5.0))
//         DispatchQueue.main.asyncAfter(deadline: delay) {
//            DispatchQueue.main.async {
//                self.loadingButton.loading = false
//
//            }
//         }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()  + 5.0) {
             self.loadingButton.loading = false
        }
       
    }
       


}
