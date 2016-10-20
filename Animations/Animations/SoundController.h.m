//
//  ViewController.m
//  声音震动条
//
//  Created by stone on 16/8/31.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "SoundController.h"

@interface SoundController ()

@property (nonatomic,strong)UIView* baseView;

@end

@implementation SoundController
-(UIView *)baseView{
    if (_baseView == nil) {
        CGFloat x = ([UIScreen mainScreen].bounds.size.width-200)*0.5;
        CGFloat y = ([UIScreen mainScreen].bounds.size.height-200)*0.5;
        _baseView = [[UIView alloc]initWithFrame:CGRectMake(x, y, 200, 200)];
        _baseView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_baseView];
    }
    return _baseView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self startAnimation];
}
-(void)startAnimation{

    //创建f复制图层
    CAReplicatorLayer* replayer = [CAReplicatorLayer layer];

    //创建图层
    CALayer* layer = [CALayer layer];
    //图层的位置及大小颜色
    layer.anchorPoint = CGPointMake(0, 1);
    layer.position = CGPointMake(0, self.baseView.bounds.size.height);
    layer.bounds = CGRectMake(0, 0, 30, 150);
    layer.backgroundColor = [UIColor redColor].CGColor;
    //将图层添加到视图中去
    [replayer addSublayer:layer];

    //创建核心动画
    CABasicAnimation* animation = [CABasicAnimation animation];
    animation.toValue = @0.1;                   //按比例来设置
    animation.keyPath = @"transform.scale.y";  //动画类型
    animation.duration = 0.5;
    //动画执行次数
    animation.repeatCount = MAXFLOAT;
    //动画回转
    animation.autoreverses = YES;
    //为图层添加动画
    [layer addAnimation:animation forKey:nil];


    //将复制图层添加到视图图层中
    [self.baseView.layer addSublayer:replayer];
    replayer.frame = self.baseView.layer.bounds;
    replayer.backgroundColor = [UIColor greenColor].CGColor;
    //设置复制图层的偏移量
    replayer.instanceTransform = CATransform3DMakeTranslation(45, 0, 0);//偏移
    //设置图层中子图层的动画时间偏移
    replayer.instanceDelay = 0.2;
    //设置图层中子图层的个数
    replayer.instanceCount = 3;

}

@end
