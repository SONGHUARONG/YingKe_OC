//
//  SHRMainViewController.m
//  YingKe_OC
//
//  Created by huarong on 2018/4/24.
//  Copyright © 2018年 huarong. All rights reserved.
//

#import "SHRMainViewController.h"

@interface SHRMainViewController ()

@end

@implementation SHRMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)setupUI{
    //设置导航控制器
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
}


@end
