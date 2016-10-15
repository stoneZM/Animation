//
//  ConstomView.m
//  粒子效果
//
//  Created by stone on 16/8/31.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "ParticleView.h"

@interface  ParticleView()

@property (nonatomic,strong)UIBezierPath* path;
@property (nonatomic,strong)CALayer* dotLayer;
@property (nonatomic,strong)CAReplicatorLayer* replayer;

@end


@implementation  ParticleView

- (void)drawRect:(CGRect)rect {
    [self.path stroke];
}

-(UIBezierPath *)path{
    if (_path == nil) {
        _path = [UIBezierPath bezierPath];
    }
    return _path;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self reDraw];
    //获取touch对象
    UITouch* touch = [touches anyObject];
    //获取当前的触摸点
    CGPoint curP = [touch locationInView:self];
    //设置起点
    [self.path moveToPoint:curP];

}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    //获取touch对象
    UITouch* touch = [touches anyObject];
    //获取当前的触摸点
    CGPoint curP = [touch locationInView:self];
    //创建一个路径
    [self.path addLineToPoint:curP];

    [self setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self startAnimation];
}

-(void)startAnimation{


    [self.replayer addSublayer:self.dotLayer];
    [self.layer addSublayer:self.replayer];
    self.dotLayer.hidden = NO;
    //创建一个帧动画
    CAKeyframeAnimation* anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"position";
    anim.path = self.path.CGPath;
    anim.repeatCount = MAXFLOAT;
    anim.duration = 2;

    [self.dotLayer addAnimation:anim forKey:nil];
}
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addAnimation];
    }
    return self;
}

-(void)addAnimation{
    //创建复制层
    CAReplicatorLayer* replayer = [CAReplicatorLayer layer];
    replayer.frame = self.bounds;
    replayer.instanceCount = 30;
    replayer.instanceDelay = 0.2;
    self.replayer = replayer;

    //创建图层
    CALayer* layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 10, 10);
    layer.cornerRadius = 5;
    layer.backgroundColor = [UIColor greenColor].CGColor;
    self.dotLayer = layer;
}


-(void)reDraw{
    self.path = nil;
    self.dotLayer.hidden = YES;
    [self.dotLayer removeFromSuperlayer];
    [self setNeedsDisplay];


}


@end
