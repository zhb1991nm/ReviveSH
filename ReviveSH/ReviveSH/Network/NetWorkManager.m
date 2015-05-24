//
//  NetWorkManager.m
//  ReviveSH
//
//  Created by zhb on 15/5/24.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "NetWorkManager.h"
#import <AFNetworking/AFNetworking.h>
#import "RMMapper.h"

#define SHOW_REQUEST_URL TRUE

NSString *const NetWorkManagerErrorDomain = @"NetWorkManagerErrorDomain";

@interface ErrorObject : NSObject

@property (nonatomic,copy) NSString *status;

+(BOOL)error:(id)response;

@end

@implementation ErrorObject

+(BOOL)error:(id)response{
    if ([response isKindOfClass:[NSDictionary class]]) {
        NSDictionary *dict = (NSDictionary *)response;
        NSString *status = [dict objectForKey:@"status"];
        if ([status isEqualToString:@"error"]) {
            return YES;
        }
    }
    return NO;
}

@end

@interface NetWorkManager(){
    AFHTTPRequestOperationManager *operationManager;
}

@end

@implementation NetWorkManager

-(instancetype)init{
    if (self = [super init]) {
        operationManager = [AFHTTPRequestOperationManager manager];
    }
    return self;
}

-(void)requestMethod:(RequestMethod)method subUrl:(NSString *)subUrlString parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    NSString *url = [BASE_URL stringByAppendingPathComponent:subUrlString];
#if (SHOW_REQUEST_URL == TRUE)
    NSLog(@"request url:%@",url);
#endif
    switch (method) {
        case POST:{
            [operationManager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                if ([ErrorObject error:responseObject]) {
                    failure([self serverError:nil]);
                }else{
                    success(responseObject);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                failure(error);
            }];
        }
            break;
        case GET:{
            [operationManager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                if ([ErrorObject error:responseObject]) {
                    failure([self serverError:nil]);
                }else{
                    success(responseObject);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                failure(error);
            }];
        }
            break;
            
        default:
            break;
    }
}

-(void)requestClassMethod:(RequestMethod)method subUrl:(NSString *)subUrlString responseClass:(Class)responseClass  parameters:(id)parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure{
    [self requestMethod:method subUrl:subUrlString parameters:parameters success:^(id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            id obj = [[responseClass alloc] init];
            [RMMapper populateObject:obj fromDictionary:responseObject];
            success(obj);
        }else{
            failure([[self class] classMatchError]);
        }
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}

-(void)requestClassArrayMethod:(RequestMethod)method subUrl:(NSString *)subUrlString responseClass:(Class)responseClass  parameters:(id)parameters success:(void (^)(NSArray *responseObjectArray))success failure:(void (^)(NSError *error))failure{
    [self requestMethod:method subUrl:subUrlString parameters:parameters success:^(id responseObject) {
        if ([responseObject isKindOfClass:[NSArray class]]) {
            NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithCapacity:[responseObject count]];
            for (id item in responseObject) {
                if (![item isKindOfClass:[NSDictionary class]]) {
                    continue;
                }
                id obj = [RMMapper objectWithClass:responseClass fromDictionary:item];
                [mutableArray addObject:obj];
            }
            success(mutableArray);
        }else{
            failure([[self class] classMatchError]);
        }
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}

+(NetWorkManager *)instance{
    return [[[self class]alloc] init];
}

-(void)cancalAllRequest{
    if (operationManager) {
        [operationManager.operationQueue cancelAllOperations];
    }
}

-(NSError *)jsonError{
    NSString *errMsg = @"JSON解析失败";
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:errMsg forKey:NSLocalizedDescriptionKey];
    return [NSError errorWithDomain:NetWorkManagerErrorDomain code:NetWorkManagerJsonError userInfo:userInfo];
}

-(NSError *)classMatchError{
    NSString *errMsg = @"Mapper解析失败";
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:errMsg forKey:NSLocalizedDescriptionKey];
    return [NSError errorWithDomain:NetWorkManagerErrorDomain code:NetWorkManagerClassMatchError userInfo:userInfo];
}

-(NSError *)serverError:(NSString *)errMsg{
    if (!errMsg) {
        errMsg = @"服务器返回错误";
    }
    NSDictionary *userInfo = [NSDictionary dictionaryWithObject:errMsg forKey:NSLocalizedDescriptionKey];
    return [NSError errorWithDomain:NetWorkManagerErrorDomain code:NetWorkManagerServerError userInfo:userInfo];
}

@end

