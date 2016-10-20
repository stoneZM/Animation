//
//  TableViewController.m
//  Animations
//
//  Created by stone on 2016/10/15.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "TableViewController.h"
#import "ActivityViewController.h"
#import "ParticleAnimationController.h"
#import "SoundController.h"
#import "AssociatedViewController.h"
@interface TableViewController ()
@property (nonatomic,strong)NSArray* animations;
@property (nonatomic,strong)NSMutableArray<UIViewController*>* animationsVC;
@end

@implementation TableViewController

-(NSArray *)animations{
    if (_animations == nil) {
        _animations = [[NSArray alloc]init];
        _animations = @[@"活动指示器",@"粒子动画",@"声音震动条",@"级联菜单样式"];
    }
    return _animations;
}

-(NSMutableArray *)animationsVC{
    if (_animationsVC == nil) {
        _animationsVC = [[NSMutableArray alloc]init];
        [_animationsVC addObject:[[ActivityViewController alloc]init]];
        [_animationsVC addObject:[[ParticleAnimationController alloc]init]];
        [_animationsVC addObject:[[SoundController alloc]init]];
        [_animationsVC addObject:[[AssociatedViewController alloc]init]];
    }
    return _animationsVC;
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.animations.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.animations[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.navigationController pushViewController:self.animationsVC[indexPath.row] animated:YES];
}




@end
