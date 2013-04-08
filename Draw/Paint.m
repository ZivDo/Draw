//
//  Paint.m
//  Draw
//
//  Created by Du Zichen on 13-4-3.
//  Copyright (c) 2013年 Du Zichen. All rights reserved.
//

#import "Paint.h"

@implementation Paint

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        CG_SegmentColor = [[UIColor darkGrayColor] CGColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    context = UIGraphicsGetCurrentContext();
        
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    static BOOL allLineOfBOOL = NO;
    if(!allLineOfBOOL){
        allLine = [[NSMutableArray alloc] init];
        allColor = [[NSMutableArray alloc] init];
        allWidth = [[NSMutableArray alloc] init];
        allLineOfBOOL = !allLineOfBOOL;
    }
    
    if(allLine.count > 0){
        for(int i = 0; i < allLine.count; i++){
            NSArray *tempArray = [NSArray arrayWithArray:[allLine objectAtIndex:i]];
            if(allColor.count > 0){
                segmentColor = [[allColor objectAtIndex:i] intValue];
                segmentWidth = [[allWidth objectAtIndex:i] floatValue] + 1;
            }
            
            if(tempArray.count > 1){
                CGContextBeginPath(context);
                CGPoint startPoint = [[tempArray objectAtIndex:0] CGPointValue];
                CGContextMoveToPoint(context, startPoint.x, startPoint.y);
                
                for(int j = 0; j < tempArray.count - 1; j++){
                    CGPoint endPoint = [[tempArray objectAtIndex:j+1] CGPointValue];

                    CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
                }
    
                //设置画笔颜色
                CGContextSetStrokeColorWithColor(context, CG_SegmentColor);
                //设置画笔粗细
                CGContextSetLineWidth(context, segmentWidth);
                CGContextStrokePath(context);
            }
        }
    }

    if(allPoint.count > 1){
        CGContextBeginPath(context);
        
        CGPoint startPoint = [[allPoint objectAtIndex:0] CGPointValue];
        CGContextMoveToPoint(context, startPoint.x, startPoint.y);
        
        for(int i = 0; i < allPoint.count - 1; i++){
            CGPoint endPoint = [[allPoint objectAtIndex:i + 1] CGPointValue];
            CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
        }
        
        segmentColor = [[allColor lastObject] intValue];
        segmentWidth = [[allWidth lastObject] floatValue] + 1;
        
        CGContextSetStrokeColorWithColor(context, CG_SegmentColor);
        CGContextSetFillColorWithColor(context, CG_SegmentColor);
        
        CGContextSetLineWidth(context, segmentWidth);
        
        CGContextStrokePath(context);
    }
    
}


- (void)initAllPoint{
    allPoint = [[NSMutableArray alloc] init];
}

- (void)receiveLine{
    [allLine addObject:allPoint];
}

- (void)receiveLine:(CGPoint) point{
    NSValue *pointValue = [NSValue valueWithCGPoint:point];
    [allPoint addObject:pointValue];
}

- (void)receiveColor:(int) color{
    NSNumber *numberOfColor = [NSNumber numberWithInt:color];
    [allColor addObject:numberOfColor];
}

- (void)receiveWidth:(int) width{
    NSNumber *numberOfWidth = [NSNumber numberWithInt:width];
    [allWidth addObject:numberOfWidth];
}

- (void)allLineClear{
    if(allLine.count > 0){
        [allLine removeAllObjects];
        [allColor removeAllObjects];
        [allWidth removeAllObjects];
        [allPoint removeAllObjects];
        allLine = [[NSMutableArray alloc] init];
        allColor = [[NSMutableArray alloc] init];
        allWidth = [[NSMutableArray alloc] init];
        [self setNeedsDisplay];
    }
}

- (void)lineFinallyRemove{
    if(allLine.count > 0){
        [allLine removeLastObject];
        [allColor removeLastObject];
        [allWidth removeLastObject];
        [allPoint removeAllObjects];
    }
    [self setNeedsDisplay];
}

- (void)paintScale{
    CGContextScaleCTM(context, 2.0, 2.0);
    [self setNeedsDisplay];
}

@end
