//
//  CategoryModel.h
//  级联菜单
//
//  Created by stone on 16/9/2.
//  Copyright © 2016年 zm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject

@property (nonatomic,strong)NSString* name;
@property (nonatomic,strong)NSArray* subcategories;
@property (nonatomic,strong)NSString* icon;



+(NSArray*)parseWithDic:(NSArray*)arr;

@end
