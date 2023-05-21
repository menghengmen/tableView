//
//  MoveCellViewController.swift
//  mOVe
//
//  Created by 哈哈 on 2022/5/21.
//  Copyright © 2022 MengHeng. All rights reserved.
//

import UIKit

class MoveCellViewController: UITableViewController {
    var items = (1...10).map { "\($0)" }
    
    var roomList: Array<MHRoomModel>?
  

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.frame = CGRect(x: 20, y: 0, width: self.view.bounds.size.width - 40, height: self.view.bounds.size.height)
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "SwiftCell")
        tableView.allowsSelection = false
        tableView.reorder.delegate = self
        tableView.rowHeight = 100
        
        let selectBnt = UIButton(frame: CGRect(x: 10, y: 50, width: 100, height: 100));
        selectBnt.setTitle("确定排序", for: .normal)
        selectBnt.setTitleColor(.red, for: .normal)
        selectBnt.addTarget(self, action:#selector(click(_:)), for:.touchUpInside)
        view.addSubview(selectBnt)
    }
    
 
    
    /// 点击事件
    @objc func click(_ button:UIButton){
        
        var sort = ""
//        for room in roomList ?? [] {
//            sort.append(",\(room.sort ?? "")")
//        }
        for i in 0...roomList!.count - 1 {
            let room = roomList?[i]
            if i == 0 {
                sort.append("\(room?.sort ?? "")")
            } else {
                sort.append(",\(room?.sort ?? "")")

            }
        }
        
        let dict = ["sortSetting":sort]
    }
    
    
  

}

extension MoveCellViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roomList?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let spacer = tableView.reorder.spacerCell(for: indexPath) {
            return spacer
        }
        
        let cell :CustomTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "SwiftCell", for: indexPath) as! CustomTableViewCell
       // cell.textLabel?.text = items[indexPath.row]
       // cell.numberEquipLabel.text = "\(items[indexPath.row]) 个设备"
        cell.roomModel = roomList?[indexPath.row]
        return cell
    }
    
}

extension MoveCellViewController: TableViewReorderDelegate {

    func tableView(_ tableView: UITableView, reorderRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = roomList?[sourceIndexPath.row]
        roomList?.remove(at:  sourceIndexPath.row)
        roomList?.insert(item ?? MHRoomModel(), at: destinationIndexPath.row)
    }
    
}

