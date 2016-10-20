//
//  ViewController.m
//  级联菜单
//
//  Created by stone on 16/9/2.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "AssociatedViewController.h"
#import "CategoryController.h"
#import "SubCategoryController.h"
@interface AssociatedViewController ()

@end

@implementation AssociatedViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    CGFloat width = self.view.bounds.size.width *0.3;
    CGFloat height = self.view.bounds.size.height;

    SubCategoryController* subVc = [[SubCategoryController alloc]init];
    subVc.view.frame = CGRectMake(width, 0, self.view.bounds.size.width*0.7, height);
    [self addChildViewController:subVc];
    [self.view addSubview:subVc.view];
    

    CategoryController* cateVC = [[CategoryController alloc]init];
    cateVC.view.frame = CGRectMake(0, 64, width, height);
    [self addChildViewController:cateVC];
    [self.view addSubview:cateVC.view];


}

@end
