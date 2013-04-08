//
//  ViewController.h
//  Draw
//
//  Created by Du Zichen on 13-4-3.
//  Copyright (c) 2013年 Du Zichen. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Paint.h"

#import "PaintWebView.h"

@interface ViewController : UIViewController{
    CGPoint beganPoint;
    CGPoint movePoint;
    
    Paint *paint;
}

@end
