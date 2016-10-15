//
//  ParticleAnimationController.m
//  Animations
//
//  Created by stone on 2016/10/15.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "ParticleAnimationController.h"
#import "ParticleView.h"
@interface ParticleAnimationController ()
@property (nonatomic,strong)ParticleView*  particleView;
@property (nonatomic,weak)UIButton* startBtn;
@property (nonatomic,weak)UIButton* reDrawBtn;

@end

@implementation ParticleAnimationController

-(ParticleView *)particleView{
    if (_particleView == nil) {
        _particleView = [[ParticleView alloc]init];
        _particleView.frame = self.view.bounds;
    }
    return _particleView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view insertSubview:self.particleView atIndex:0];
    [self addBtn];
}
-(void)addBtn{
    UIButton* startBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.startBtn = startBtn;
    [startBtn setBackgroundColor:[UIColor orangeColor]];
    [self.view insertSubview:startBtn aboveSubview:self.particleView];
    [startBtn setFrame:CGRectMake(50, 100, 100, 35)];
    [startBtn setTitle:@"开始动画" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];

    UIButton* reDrawBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.reDrawBtn = reDrawBtn;
    [self.view insertSubview:reDrawBtn aboveSubview:self.particleView];
    [reDrawBtn setBackgroundColor:[UIColor orangeColor]];
    [reDrawBtn setFrame:CGRectMake(200, 100, 100, 35)];
    [reDrawBtn setTitle:@"重绘" forState:UIControlStateNormal];
    [reDrawBtn addTarget:self action:@selector(reDraw) forControlEvents:UIControlEventTouchUpInside];
}

-(void)start{
    [self.particleView startAnimation];
}
-(void)reDraw{
    [self.particleView reDraw];
}



@end
