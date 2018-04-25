//
//  SHRMainTopView.h
//  YingKe_OC
//
//  Created by huarong on 2018/4/25.
//  Copyright © 2018年 huarong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger tag);

@interface SHRMainTopView : UIView

@property(nonatomic, copy) MainTopBlock block;

-(instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles;

-(void)scrollingTo:(NSInteger)tag;

@end
