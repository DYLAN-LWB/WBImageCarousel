//
//  ViewController.m
//  WBImageCarousel
//
//  Created by 李伟宾 on 15/6/24.
//  Copyright (c) 2015年 李伟宾. All rights reserved.
//

#import "ViewController.h"
#import "WBCycleScrollView.h"

@interface ViewController ()  <WBCycleScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 500)];
    backgroundView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:backgroundView];

    // - 本地图片
    NSArray *images = @[[UIImage imageNamed:@"image_01"],
                        [UIImage imageNamed:@"image_02"],
                        [UIImage imageNamed:@"image_03"],
                        [UIImage imageNamed:@"image_04"]
                        ];
    
    // - 网络图片
    NSArray *imagesURLStrings = @[
                                  @"http://pica.nipic.com/2007-12-23/200712231523651_2.jpg",
                                  @"http://b.hiphotos.baidu.com/image/pic/item/9345d688d43f8794d57a26f1d61b0ef41ad53a63.jpg",
                                  @"http://pic4.nipic.com/20090903/2125404_132352014851_2.jpg",
                                  @"http://d.hiphotos.baidu.com/image/pic/item/6c224f4a20a44623d2afccbd9c22720e0df3d78c.jpg"
                                  ];

    
    // - 加载本地图片
    WBCycleScrollView *cycleScrollView = [WBCycleScrollView cycleScrollViewWithFrame:CGRectMake(10, 20, 280, 180) imagesGroup:images];
    
    cycleScrollView.infiniteLoop = YES;
    cycleScrollView.delegate = self;
    cycleScrollView.pageControlStyle = WBCycleScrollViewPageContolStyleAnimated;
    cycleScrollView.autoScrollTimeInterval = 1.0;
    
    [backgroundView addSubview:cycleScrollView];

//
    
    // - 加载带标题的网络图片
    WBCycleScrollView *cycleScrollView2 = [WBCycleScrollView cycleScrollViewWithFrame:CGRectMake(25, 320, 250, 180) imageURLStringsGroup:nil]; // 模拟网络延时情景
    
    cycleScrollView2.pageControlAliment = WBCycleScrollViewPageContolAlimentRight;
    cycleScrollView2.delegate = self;
    
    // - 文字标题
    NSArray *titles = @[@"这里是标题这里是标题",
                        @"这里是标题这里是标题这里是标题",
                        @"这里是标题",
                        @"这里是标题这里是标题这里是标题这里是标题这里是标题这里是标题"
                        ];
    
    cycleScrollView2.titlesGroup = titles;
    cycleScrollView2.dotColor = [UIColor yellowColor]; // - pageControl圆标颜色
    cycleScrollView2.placeholderImage = [UIImage imageNamed:@""]; 
    
    [backgroundView addSubview:cycleScrollView2];
    
    // - 模拟加载延迟
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        cycleScrollView2.imageURLStringsGroup = imagesURLStrings;
    });
    
    
    
    // - 清除缓存
    [cycleScrollView2 clearCache];
    



}

#pragma mark - WBCycleScrollViewDelegate

- (void)cycleScrollView:(WBCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"点击了第%ld张图片", index);
    
    UIViewController *VC = [[UIViewController alloc] init];
    VC.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:VC animated:YES];
    
}

@end
