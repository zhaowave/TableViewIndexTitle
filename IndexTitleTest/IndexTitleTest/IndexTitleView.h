//
//  IndexTitleView.h
//  IndexTitleTest
//
//  Created by wei zhao on 2017/6/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//when you touch or move on this view,it will caculate a relative tableView section
// so you should implementation this protocol in your subclass of UITableView
@protocol IndexTitleViewDelegate
@required
-(void) scrollToSection:(int) section;
@end
@interface IndexTitleView : UIView
@property (nonatomic,weak) id <IndexTitleViewDelegate> delegate;
- (instancetype) initWithTitleArray:(NSArray*)indexTitleArray andFont:(int)fontSize;
@end
