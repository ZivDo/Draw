//
//  ViewController.m
//  Draw
//
//  Created by Du Zichen on 13-4-3.
//  Copyright (c) 2013年 Du Zichen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    paint = [[Paint alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
    
    [paint setBackgroundColor:[UIColor clearColor]];
    
    [self.view addSubview:paint];
    
    
    UIButton *scaleBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [scaleBtn setFrame:CGRectMake(0, 0, 20, 20)];
    [scaleBtn setTitle:@"Scale" forState:UIControlStateNormal];
    [scaleBtn addTarget:self action:@selector(scaleAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scaleBtn];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    beganPoint = [touch locationInView:paint];
    
    [paint receiveColor:0];
    [paint receiveWidth:2];
    [paint initAllPoint];
    [paint receiveLine:beganPoint];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    NSArray *movePointArray = [touches allObjects];
    movePoint = [[movePointArray objectAtIndex:0] locationInView:paint];
    [paint receiveLine:movePoint];
    [paint setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{

}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [paint receiveLine];
    [paint setNeedsDisplay];
}

- (void)scaleAction{
    [paint paintScale];
}

@end
