//
//  SHRHotLiveHandler.m
//  YingKe_OC
//
//  Created by huarong on 2018/4/26.
//  Copyright © 2018年 huarong. All rights reserved.
//

#import "SHRHotLiveHandler.h"
#import "HttpTool.h"
#import "SHRLive.h"

@implementation SHRHotLiveHandler

+(void)excuteGetHotLiveTaskWithSuccess:(SuccessBlock)success faild:(FaildBlock)faild{
    [HttpTool getWithPath:API_LiveGetTop params:nil success:^(id json) {
        
        NSInteger error = [json[@"dm_error"] integerValue];
        if(error){//失败
            faild(json);
        }else{//成功
//             success(json);
            NSArray *lives = [SHRLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            success(lives);
        }
        
    } failure:^(NSError *error) {
        faild(error);
    } ];
}

@end
