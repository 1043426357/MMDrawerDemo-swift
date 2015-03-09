//
//  RightViewCell.swift
//  SliderDemo
//
//  Created by 余新闻 on 14-12-16.
//  Copyright (c) 2014年 Adways. All rights reserved.
//

import UIKit

class RightViewCell: UITableViewCell {

    var array:Array<String> = []
    var number:Int = 0
    var label:UILabel = UILabel()
    
    func initWithSubView(array:Array<String>,number:Int) ->RightViewCell
    {
        self.number = number
        self.array = array
        self.configure()
        return self
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    func configure()
    {
        label.frame = CGRectMake(90, 10, 100, 30)
        self.contentView.addSubview(label)
        label.textAlignment = .Right
        label.text = self.array[number]
        label.textColor = UIColor.redColor()
        
    }
    override func layoutSubviews() {

    }
    override func drawRect(rect: CGRect)
    {
        var context = UIGraphicsGetCurrentContext()
        var pointOne = CGPointMake(0, 59)
        var pointTwo = CGPointMake(200, 59)
        var array:Array<CGPoint> = [pointOne,pointTwo]
        CGContextAddLines(context, array, 2)
        CGContextSetLineWidth(context, 0.1)
        CGContextSetFillColorWithColor(context, UIColor.whiteColor().CGColor)
        CGContextDrawPath(context, kCGPathStroke)
    }

}
