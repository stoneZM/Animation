//
//  SubCategoryController.m
//  级联菜单
//
//  Created by stone on 16/9/2.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "SubCategoryController.h"
#import "CategoryModel.h"
@interface SubCategoryController ()
@property (nonatomic,strong)NSArray* modelArr;
@property (nonatomic,strong)NSArray* subCate;
@end

@implementation SubCategoryController

-(NSArray *)subCate{
    if (_subCate == nil) {
        _subCate = [NSArray array];
    }
    return _subCate;
}

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
    self.view.backgroundColor = [UIColor redColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reloadtableView:) name:@"DidSelectRow" object:nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    self.edgesForExtendedLayout = UIRectEdgeAll;

}

-(void)reloadtableView:(NSNotification*)noti{

    NSIndexPath* index = noti.object;
    CategoryModel* model = self.modelArr[index.row];
    self.subCate = model.subcategories;
    [self.tableView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.subCate.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell*  cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.subCate[indexPath.row];
    return cell;
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"DidSelectRow" object:nil];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
