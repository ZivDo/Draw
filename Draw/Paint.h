//
//  Paint.h
//  Draw
//
//  Created by Du Zichen on 13-4-3.
//  Copyright (c) 2013年 Du Zichen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Paint : UIView{
//    float x;
//    float y;
    
    int segmentColor;
    int segmentWidth;
    CGColorRef CG_SegmentColor;
    
    NSMutableArray *allPoint;
    NSMutableArray *allLine;
    NSMutableArray *allColor;
    NSMutableArray *allWidth;
    
    
    CGContextRef context;
}

//@property float x;
//@property float y;

- (void)initAllPoint;

- (void)receiveLine;

- (void)receiveLine:(CGPoint) point;

- (void)receiveColor:(int) color;

- (void)receiveWidth:(int) width;

- (void)allLineClear;

- (void)lineFinallyRemove;

//Action
- (void)paintScale;

@end
