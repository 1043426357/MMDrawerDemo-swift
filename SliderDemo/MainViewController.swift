//
//  MainViewController.swift
//  SliderDemo
//
//  Created by 新闻 on 14-12-12.
//  Copyright (c) 2014年 Adways. All rights reserved.
//
import Foundation
import UIKit


class MainViewController: UIViewController,SendValueDelegate
{

    
    override func viewWillAppear(animated: Bool)
    {

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "notificationLeftAction", name: "notificationLeft", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "notificationRightAction", name: "notificationRight", object: nil)
    }
    override func viewDidAppear(animated: Bool) {
         self.mm_drawerController.setEnableGesture(true)
    }
    override func viewWillDisappear(animated: Bool)
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "notification", object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.userInteractionEnabled = true
        self.title = "侧边栏"
        
        self.setUpLeftMenuButton()
        self.setUpRightMenuButton()
        
        self.adGesture()
  
    }
     func setUpLeftMenuButton()
     {
        
         var leftDrawerButton = MMDrawerBarButtonItem(target: self, action: "leftDrawerButtonPress")
         self.navigationItem.leftBarButtonItem = leftDrawerButton
     }
    func setUpRightMenuButton()
    {
        
        var rightDrawerButton = MMDrawerBarButtonItem(target: self, action: "rightDrawerButtonPress")
        self.navigationItem.rightBarButtonItem = rightDrawerButton
    }
    func adGesture()
    {
        var doubleGesture = UITapGestureRecognizer(target: self, action: "doubleTap")
        doubleGesture.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleGesture)
        
        var twoFingerDoubleTap = UITapGestureRecognizer(target: self, action: "twoFingerDoubleTap")
        twoFingerDoubleTap.numberOfTapsRequired = 2
        twoFingerDoubleTap.numberOfTouchesRequired = 2
        self.view.addGestureRecognizer(twoFingerDoubleTap)
        
        var singleTap = UITapGestureRecognizer(target: self, action: "singleTap")
        singleTap.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(singleTap)


    }

    func leftDrawerButtonPress()
     {
        self.mm_drawerController.toggleDrawerSide(.Left, animated: true, completion: nil)
      }
    func rightDrawerButtonPress()
    {
        self.mm_drawerController.toggleDrawerSide(.Right, animated: true, completion: nil)
    }
    func doubleTap()
    {
        self.mm_drawerController.bouncePreviewForDrawerSide(.Left, completion: nil)
    }
    func twoFingerDoubleTap()
    {
        self.mm_drawerController.bouncePreviewForDrawerSide(.Right, completion: nil)
    }
    func singleTap()
    {
        if self.mm_drawerController.openSide == MMDrawerSide.Left||self.mm_drawerController.openSide == MMDrawerSide.Right
        {
            self.mm_drawerController.closeDrawerAnimated(true, completion: nil)
        }
        
    }
   func notificationLeftAction()
    {
        self.leftDrawerButtonPress()
        
    }
    func notificationRightAction()
    {
        self.rightDrawerButtonPress()
    }
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)   //传值
     {
       if segue.identifier == "goNext"
       {
            var viewController = segue.destinationViewController as ThirdViewController
            viewController.delegate = self
            viewController.title = "传值"
            viewController.text = "xyzhhh"
        
            viewController.initWithClosure(sendValueText)
        }
     }
    func sendValue(s: String)                   //代理
    {
        self.title = "不能忍"
    }
    
    func sendValueText(string:String)->Void     //闭包
    {
        var sss = string
        println(sss)
    }
  

}
