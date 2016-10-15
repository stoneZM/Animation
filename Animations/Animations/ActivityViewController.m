//
//  ViewController.m
//  活动指示器
//
//  Created by stone on 16/8/31.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()
@property (strong, nonatomic)UIView *baseView;
@end

@implementation ActivityViewController

-(UIView *)baseView{
    if (_baseView == nil) {
        CGFloat x = ([UIScreen mainScreen].bounds.size.width-100)*0.5;
        CGFloat y = ([UIScreen mainScreen].bounds.size.height-100)*0.5;
        _baseView = [[UIView alloc]initWithFrame:CGRectMake(x, y, 100, 100)];
        _baseView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_baseView];
    }
    return _baseView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor lightGrayColor];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self startAnimation];
}
-(void)startAnimation{

    //创建复制图层
    CAReplicatorLayer* replayer = [CAReplicatorLayer layer];
    replayer.frame = self.baseView.bounds;
    [self.baseView.layer addSublayer:replayer];
    //创建复制图层的子图层
    CALayer* layer = [CALayer layer];
    [replayer addSublayer:layer];

    layer.position = CGPointMake(replayer.bounds.size.width/2, 20);
    layer.bounds = CGRectMake(0, 0, 10, 10);
    layer.cornerRadius = 5;
    layer.masksToBounds = YES;


    layer.transform = CATransform3DMakeScale(0, 0, 0); //初始状态全部为0
    layer.backgroundColor = [UIColor redColor].CGColor;

    [replayer addSublayer:layer];

    replayer.instanceCount = 25;

    replayer.instanceTransform = CATransform3DMakeRotation(2*M_PI/25.0, 0, 0, 1);

    NSTimeInterval duration = 1;

    replayer.instanceDelay = duration / 25.0;

    //添加动画
    CABasicAnimation* basicAnimation = [CABasicAnimation animation];

    basicAnimation.keyPath = @"transform.scale";

    basicAnimation.fromValue = @1;

    basicAnimation.toValue = @0;

    basicAnimation.duration = duration;

    basicAnimation.repeatCount = MAXFLOAT;

    //    basicAnimation.autoreverses = YES;
    
    [layer addAnimation:basicAnimation forKey:nil];
}


@end
