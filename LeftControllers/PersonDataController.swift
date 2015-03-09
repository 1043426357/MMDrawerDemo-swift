//
//  PersonDataController.swift
//  SliderDemo
//
//  Created by 余新闻 on 14-12-16.
//  Copyright (c) 2014年 Adways. All rights reserved.
//

import UIKit

class PersonDataController: UIViewController {

   
    override func viewWillAppear(animated: Bool) {
        
        self.mm_drawerController.setEnableGesture(false)
        self.navigationController?.navigationBar.hidden = true
    }
    override func viewWillDisappear(animated: Bool) {
         self.navigationController?.navigationBar.hidden = false
    }
    override func viewDidDisappear(animated: Bool)
    {
        var app:AppDelegate  = UIApplication.sharedApplication().delegate as AppDelegate
        var ddrawerConreoller:MMDrawerController = app.window?.rootViewController as MMDrawerController
        var center:UITabBarController = ddrawerConreoller.centerViewController as UITabBarController
        center.tabBar.hidden = false
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "个人资料"
        self.view.backgroundColor = UIColor.redColor()
        
        var button:UIButton = UIButton()
        button.frame = CGRectMake(10, 30, 44, 44)
        button.setTitle("返回", forState: .Normal)
        button.addTarget(self, action: "insteadBack", forControlEvents:UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func insteadBack()
    {
        //顺序不可颠倒
        self.mm_drawerController.toggleDrawerSide(.Left, animated: true, completion: nil)
        self.navigationController?.popViewControllerAnimated(false)
    }
    
}
