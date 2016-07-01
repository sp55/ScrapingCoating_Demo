//
//  ViewController.m
//  ScrapingCoating_Demo
//
//  Created by admin on 16/7/1.
//  Copyright © 2016年 AlezJi. All rights reserved.

//http://www.jianshu.com/p/eab521dde13f
//iOS基础-小Demo--刮开涂层(刮刮乐效果)

#import "ViewController.h"

@interface ViewController ()
@property(strong,nonatomic)UIImageView *imgView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1.设置刮开后,显示的文字Label
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(30, 150, 300, 300)];
    label.text = @"离思五首\n元稹\n曾经沧海难为水,\n除却巫山不是云!\n取次花丛懒回顾,\n半缘修道半缘君!\n";
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor colorWithRed:(arc4random()%173)/346.0 + 0.5 green:(arc4random()%173)/346.0 + 0.5  blue:(arc4random()%173)/346.0 + 0.5  alpha: 1];
    label.font = [UIFont systemFontOfSize:30];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    //2.设置遮挡在外面的Image
    self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(30, 150, 300, 300)];
    self.imgView.image = [UIImage imageNamed:@"gyy"];
    [self.view addSubview:self.imgView];
}

//3.在touchesMoved方法里面实现操作
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 触摸任意位置
    UITouch *touch = touches.anyObject;
    // 触摸位置在图片上的坐标
    CGPoint cententPoint = [touch locationInView:self.imgView];
    // 设置清除点的大小
    CGRect  rect = CGRectMake(cententPoint.x, cententPoint.y, 20, 20);
    // 默认是去创建一个透明的视图
    UIGraphicsBeginImageContextWithOptions(self.imgView.bounds.size, NO, 0);
    // 获取上下文(画板)
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 把imageView的layer映射到上下文中
    [self.imgView.layer renderInContext:ref];
    // 清除划过的区域
    CGContextClearRect(ref, rect);
    // 获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束图片的画板, (意味着图片在上下文中消失)
    UIGraphicsEndImageContext();
    self.imgView.image = image;
}
@end
