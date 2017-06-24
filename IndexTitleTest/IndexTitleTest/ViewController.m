//
//  ViewController.m
//  IndexTitleTest
//
//  Created by kfzx-version on 2017/6/14.
//  Copyright © 2017年 kfzx-zhaowei01. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>
#import "ZWTableView.h"
#define WIDTH self.view.frame.size.width

#define HEIGHT self.view.frame.size.height
void AudioServicesPlaySystemSoundWithVibration(int, id, id);
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) NSMutableArray *indexTitleArray;
@property (nonatomic) ZWTableView *tableView;
@property (nonatomic) UIView *kindexTitleView;
@property (nonatomic) float labelHeight;
@property (nonatomic) int firstSection;
@property (nonatomic) int ifontSize;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _ifontSize = 10;//默认大小
    //_indexTitleArray = [NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#",@"可", nil];
    self.view.userInteractionEnabled = YES;
    
    [self createTableView];
    
    //[self indexTitleView];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSMutableArray *) indexTitleArray {
    if (_indexTitleArray == nil) {
        _indexTitleArray = [NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"#",@"可", nil];
    }
    return _indexTitleArray;
}

- (void) createTableView {
    UIButton *changeIndexFont = [[UIButton alloc] initWithFrame:CGRectMake(220, 50, 100, 30)];
   // [changeIndexFont addTarget:self action:@selector(changeIndexFontClicked:) forControlEvents:UIControlEventTouchUpInside];
    changeIndexFont.titleLabel.text = @"索引字体++";
    changeIndexFont.backgroundColor = [UIColor greenColor];
    changeIndexFont.tag = 1;
    
    UIButton *decreaseIndexFont = [[UIButton alloc] initWithFrame:CGRectMake(40, 50, 100, 30)];
   // [decreaseIndexFont addTarget:self action:@selector(changeIndexFontClicked:) forControlEvents:UIControlEventTouchUpInside];
    decreaseIndexFont.titleLabel.text = @"索引字体--";
    decreaseIndexFont.backgroundColor = [UIColor redColor];
    decreaseIndexFont.tag = 2;
    
    [self.view addSubview:changeIndexFont];
    
    [self.view addSubview:decreaseIndexFont];
    
    CGRect frame = self.view.frame;
    frame.origin.y = 100;
    _tableView = [[ZWTableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.indexTitleArray = self.indexTitleArray;
    
    [self.view addSubview:_tableView];
    dispatch_after(5, dispatch_get_main_queue(), ^{
        [_tableView addIndexTitleView];
    });
}

//- (void) changeIndexFontClicked:(id) sender{
//    if ([sender isKindOfClass:[UIButton class]]) {
//        UIButton *btn = (UIButton *)sender;
//        if (btn.tag == 1) {
//            _ifontSize++;
//            [self indexTitleView];
//        } else {
//            _ifontSize--;
//            [self indexTitleView];
//        }
//    }
//
//}
//
//- (void) indexTitleView {
//    UIView *titleView = [UIView new];
//    if (_kindexTitleView) {
//        [_kindexTitleView removeFromSuperview];
//    }
//    _kindexTitleView = titleView;
//    titleView.backgroundColor = [UIColor clearColor];
//    titleView.userInteractionEnabled = YES;
//
//    UITapGestureRecognizer *touchGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchGesture:)];
//    [titleView addGestureRecognizer:touchGesture];
//    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGesture:)];
//    swipeGesture.direction = UISwipeGestureRecognizerDirectionDown ;
//    [titleView addGestureRecognizer:swipeGesture];
//    //
//    titleView.frame = CGRectMake(self.view.frame.size.width - 40, 0, 40, self.view.frame.size.height);
//
//    NSString *content = @"A";
//    CGSize size =[content sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:_ifontSize]}];
//
//
//    _labelHeight = size.height;//(HEIGHT - 66)/_indexTitleArray.count;
//
//    int gapH = (HEIGHT - _labelHeight * self.indexTitleArray.count)/2;
//
//    for (int i  = 0;i<self.indexTitleArray.count; i++) {
//        UILabel *aaaa = [UILabel new];
//        aaaa.frame = CGRectMake(0, gapH + i * _labelHeight, _labelHeight, _labelHeight);
//        aaaa.text = [self.indexTitleArray objectAtIndex:i];
//        aaaa.font = [UIFont systemFontOfSize:_ifontSize];
//        aaaa.textColor = [UIColor grayColor];
//        [titleView addSubview:aaaa];
//    }
//    [self.view addSubview:titleView];
//
//}
//
//- (void) touchGesture:(UITapGestureRecognizer *)gesture {
//    NSLog(@"touch ...");
//    float y = [gesture locationInView:_kindexTitleView].y - (HEIGHT - _labelHeight * self.indexTitleArray.count)/2;
//    int sec = y/_labelHeight;
//    if (sec >= self.indexTitleArray.count || sec < 0) {
//        return;
//    }
//    if (_firstSection == sec) {
//        return;
//    }
//    _firstSection = sec;
//    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:sec];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [_tableView scrollToRowAtIndexPath:indexpath atScrollPosition:UITableViewScrollPositionTop animated:NO];
//        AudioServicesPlaySystemSound(1519);
//
//    });
//
//}
//
//- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    //NSLog(@"touchesBegan");
//    UITouch * touch = touches.anyObject;
//    float y = [touch locationInView:_kindexTitleView].y - (HEIGHT - _labelHeight * self.indexTitleArray.count)/2;
//    int sec = y/_labelHeight;
//    if (sec >= self.indexTitleArray.count || sec < 0) {
//        return;
//    }
//    if (_firstSection == sec) {
//        return;
//    }
//    _firstSection = sec;
//    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:sec];
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [_tableView scrollToRowAtIndexPath:indexpath atScrollPosition:UITableViewScrollPositionTop animated:NO];
//        AudioServicesPlaySystemSound(1519);
//
//    });
//}
//
//- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event {
//    //NSLog(@"touchesMoved");
//    UITouch * touch = touches.anyObject;
//    float y = [touch locationInView:_kindexTitleView].y - (HEIGHT - _labelHeight * self.indexTitleArray.count)/2;
//
//    int sec = y/_labelHeight;
//    if (sec >= self.indexTitleArray.count || sec < 0) {
//        return;
//    }
//    if (_firstSection == sec) {
//        return;
//    }
//    _firstSection = sec;
//
//    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:sec];
//    [_tableView scrollToRowAtIndexPath:indexpath atScrollPosition:UITableViewScrollPositionTop animated:NO];
//
//     //AudioServicesPlaySystemSoundWithVibration(4095,nil,dict);
//    AudioServicesPlaySystemSound(1519);
//
//}
//
//- (void) swipeGesture:(UISwipeGestureRecognizer *)gesture {
//    //NSLog(@"swipe Gesture...");
//
//}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self.indexTitleArray objectAtIndex:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.indexTitleArray.count;
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *str = @"dddddd";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
    }
    cell.textLabel.text = [self.indexTitleArray objectAtIndex:indexPath.section];
    //cell.detailTextLabel.text = @"detail";
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
