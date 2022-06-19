//
//  ViewController.swift
//  mOVe
//
//  Created by 哈哈 on 2022/5/20.
//  Copyright © 2022 MengHeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,
UITableViewDataSource,UIGestureRecognizerDelegate {
    
    var tableView:UITableView?
    var progressView: MHProgressView?
    var ctrlnames:[String] = ["UILabel 标签","UIButton 按钮","UIDatePiker 日期选择器",
                              "通讯录选择视图","123"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建表视图
        self.tableView = UITableView(frame: self.view.frame,
                                     style:.plain)
        self.view.backgroundColor = .lightGray
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        self.tableView?.rowHeight = 100
        //创建一个重用的单元格
      //  self.tableView!.register(UITableViewCell.self, forCellReuseIdentifier: "SwiftCell")
        
        self.tableView?.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "SwiftCell")
        self.view.addSubview(self.tableView!)
        
        //绑定对长按的响应
        let longPress =  UILongPressGestureRecognizer(target:self,
                                                      action:#selector(tableviewCellLongPressed(gestureRecognizer:)))
        //代理
        longPress.delegate = self
        longPress.minimumPressDuration = 1.0
        //将长按手势添加到需要实现长按操作的视图里
        self.tableView!.addGestureRecognizer(longPress)
        
        let view = MHProgressView(frame: CGRect(x: 40, y: 40, width: 200, height: 40))
        view.progressStokeWidth = 1.0
        view.progressBackgroundColor = .clear
        view.progressColor = .clear
        view.progressStokeBackgroundColor = .gray
        self.progressView = view
        self.view.addSubview(view)
    }
    
    //在本例中，只有一个分区
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //返回表格行数（也就是返回控件数）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.ctrlnames.count
    }
    
    //创建各单元显示内容(创建参数indexPath指定的单元）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            //为了提供表格显示性能，已创建完成的单元需重复使用
//            let identify:String = "SwiftCell"
//            //同一形式的单元格重复使用，在声明时已注册
//            let cell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath)
//    as UITableViewCell
//            cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
//            cell.textLabel?.text = self.ctrlnames[indexPath.row]
//            return cell
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwiftCell", for: indexPath)
            return cell
    }
    
    //长按表格
    @objc func tableviewCellLongPressed(gestureRecognizer:UILongPressGestureRecognizer)
    {
        if (gestureRecognizer.state == UIGestureRecognizer.State.ended)
        {
            print("UIGestureRecognizerStateEnded")
            //在正常状态和编辑状态之间切换
            if(self.tableView!.isEditing == false){
                self.tableView!.setEditing(true, animated:true)
            }
            else{
                self.tableView!.setEditing(false, animated:true)
            }
        }
    }

    //在编辑状态，可以拖动设置cell位置
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if indexPath.row == 2 { /// 秒杀倒计时
            let moveVC = TimerViewController()
            moveVC.modalPresentationStyle = .fullScreen
            self.present(moveVC, animated: true, completion: nil)
        } else if (indexPath.row == 3){
            let selectVC = ContactSelectController()
            selectVC.modalPresentationStyle = .fullScreen
            self.present(selectVC, animated: true, completion: nil)
        } else if (indexPath.row == 4){
            let selectVC = LoadingButtonDemoVC()
            selectVC.modalPresentationStyle = .fullScreen
            self.present(selectVC, animated: true, completion: nil)
        } else {

            if self.progressView?.progress ?? 0 <= CGFloat(1.0) {
                self.progressView?.progress  += 0.1

            }
        }
        
        
    }
    
    //移动cell事件
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath,
                   to destinationIndexPath: IndexPath) {
        if sourceIndexPath != destinationIndexPath{
            //获取移动行对应的值
            let itemValue:String = ctrlnames[sourceIndexPath.row]
            //删除移动的值
            ctrlnames.remove(at: sourceIndexPath.row)
            //如果移动区域大于现有行数，直接在最后添加移动的值
            if destinationIndexPath.row > ctrlnames.count{
                ctrlnames.append(itemValue)
            }else{
                //没有超过最大行数，则在目标位置添加刚才删除的值
                ctrlnames.insert(itemValue, at:destinationIndexPath.row)
            }
        }
    }
}
