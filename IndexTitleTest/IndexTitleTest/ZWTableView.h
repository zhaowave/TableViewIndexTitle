//
//  ZWTableView.h
//  IndexTitleTest
//
//  Created by wei zhao on 2017/6/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZWTableView : UITableView
@property (nonatomic,strong) NSMutableArray *indexTitleArray;
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style;
- (void) addIndexTitleView;
@end
