//
//  PaintWebView.h
//  Draw
//
//  Created by Du Zichen on 13-4-7.
//  Copyright (c) 2013年 Du Zichen. All rights reserved.
//

#import "Paint.h"

@interface PaintWebView : UIWebView{
    //    float x;
    //    float y;
    
    int segmentColor;
    int segmentWidth;
    CGColorRef CG_SegmentColor;
    
    NSMutableArray *allPoint;
    NSMutableArray *allLine;
    NSMutableArray *allColor;
    NSMutableArray *allWidth;
    
    
    CGImageRef imageRef;
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

@end
