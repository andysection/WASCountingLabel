//
//  WASLabel.m
//  WASCountingLabel
//
//  Created by 王璋杰 on 17/1/16.
//  Copyright © 2017年 sec. All rights reserved.
//

#import "WASLabel.h"

static NSInteger Sepreator = 25;

@implementation WASLabel{
    CGFloat _aimValue;
    CGFloat _endValue;
    CGFloat _plusNum;
    NSTimer *_timer;
    NSInteger i ;
    NSTimeInterval _t;
}

- (void)makeAnimaionWithStartValue:(CGFloat)startValue EndValue:(CGFloat)EndValue Duration:(double)Duration{
    _aimValue = startValue;
    _endValue = EndValue;
    _plusNum = (EndValue - startValue)/ Sepreator;
    CGFloat secondOfPerChange =(Duration / Sepreator);
    
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:secondOfPerChange target:self selector:@selector(StartValuePlusNumSet) userInfo:nil repeats:YES];
    
    // 将定时器加入主运行循环
    _t = CACurrentMediaTime();
    NSLog(@"start!");
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
}

- (void)StartValuePlusNumSet{
    i++;
//    NSLog(@"%zd",i);
    self.text = [NSString stringWithFormat:@"%.2f",_aimValue];
    [self sizeToFit];
    _aimValue= _aimValue + _plusNum;
    if (_aimValue > _endValue) {
        //时间停止
        [_timer invalidate];
        NSLog(@"%.f",CACurrentMediaTime() - _t);
    }
    
}



@end
