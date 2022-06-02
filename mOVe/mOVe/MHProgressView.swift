//
//  MHProgressView.swift
//  mOVe
//
//  Created by 哈哈 on 2022/6/2.
//  Copyright © 2022 MengHeng. All rights reserved.
//

import UIKit

///条形进度条
class MHProgressView: UIView {

    ///设置 进度
    var progress: CGFloat = 0 {
        didSet {
           
         
            
            let margin = self.progressStokeWidth! +  1
            let marginWidth = self.bounds.size.width - 2 * margin
            let height = self.bounds.size.height - 2 * margin
            self.progrssView.frame = CGRect(x: margin, y: margin, width: marginWidth * progress, height: height )
            self.progrssView.backgroundColor = .blue
        }
    
    }
    /// 进度条颜色
    var progressColor : UIColor? {
        didSet{
            self.progrssView.backgroundColor = progressColor
        }
    
    }
    /// 进度条背景颜色
    var progressBackgroundColor :UIColor? {
        didSet{
            borderView.backgroundColor = progressBackgroundColor
        }
        
    }
    /// 进度条边框的颜色
    var progressStokeBackgroundColor : UIColor? {
        didSet{
            borderView.layer.borderColor = progressStokeBackgroundColor?.cgColor
        }
        
    }
    /// 进度条边框的宽度
    var progressStokeWidth: CGFloat? {
        
        didSet{
            borderView.layer.borderWidth = progressStokeWidth ?? 0
        }
    }

    var progrssView = UIView()
    var borderView = UIView()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let borderView = UIView(frame: self.bounds)
        borderView.layer.cornerRadius = self.bounds.size.height / 2
        borderView.layer.masksToBounds = true
        borderView.backgroundColor = .white
        borderView.layer.borderWidth = 2.0
        self.borderView = borderView
        self.addSubview(borderView)
        
        let progrssView = UIView(frame: self.bounds)
         progrssView.layer.cornerRadius = self.bounds.size.height / 2
         progrssView.layer.masksToBounds = true
        progrssView.backgroundColor = .clear
        self.progrssView = progrssView
        self.addSubview(progrssView)
        
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
