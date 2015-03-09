//
//  ThirdViewController.swift
//  SliderDemo
//
//  Created by 余新闻 on 14-12-15.
//  Copyright (c) 2014年 Adways. All rights reserved.
//

import Foundation
import UIKit

typealias sendValueClosure = (string:String)->Void

protocol SendValueDelegate:NSObjectProtocol
{
    func sendValue(s:String)
}

class ThirdViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    
    var myClosure:sendValueClosure?                 //闭包
    func initWithClosure(closure:sendValueClosure)
    {
        myClosure = closure
    }

    
    var text:String = ""                            //代理
    var delegate:SendValueDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mm_drawerController.setEnableGesture(false)
     
        self.button.setTitle(text, forState: .Normal)
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func returnToFirst(sender: UIButton)
    {
        if (self.delegate != nil)
        {
            self.delegate?.sendValue("不能忍")
        }
        self.navigationController?.popViewControllerAnimated(true)
        
        if (myClosure != nil)
        {
            myClosure!(string: "如果可以打造非凡应用")
        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
