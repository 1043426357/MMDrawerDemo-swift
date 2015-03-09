//
//  RightViewController.swift
//  SliderDemo
//
//  Created by 新闻 on 14-12-12.
//  Copyright (c) 2014年 Adways. All rights reserved.
//

import UIKit

class RightViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{

    @IBOutlet weak var tableView: UITableView!
    
    
    var array:Array<String> = ["个人资料","考勤记录","考勤设置","二维码扫描","外出会议","打卡设置","考勤通知","相关设置","添加员工","删除缓存","更换号码","更多设置"]

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "右侧栏"
        self.view.backgroundColor = UIColor.grayColor()
        self.navigationController?.navigationBar.barTintColor = UIColor.whiteColor()
        
        var imageView = UIImageView(image: UIImage(named: "backGround@2x.jpg"))
        self.tableView.backgroundView = imageView
        self.tableView.alpha = 0.7
        self.tableView.separatorStyle = .None
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellID = "MyCellID"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? RightViewCell
        if cell==nil
        {
            cell = RightViewCell().initWithSubView(self.array, number: indexPath.row) as RightViewCell
        }
        cell?.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        return cell!
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        var person = PersonDataController()
        
        var app:AppDelegate  = UIApplication.sharedApplication().delegate as AppDelegate
        var ddrawerConreoller:MMDrawerController = app.window?.rootViewController as MMDrawerController
        var center:UITabBarController = ddrawerConreoller.centerViewController as UITabBarController
        var nav:UINavigationController = center.viewControllers![0] as UINavigationController
        
        center.tabBar.hidden = true
        ddrawerConreoller.closeDrawerAnimated(false, completion: nil)
        nav.pushViewController(person, animated: true)
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }


}
