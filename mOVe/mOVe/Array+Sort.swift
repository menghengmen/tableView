//
//  Array+Sort.swift
//  mOVe
//
//  Created by 哈哈 on 2022/9/28.
//  Copyright © 2022 MengHeng. All rights reserved.
//

import Foundation

extension Array {

    func isSorted123(isorderedBefore: (Int,Int) -> Bool) -> Bool {
             for i in 1..<self.count {
                if !isorderedBefore(self[i-1] as! Int,self[i] as! Int) {
                     return false
                 }
             }
             return true
      }
//    
//    var isSorted456: Bool {
//        for i in 1...self.count {
//         if self[i-1] > self[i] { return false }
//            
//       }
//       return true
//     }

}
