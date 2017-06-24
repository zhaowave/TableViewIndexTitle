//
//  IndexTitleView.h
//  IndexTitleTest
//
//  Created by wei zhao on 2017/6/24.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol IndexTitleViewDelegate
-(void) scrollToSection:(int) section;
@end
@interface IndexTitleView : UIView
@property (nonatomic,weak) id <IndexTitleViewDelegate> delegate;
- (instancetype) initWithTitleArray:(NSArray*)indexTitleArray andFont:(int)fontSize;
@end
