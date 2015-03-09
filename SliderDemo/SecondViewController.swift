//
//  SecondViewController.swift
//  SliderDemo
//
//  Created by 余新闻 on 14-12-15.
//  Copyright (c) 2014年 Adways. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

   
    override func viewWillAppear(animated: Bool) {
      self.mm_drawerController.setEnableGesture(false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
