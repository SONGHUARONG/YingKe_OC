//
//  SHRTabBarController.m
//  YingKe_OC
//
//  Created by huarong on 2018/4/24.
//  Copyright © 2018年 huarong. All rights reserved.
//

#import "SHRTabBarController.h"
#import "SHRTabBar.h"
#import "SHRNavigationController.h"
#import "SHRLaunchViewController.h"

@interface SHRTabBarController ()<SHRTabBarDelegate>

@property(nonatomic,strong) SHRTabBar *shrTarbar;

@end



@implementation SHRTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //加载所有视图控制器
    [self addViewControllers];
    
    //加载自定义tabbar
    [self.tabBar addSubview:self.shrTarbar];
    
    //去除tabbar阴影线
    [[UITabBar appearance] setShadowImage:[UIImage new]];
    [[UITabBar appearance] setBackgroundImage:[UIImage new]];
}

-(SHRTabBar *)shrTarbar{
    if(!_shrTarbar){
        _shrTarbar = [[SHRTabBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TABBAR_HEIGHT)];
        _shrTarbar.delegate = self;
    }
    return _shrTarbar;
}

-(void)addViewControllers{
    NSMutableArray *viewControlNames = [NSMutableArray arrayWithArray:@[@"SHRMainViewController",@"SHRMeViewController"]];
    
    for (NSUInteger i = 0; i < viewControlNames.count; i++) {
        NSString *controllerName = viewControlNames[i];
        UIViewController *viewController = [[NSClassFromString(controllerName) alloc] init];
        SHRNavigationController *navVC = [[SHRNavigationController alloc] initWithRootViewController:viewController];
        [viewControlNames replaceObjectAtIndex:i withObject:navVC];
    }
    
    self.viewControllers = viewControlNames;
}

#pragma mark:实现SHRTabBarDelegate方法
-(void)tabbar:(SHRTabBar *)tabbar clickIndex:(SHRItemType)idx{
    if(idx != SHRItemTypeLaunch){
        self.selectedIndex = idx - SHRItemTypeLive;
        return;
    }
    SHRLaunchViewController *launchVC = [[SHRLaunchViewController alloc] init];
    [self presentViewController:launchVC animated:YES completion:nil];
}

@end
