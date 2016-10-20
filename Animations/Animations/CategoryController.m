//
//  CategoryController.m
//  级联菜单
//
//  Created by stone on 16/9/2.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "CategoryController.h"
#import "CategoryModel.h"
@interface CategoryController ()
@property (nonatomic,strong)NSArray* modelArr;
@end

@implementation CategoryController

-(NSArray *)modelArr{
    if (_modelArr == nil) {
        NSString* path = [[NSBundle mainBundle]pathForResource:@"categories" ofType:@"plist"];
        NSArray* arr = [NSArray arrayWithContentsOfFile:path];
        _modelArr = [CategoryModel parseWithDic:arr];
    }
    return _modelArr;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];


    [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.modelArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    CategoryModel* model = self.modelArr[indexPath.row];
    cell.textLabel.text = model.name;

    //  选中状态时的颜色
    cell.textLabel.highlightedTextColor = [UIColor redColor];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [[NSNotificationCenter defaultCenter] postNotificationName:@"DidSelectRow" object:indexPath];

}



@end
