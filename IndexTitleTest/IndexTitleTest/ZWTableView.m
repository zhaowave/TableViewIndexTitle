//
//  ZWTableView.m
//  IndexTitleTest
//
//  Created by wei zhao on 2017/6/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "ZWTableView.h"
#import "IndexTitleView.h"

@interface ZWTableView ()<IndexTitleViewDelegate>

@property (nonatomic,strong) IndexTitleView *indexTitleView;
@property (nonatomic) int ifontSize;

@end

@implementation ZWTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        _indexTitleArray = [NSMutableArray new];
        _ifontSize = 16;
    }
    return self;
}

- (void) addIndexTitleView {
    //1.没有数据，删除索引视图
    if (_indexTitleArray.count == 0) {
        [_indexTitleView removeFromSuperview];
        return;
    }
    //2.有数据刷新索引视图
    _indexTitleView = [[IndexTitleView alloc] initWithTitleArray:_indexTitleArray andFont:_ifontSize];
    _indexTitleView.delegate = self;
    [[[UIApplication sharedApplication] keyWindow] addSubview:_indexTitleView];
    
}

-(void) scrollToSection:(int) section {
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:section];
    [self scrollToRowAtIndexPath:indexpath atScrollPosition:UITableViewScrollPositionTop animated:NO];
}
//重写setHidden方法，设置索引视图隐藏属性
- (void) setHidden:(BOOL)hidden {
    [super setHidden:hidden];
    _indexTitleView.hidden = hidden;
}
- (void) dealloc {
    [_indexTitleView removeFromSuperview];
}

@end
