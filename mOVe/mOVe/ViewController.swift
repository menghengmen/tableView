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
    // 绑定过Wechat的
    var bindWechatDeviceArr: Array<MHDeviceModel>?
    // 全部支持Wechat的设备
    var allWechatDeviceArr: Array<MHDeviceModel>?
    // 本账号连接过的蓝牙设备
    var allConnectedDeviceArr: Array<MHDeviceModel>?
    
    // 匹配名字
    func predicateName(name: String) -> Bool{
       let predicateStr = "^("
       let predicate =  NSPredicate(format: "SELF MATCHES %@" ,predicateStr)
       return predicate.evaluate(with: name)
    }
    

    //数组转json
    func getJSONStringFromArray(array:Array<Any>) -> String {
           
           if (!JSONSerialization.isValidJSONObject(array)) {
               print("无法解析出JSONString")
               return ""
           }
           
        let data : NSData! = try? JSONSerialization.data(withJSONObject: array, options: []) as NSData?
           let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
           return JSONString! as String
           
    }
   
    // 从其他应用回来
    @objc func applicationDidBecomeActive(notification: NSNotification) {
        let str = UIPasteboard.general.string
        print("其他应用复制的内容为\(str)")
       }
    
    // 判断数组是否升序
    public func isSorted(arr:Array<Int>) ->Bool {
        if arr.count <= 1 {
            return true
        }
        var isBig = false
        for i in 1...arr.count - 1  {
            if arr[i - 1] < arr[i]{
              isBig = true
           } else {
              isBig = false
            }
           
        }
        return isBig
    }
    
  func configData() {
       let device1 = MHDeviceModel()
       device1.devId = "qwert65565"
       device1.devName = "Earbuds 2SE"
       allConnectedDeviceArr?.append(device1)
   
       let device2 = MHDeviceModel()
       device2.devId = "qwert65565456"
       device1.devName = "Earbuds 3pro"
       allConnectedDeviceArr?.append(device1)
       
       let device3 = MHDeviceModel()
       device3.devId = "qwert65565456"
       device3.devName = "Earbuds 3pro"
       device3.boundStatus = "1"// 已绑定
       allWechatDeviceArr?.append(device1)
       
       let device4 = MHDeviceModel()
       device4.devId = "qwert65565456"
       device4.devName = "Airbuds"
       device4.boundStatus = "0"// 未绑定
       allWechatDeviceArr?.append(device4)
    }

       // 是否跳转
       func isEnablePush() -> Bool {
          var connectArrIds = Array<String>()
          for connectModel in allConnectedDeviceArr ?? [MHDeviceModel]() {
              connectArrIds.append(connectModel.devId ?? "")
          }
        
           
           return true
       }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)

        let millisecond = Date().milliStamp
        print("当前毫秒级时间戳是 millisecond == ",millisecond)
        let timestamp = Date().timestamp
        print("当前秒级时间戳是 timestamp == ",timestamp)
        
        
        // 判断数组是否升序
        let arr1 = Array<Int>()
        let isSorted = self.isSorted(arr: arr1)
        
        
        
        var arr = Array<Any>()
         for i in 0...3 {
            let productMoel = ProductModel()
            productMoel.nameRegex = "123"
            productMoel.title = "哈哈"
            arr.append(productMoel)
        }
//        let jsonStr = getJSONStringFromArray(array: arr)
//
//
//        // 读取本地plist文件
//        let path = Bundle.main.path(forResource: "addStoreIthatLetterModel", ofType: "json")
//        let url = URL(fileURLWithPath: path!)
//
//        do {
//
//                let data = try Data(contentsOf: url)
//                let jsonData:Any = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
//                let jsonDict = jsonData as! NSDictionary
//            let title = jsonDict["title"]
//            let cusomtSectionView = jsonDict["cusomtSectionView"]
//            let footerHeight = jsonDict["footerHeight"]
//
//            let contentArray = jsonDict["content"] as! Array<Any>
//            for contentDict  in contentArray{
//                print(contentDict)
//
//                let model = ProductModel()
//                model.nameRegex = (contentDict as! Dictionary<String, Any>) ["nameRegex"] as? String
//                model.title = (contentDict as! Dictionary<String, Any>) ["title"] as? String
//                model.cellClass = (contentDict as! Dictionary<String, Any>) ["cellClass"] as? String
//              }
//             let isTrue  = predicateName(name: "Otter")
//             print("\(isTrue)")
//
//        } catch let error as Error? {
//                print("读取本地数据出现错误!",error)
//        }

        
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
        self.view.addSubview(tableView!)
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
    func configData()  -> Array<MHRoomModel>{
          var roomList = Array<MHRoomModel>()
        
          let room1 = MHRoomModel()
          room1.roomName = "卧室"
          room1.sort = "3"
          room1.devList = ["",""]
          roomList.append(room1)
          
          
          let room2 = MHRoomModel()
          room2.roomName = "厨房"
          room2.sort = "5"
          room2.devList = [""]
          roomList.append(room2)
          
        let room3 = MHRoomModel()
        room3.roomName = "卫生间"
        room3.sort = "8"
        room3.devList = [""]
        roomList.append(room3)
          
          
          let room4 = MHRoomModel()
          room4.roomName = "共享房间"
          room4.sort = "share"
          room4.devList = ["","","",""]
          roomList.append(room4)
        
        let room5 = MHRoomModel()
         room5.roomName = "个人"
         room5.sort = "personal"
         room5.devList = ["","","",""]
         roomList.append(room5)
        
          // 根据reportSetting 排序
          var sortedArr = Array<MHRoomModel>()// 排序后的数组
        
         let roomSetting = "share,personal,12,13,5,3,8"
        
         let sortArrayStr = roomSetting.components(separatedBy: ",")
         for sortItem in sortArrayStr {
            for originalRoom in roomList {
                if sortItem == originalRoom.sort {
                    sortedArr.append(originalRoom)
                }
               
             }
         }

       
        
        for originalRoom in roomList {
            // room没有在sortSetting
            if !sortArrayStr.contains(originalRoom.sort ?? "0") {
                sortedArr.append(originalRoom)
             }
        }
        
        
        return sortedArr
          
      }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let moveVC = MoveCellViewController()
         moveVC.roomList = configData()
         moveVC.modalPresentationStyle = .fullScreen
         self.present(moveVC, animated: true, completion: nil)
        
        
//        if indexPath.row == 2 { /// 秒杀倒计时
//            let moveVC = TimerViewController()
//            moveVC.modalPresentationStyle = .fullScreen
//            self.present(moveVC, animated: true, completion: nil)
//        } else if (indexPath.row == 3){
//            let selectVC = ContactSelectController()
//            selectVC.modalPresentationStyle = .fullScreen
//            self.present(selectVC, animated: true, completion: nil)
//        } else if (indexPath.row == 4){
//            let selectVC = LoadingButtonDemoVC()
//            selectVC.modalPresentationStyle = .fullScreen
//            self.present(selectVC, animated: true, completion: nil)
//        } else {
//
//            if self.progressView?.progress ?? 0 <= CGFloat(1.0) {
//                self.progressView?.progress  += 0.1
//
//            }
//        }
        
        
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
