//
//  LoadingButton.swift
//  Pods
//
//  Created by Septiyan Andika on 6/26/16.
//
//

import UIKit

public enum ActivityIndicatorAlignment: Int {
    case Left
    case Right
    
}

public class LoadingButton: UIButton {
    
    var activityIndicatorView:UIActivityIndicatorView!

    
    public var indicatorAlignment:ActivityIndicatorAlignment = ActivityIndicatorAlignment.Right {
        didSet {
        }
    }
    
    
    public var loading:Bool = false {
        didSet {
            realoadView()
        }
    }
    
    public var indicatorColor:UIColor = UIColor.lightGray {
        didSet {
            activityIndicatorView.color = indicatorColor
        }
    }
    
    public var normalText:String? = nil {
        didSet {
            if(normalText == nil){
                normalText = self.titleLabel?.text
            }
            
            self.titleLabel?.text = normalText
        }
    }
    
    public var loadingText:String? = "Please Wait"
    
    
    required  public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
        if normalText == nil{
            normalText = title
        }
    }
    
    
    func setupView() {
       // activityIndicatorView.hidesWhenStopped = true;
        self.normalText = self.titleLabel?.text
       
        activityIndicatorView = UIActivityIndicatorView(style:UIActivityIndicatorView.Style.large)
        activityIndicatorView.frame = CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height)
       // activityIndicatorView.center = self.center
       // activityIndicatorView.color = .black
        self.addSubview(activityIndicatorView)
    }
    
    func realoadView() {
        if(loading){
            self.isEnabled = false
            activityIndicatorView.isHidden = false;
            activityIndicatorView.startAnimating()
            if(self.loadingText != nil ){
                self.setTitle(loadingText, for: .normal)
                
            }
        }else{
            self.isEnabled = true
            activityIndicatorView.stopAnimating()
            self.setTitle(normalText, for: .normal)
            
        }
        
    }
    
    
    deinit {
        activityIndicatorView.removeFromSuperview()
    }
    
   
    
}
