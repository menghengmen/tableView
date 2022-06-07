//
//  AlamofireDemoVC.swift
//  mOVe
//
//  Created by 哈哈 on 2022/6/6.
//  Copyright © 2022 MengHeng. All rights reserved.
//

import UIKit

class AlamofireDemoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let parameters : [String : Any] = [
                   "name": "mengheng"]
               
        let URL = "https://5bloh8cd4j.execute-api.ap-southeast-1.amazonaws.com/dev/v1/inbistro/create"

//       Alamofire.request(URL, method: .post, parameters: parameters) .responseJSON { response in
//                  switch response.result {
//                  case .failure(let error) :
//                      print(error.localizedDescription)
//                      break
//                  case .success(let data):
//                      print("success \(data)")
//                      if let responseNames = Mapper<ResponseName>().map(JSONObject: data){
//                          if (responseNames.errorResponse?.code == 200){
//                              let alert = UIAlertController(title: "Add Content", message: "Success", preferredStyle: .alert)
//                              alert.addAction(UIAlertAction(title: "Back to Main", style: .cancel, handler: { (action) -> Void in
//                                  self.addPostViewControllerDelegate?.reloadPlease(reloadPlease: true)
//                                  self.navigationController?.popViewController(animated: true)
//                              }))
//                              self.present(alert, animated: true, completion: nil)
//                          } else {
//                              let alert = UIAlertController(title: "Add Content", message: "Failed", preferredStyle: .alert)
//                              alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) -> Void in
//                              }))
//                              self.present(alert, animated: true, completion: nil)
//                          }
//                      }
//                      break
//                  }
//              }
    }
    
/// 产考 https://www.it610.com/article/1490225325525721088.htm
   

}
