//
//  NetWorkManager.h
//  ReviveSH
//
//  Created by zhb on 15/5/24.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import <Foundation/Foundation.h>
#define HOST @"101.231.124.8"
#define PORT @"45677"

#define BASE_URL @"http://101.231.124.8:45677"

NSString *const NetWorkManagerErrorDomain;

typedef enum : NSUInteger {
    POST,
    GET
} RequestMethod;

typedef enum : NSUInteger
{
    NetWorkManagerNoError = 0,
    NetWorkManagerJsonError = 1,
    NetWorkManagerClassMatchError = 2,
    NetWorkManagerServerError = 3,
} NetWorkManagerError;

@interface NetWorkManager : NSObject
/**
 *  获得一个实例
 *
 *  @return NetWorkManager实例
 */
+(NetWorkManager *)instance;

/**
 *  请求
 *
 *  @param method       GET OR POST
 *  @param subUrlString 请求地址（后半部分）
 *  @param parameters   请求参数
 *  @param success      请求成功回调
 *  @param failure      请求失败回调
 */
-(void)requestMethod:(RequestMethod)method subUrl:(NSString *)subUrlString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 *  请求对象
 *
 *  @param method        GET OR POST
 *  @param subUrlString  请求地址（后半部分）
 *  @param responseClass 返回的对象类
 *  @param parameters    请求参数
 *  @param success       请求成功回调
 *  @param failure       请求失败回调
 */
-(void)requestClassMethod:(RequestMethod)method subUrl:(NSString *)subUrlString responseClass:(Class)responseClass  parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;

/**
 *  请求对象数组
 *
 *  @param method        GET OR POST
 *  @param subUrlString  请求地址（后半部分）
 *  @param responseClass 返回数组的对象类
 *  @param parameters    请求参数
 *  @param success       请求成功回调
 *  @param failure       请求失败回调
 */
-(void)requestClassArrayMethod:(RequestMethod)method subUrl:(NSString *)subUrlString responseClass:(Class)responseClass  parameters:(id)parameters success:(void (^)(NSArray *responseObjectArray))success failure:(void (^)(NSError *error))failure;

/**
 *  取消所有请求
 */
-(void)cancalAllRequest;

@end
