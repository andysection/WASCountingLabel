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
    
    NSInteger _intAim;
    NSInteger _intStart;
    NSInteger _intEnd;
}

- (void)makeAnimaionWithStartValue:(CGFloat)startValue EndValue:(CGFloat)EndValue Duration:(double)Duration{
    _aimValue = startValue;
    _endValue = EndValue;
    _plusNum = (EndValue - startValue)/ Sepreator;
    CGFloat secondOfPerChange =(Duration / Sepreator);
    i = 0;
    
    [_timer invalidate];
    _timer = [NSTimer scheduledTimerWithTimeInterval:secondOfPerChange target:self selector:@selector(StartValuePlusNumSet) userInfo:nil repeats:YES];
    
    // 将定时器加入主运行循环
    _t = CACurrentMediaTime();
    NSLog(@"start!");
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    
}

- (void)StartValuePlusNumSet{
    i++;
    NSLog(@"%zd,start: %.2f end: %.2f",i,_aimValue,_endValue);
    self.text = [NSString stringWithFormat:@"%.2f",_aimValue];
    [self sizeToFit];
    _aimValue= _aimValue + _plusNum;
    if (_aimValue > _endValue) {
        //时间停止
        self.text = [NSString stringWithFormat:@"%.2f",_endValue];
        [_timer invalidate];
        NSLog(@"%.f",CACurrentMediaTime() - _t);
    }
    
}

- (void)AnimaionWithIntegerStartValue:(NSInteger)startValue EndValue:(NSInteger)EndValue Duration:(double)Duration{
    if (startValue == EndValue) {
        return;
    }
    
    _intStart = startValue;
    _intEnd = EndValue;
    _plusNum = (EndValue - startValue)/ Sepreator;
    CGFloat secondOfPerChange =(Duration / Sepreator);
    i = 0;
    
    [_timer invalidate];
    _timer = [NSTimer scheduledTimerWithTimeInterval:secondOfPerChange target:self selector:@selector(StartIntegerValuePlusNumSet) userInfo:nil repeats:YES];
    
    // 将定时器加入主运行循环
    _t = CACurrentMediaTime();
    NSLog(@"start!");
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)StartIntegerValuePlusNumSet{
    i++;
    NSLog(@"%zd,start: %zd end: %zd",i,_intAim,_intEnd);
    self.text = [NSString stringWithFormat:@"%zd",_intAim];
    [self sizeToFit];
    _intAim= _intAim + (NSInteger)_plusNum;
    if (_intAim > _intEnd) {
        //时间停止
        self.text = [NSString stringWithFormat:@"%zd",_intEnd];
        [_timer invalidate];
        NSLog(@"%.f",CACurrentMediaTime() - _t);
    }
    
}

@end
