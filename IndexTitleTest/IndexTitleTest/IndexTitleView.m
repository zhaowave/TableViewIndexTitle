//
//  IndexTitleView.m
//  IndexTitleTest
//
//  Created by wei zhao on 2017/6/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "IndexTitleView.h"

#define zWINDOW_HEIGHT  [UIScreen mainScreen].bounds.size.height
#define zWINDOW_WIDTH  [UIScreen mainScreen].bounds.size.width
@interface IndexTitleView () {
    NSArray *_indexTitleArray;
    int _ifontSize;
    float _labelHeight;
    int _firstSection;
}
@end
@implementation IndexTitleView


- (instancetype) initWithTitleArray:(NSArray*)indexTitleArray andFont:(int)fontSize{
    self = [super init];
    _ifontSize = fontSize;
    _indexTitleArray = indexTitleArray;
    self.backgroundColor = [UIColor clearColor];
    self.userInteractionEnabled = YES;
    //
    self.frame = CGRectMake(zWINDOW_WIDTH - 20-2, 0 + 44, 20, zWINDOW_HEIGHT);
    
    NSString *content = @"A";
    CGSize size =[content sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_ifontSize]}];
    
    _labelHeight = size.height;//(HEIGHT - 66)/_indexTitleArray.count;
    
    int gapH = (zWINDOW_HEIGHT - 44 - _labelHeight * _indexTitleArray.count)/2;
    
    for (int i  = 0;i<_indexTitleArray.count; i++) {
        UILabel *aaaa = [UILabel new];
        aaaa.frame = CGRectMake(0, gapH + i * _labelHeight, _labelHeight, _labelHeight);
        aaaa.text = [_indexTitleArray objectAtIndex:i];
        aaaa.font = [UIFont systemFontOfSize:_ifontSize];
        aaaa.textColor = [UIColor grayColor];
        [self addSubview:aaaa];
    }
    return self;
}


- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //NSLog(@"touchesBegan");
    [self gestureAction:touches];
//    return;
//    UITouch * touch = touches.anyObject;
//    float y = [touch locationInView:self].y - (zWINDOW_HEIGHT - _labelHeight * _indexTitleArray.count)/2;
//    int sec = y/_labelHeight;
//    if (sec >= _indexTitleArray.count || sec < 0) {
//        return;
//    }
//    if (_firstSection == sec) {
//        return;
//    }
//    _firstSection = sec;
//    //NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:sec];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [_delegate scrollToSection:sec];
//        //AudioServicesPlaySystemSound(1519);
//
//    });
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
    [self gestureAction:touches];
}

- (void) gestureAction:(NSSet<UITouch *> *)touches {
    UITouch * touch = touches.anyObject;
    float y = [touch locationInView:self].y - (zWINDOW_HEIGHT - 44 - _labelHeight * _indexTitleArray.count)/2;
    
    int sec = y/_labelHeight;
    if (sec >= _indexTitleArray.count || sec < 0) {
        return;
    }
    if (_firstSection == sec) {
        return;
    }
    _firstSection = sec;
    
    //NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:sec];
    [_delegate scrollToSection:sec];
}

@end
