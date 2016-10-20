//
//  CategoryModel.m
//  级联菜单
//
//  Created by stone on 16/9/2.
//  Copyright © 2016年 zm. All rights reserved.
//

#import "CategoryModel.h"

@implementation CategoryModel

+(instancetype)parseWithDic:(NSArray *)arr{

    NSMutableArray* modelArr = [[NSMutableArray alloc]init];
    for (NSDictionary* dic in arr) {
        CategoryModel* model = [[CategoryModel alloc]initWithDic:dic];
        [modelArr addObject:model];
    }
    return [modelArr copy];
}

-(instancetype)initWithDic:(NSDictionary*)dic{

    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}




@end
