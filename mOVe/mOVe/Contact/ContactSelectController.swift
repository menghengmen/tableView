//
//  ContactSelectController.swift
//  mOVe
//
//  Created by 哈哈 on 2022/6/13.
//  Copyright © 2022 MengHeng. All rights reserved.
//

import UIKit
import ContactsUI

class ContactSelectController: UIViewController ,CNContactPickerDelegate,CNContactViewControllerDelegate{
    var selectBnt:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        selectBnt = UIButton(frame: CGRect(x: 10, y: 50, width: 100, height: 100));
        selectBnt.setTitle("选择联系人", for: .normal)
        selectBnt.setTitleColor(.red, for: .normal)
        selectBnt.addTarget(self, action:#selector(click(_:)), for:.touchUpInside)
        view.addSubview(selectBnt)



    }
    
    /// 点击事件
    @objc func click(_ button:UIButton){
       let contUI = CNContactPickerViewController.init();
       contUI.delegate = self;
       self.present(contUI, animated: true, completion: nil);
       CNContactStore.authorizationStatus(for: CNEntityType.contacts);
    }
    

    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        for cont in contacts {
            var userDic:Dictionary<String,Any> = Dictionary();
            
           let name = String.init(format: "%@%@", cont.familyName,cont.givenName);
            userDic["name"] = name;
            let organ = cont.organizationName;
            if cont.imageData != nil{
                let img = UIImage.init(data: cont.imageData!);
                userDic["image"] = img;
            }
            userDic["organ"] = organ;
            
            let phoneNumberStr = (cont.phoneNumbers[0].value as! CNPhoneNumber ).value(forKey: "digits") as! String
         selectBnt.setTitle(phoneNumberStr, for: .normal)
            
        }
        
        

    }
}
