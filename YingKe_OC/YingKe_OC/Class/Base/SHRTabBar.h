//
//  SHRTabBar.h
//  YingKe_OC
//
//  Created by huarong on 2018/4/24.
//  Copyright © 2018年 huarong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SHRItemType){
     SHRItemTypeLaunch = 10,
    SHRItemTypeLive = 100,
    SHRItemTypeMe
};


@class SHRTabBar;

typedef void(^TapbarBlock)(SHRTabBar* tabbar,SHRItemType idx);

@protocol SHRTabBarDelegate<NSObject>

- (void)tabbar:(SHRTabBar *)tabbar clickIndex:(SHRItemType)idx;


@end

@interface SHRTabBar : UIView

@property(nonatomic, weak) id<SHRTabBarDelegate> delegate;

@property(nonatomic, copy) TapbarBlock block;

@end
