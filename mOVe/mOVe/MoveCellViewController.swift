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

    override func viewDidLoad() {
        super.viewDidLoad()

//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.frame = CGRect(x: 20, y: 0, width: self.view.bounds.size.width - 40, height: self.view.bounds.size.height)
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "SwiftCell")

        tableView.allowsSelection = false
        tableView.reorder.delegate = self
        tableView.rowHeight = 100
    }

}

extension MoveCellViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let spacer = tableView.reorder.spacerCell(for: indexPath) {
            return spacer
        }
        
        let cell :CustomTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "SwiftCell", for: indexPath) as! CustomTableViewCell
       // cell.textLabel?.text = items[indexPath.row]
        cell.numberEquipLabel.text = "\(items[indexPath.row]) 个设备"
         return cell
    }
    
}

extension MoveCellViewController: TableViewReorderDelegate {

    func tableView(_ tableView: UITableView, reorderRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = items[sourceIndexPath.row]
        items.remove(at: sourceIndexPath.row)
        items.insert(item, at: destinationIndexPath.row)
    }
    
}

