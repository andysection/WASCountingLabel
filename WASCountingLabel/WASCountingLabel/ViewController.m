//
//  ViewController.m
//  WASCountingLabel
//
//  Created by 王璋杰 on 17/1/16.
//  Copyright © 2017年 sec. All rights reserved.
//

#import "ViewController.h"
#import "WASLabel.h"

@interface ViewController ()

@end

@implementation ViewController{
    WASLabel *_label;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    WASLabel *label = [[WASLabel alloc] init];
    label.textColor = [UIColor redColor];
    label.font = [UIFont boldSystemFontOfSize:34];
    label.text = @"0.00";
    [label sizeToFit];
    label.center = self.view.center;
    [self.view addSubview:label];
    _label =  label;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(180, 500, 50, 50);
    [btn addTarget:self  action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)Click:(UIButton *)sender{
    
    [_label makeAnimaionWithStartValue:0 EndValue:9.88 Duration:1];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
