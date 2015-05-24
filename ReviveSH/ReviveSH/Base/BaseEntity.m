//
//  BaseEntity.m
//  Haobo
//
//  Created by 张浩波 on 15/5/2.
//  Copyright (c) 2015年 zhb1991nm. All rights reserved.
//

#import "BaseEntity.h"

@implementation BaseEntity

-(instancetype)initFromDictionary:(NSDictionary *)dict{
    return [RMMapper objectWithClass:[self class] fromDictionary:dict];
}

+(instancetype)entityFromDictionary:(NSDictionary *)dict{
    return [RMMapper objectWithClass:[self class] fromDictionary:dict];
}

+(NSArray *)entityArrayFromArrayOfDictionary:(NSArray *)dictArray{
    return [RMMapper arrayOfClass:[self class] fromArrayOfDictionary:dictArray];
}

@end
