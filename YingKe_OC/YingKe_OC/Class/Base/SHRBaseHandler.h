//
//  SHRBaseHandler.h
//  YingKe_OC
//
//  Created by huarong on 2018/4/26.
//  Copyright © 2018年 huarong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHRBaseHandler : NSObject

//完成时回调
typedef void(^CompleteBlock)(void);
//成功时回调
typedef void(^SuccessBlock)(id obj);
//失败时回调
typedef void(^FaildBlock)(id obj);

@end
