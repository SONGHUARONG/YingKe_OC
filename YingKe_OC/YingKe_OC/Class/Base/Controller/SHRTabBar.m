//
//  SHRTabBar.m
//  YingKe_OC
//
//  Created by huarong on 2018/4/24.
//  Copyright © 2018年 huarong. All rights reserved.
//

#import "SHRTabBar.h"

@interface SHRTabBar()

@property(nonatomic, strong) NSArray *datalist;//数据列表

@property(nonatomic, strong) UIButton *lastBtn;//保留上一次点击btn

@property(nonatomic, strong) UIImageView *tabbgView;//背景图片

@property(nonatomic, strong) UIButton *cameraBtn;//直播按钮
@end

@implementation SHRTabBar


//懒加载直播按钮
-(UIButton *)cameraBtn{
    if(!_cameraBtn){
        _cameraBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cameraBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_cameraBtn sizeToFit];
        _cameraBtn.tag = SHRItemTypeLaunch;
        [_cameraBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cameraBtn;
}

//懒加载数据列表
-(NSArray *)datalist{
    if(!_datalist){
        _datalist =@[@"tab_live",@"tab_me"];
    }
    return _datalist;
}


//懒加载背景图片
-(UIImageView *)tabbgView{
    if(!_tabbgView){
        _tabbgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _tabbgView;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if(self)
    {
        //装载背景
        [self addSubview:self.tabbgView];
        
        //装载item
        for (int i = 0; i < self.datalist.count; i++) {
            UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            itemBtn.adjustsImageWhenHighlighted = NO;
            [itemBtn setImage:[UIImage imageNamed:self.datalist[i]] forState:UIControlStateNormal];
            [itemBtn setImage:[UIImage imageNamed:[self.datalist[i] stringByAppendingString:@"_p"] ]forState:UIControlStateSelected];
            //设置默认按钮
            if(i == 0){
                itemBtn.selected = YES;
                self.lastBtn = itemBtn;
            }
            //设置tag
            itemBtn.tag = SHRItemTypeLive + i;
            //设置点击事件
            [itemBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:itemBtn];
        }
        
        ////装载直播按钮
        [self addSubview:self.cameraBtn];
    }
    return self;
    
}

//布局子控件
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width / self.datalist.count;
    //遍历子控件
    for (UIView* btn in self.subviews) {
        //筛选按钮,布局按钮frame
        if(btn.tag >= SHRItemTypeLive){
            btn.frame = CGRectMake((btn.tag -SHRItemTypeLive) * width , 0, width, self.frame.size.height);
        }
    }
    //设置直播按钮frame
    [_cameraBtn sizeToFit];
    _cameraBtn.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height - 50);
    
    //设置背景图片frame
    self.tabbgView.frame = self.frame;
}

-(void)clickItem:(UIButton *)btn{
    //方式1.delegate回调
    if([self.delegate respondsToSelector:@selector(tabbar:clickIndex:)]){
        [self.delegate tabbar:self clickIndex:btn.tag];
    }
    //方式2.block回调
    if(self.block){
        self.block(self, btn.tag);
    }
    
    if(btn.tag == SHRItemTypeLaunch){
        return;
    }
    
    //将上一个按钮的选中状态置为NO
    self.lastBtn.selected = NO;
    //将正在点击的按钮状态置为YES
    btn.selected = YES;
    //将当前按钮设置成上一个按钮
    self.lastBtn = btn;
    
    [UIView animateWithDuration:0.2 animations:^{
        btn.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        btn.transform = CGAffineTransformIdentity;
    }];
    
    
}

@end
