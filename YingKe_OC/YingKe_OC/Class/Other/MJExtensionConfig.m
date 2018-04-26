//
//  MJExtensionConfig.m
//  YingKe_OC
//
//  Created by huarong on 2018/4/26.
//  Copyright © 2018年 huarong. All rights reserved.
//

#import "MJExtensionConfig.h"
#import "MJExtension.h"
#import "SHRCreator.h"
#import "SHRLive.h"

@implementation MJExtensionConfig

+ (void)load {
    
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"ID" : @"id"
                 };
    }];
    
    [SHRCreator mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{
                 @"desc" : @"desciption"
                 };
    }];
    
    //下滑线
    [SHRLive mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
    
    [SHRCreator mj_setupReplacedKeyFromPropertyName121:^NSString *(NSString *propertyName) {
        return [propertyName mj_underlineFromCamel];
    }];
}

@end
