//
//  ViewController.m
//  ScrollImageViewDemo
//
//  Created by taowang on 16/5/20.
//  Copyright © 2016年 yunhu. All rights reserved.
//

#import "ViewController.h"
#import "WTScrollImageView.h"
@interface ViewController ()
@property (nonatomic, strong) WTScrollImageView *carouselView;
@property (weak, nonatomic) IBOutlet WTScrollImageView *carouselView1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //本地图片
    NSArray *arr1 = @[[UIImage imageNamed:@"1.jpg"], [UIImage imageNamed:@"2.jpg"], [UIImage imageNamed:@"3.jpg"]];
    
    //网络图片
    NSArray *arr2 = @[@"http://b.hiphotos.bdimg.com/wisegame/pic/item/e2cb39dbb6fd5266396586d9a918972bd50736b5.jpg", @"http://imgsrc.baidu.com/baike/pic/item/f636afc379310a55d8af6617b54543a98326104d.jpg", @"http://g.hiphotos.baidu.com/zhidao/pic/item/aa18972bd40735fac064c12c9c510fb30e24088a.jpg"];
    
    //既有本地图片也有网络图片
    NSArray *arr3 = @[@"http://pic39.nipic.com/20140226/18071023_162553457000_2.jpg", [UIImage imageNamed:@"2.jpg"], @"http://hiphotos.baidu.com/praisejesus/pic/item/e8df7df89fac869eb68f316d.jpg", [UIImage imageNamed:@"1.jpg"]];
    NSArray *describeArray = @[@"这是第一张图片的描述", @"这是第二张图片的描述", @"这是第三张图片的描述", @"这是第四张图片的描述"];
    
    /**
     *  通过代码创建
     */
    self.carouselView = [WTScrollImageView carouselViewWithImageArray:arr2 describeArray:describeArray];
    
    //设置frame
    self.carouselView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 180);
    
    
    //用代理处理图片点击
    self.carouselView.delegate = self;
    
    
    //设置每张图片的停留时间，默认值为5s，最少为2s
    _carouselView.time = 2;
    
    //设置分页控件的图片,不设置则为系统默认
    [_carouselView setPageImage:[UIImage imageNamed:@"other"] andCurrentPageImage:[UIImage imageNamed:@"current"]];
    
    //设置分页控件的位置，默认为PositionBottomCenter
    _carouselView.pagePosition = PositionBottomRight;
    
    
    /**
     *  修改图片描述控件的外观，不需要修改的传nil
     *
     *  参数一 字体颜色，默认为白色
     *  参数二 字体，默认为13号字体
     *  参数三 背景颜色，默认为黑色半透明
     */
    UIColor *bgColor = [[UIColor blueColor] colorWithAlphaComponent:0.5];
    UIFont *font = [UIFont systemFontOfSize:15];
    UIColor *textColor = [UIColor greenColor];
    [_carouselView setDescribeTextColor:textColor font:font bgColor:bgColor];
    
    
    [self.view addSubview:_carouselView];
    
    
    /**
     *  通过storyboard创建的轮播控件
     */
    _carouselView1.imageArray = arr2;
    //设置分页控件指示器的颜色
    [_carouselView1 setPageColor:[UIColor blueColor] andCurrentPageColor:[UIColor redColor]];
    //设置图片切换的方式
    _carouselView1.changeMode = ChangeModeFade;
    //用block处理图片点击事件
    _carouselView1.imageClickBlock = ^(NSInteger index){
        NSLog(@"点击了第%ld张图片", index);
    };
    _carouselView1.time = 3;}

- (IBAction)start:(id)sender {
    [_carouselView startTimer];
}
- (IBAction)stop:(id)sender {
    [_carouselView stopTimer];
}

@end
