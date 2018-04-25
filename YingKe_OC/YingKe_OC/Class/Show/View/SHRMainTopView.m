//
//  SHRMainTopView.m
//  YingKe_OC
//
//  Created by huarong on 2018/4/25.
//  Copyright © 2018年 huarong. All rights reserved.
//

#import "SHRMainTopView.h"

@interface SHRMainTopView()

@property(strong, nonatomic) UIView *lineView;

@property(strong, nonatomic) NSMutableArray *buttons;

@end

@implementation SHRMainTopView


-(NSMutableArray *)buttons{
    if(!_buttons){
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}

-(instancetype)initWithFrame:(CGRect)frame andTitles:(NSArray *)titles{
    self = [super initWithFrame:frame];
    if(self){
        CGFloat btnW = self.width / titles.count;
        CGFloat btnH = self.height;
        for (NSInteger i = 0; i < titles.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.buttons addObject:btn];
            //设置文字
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            //设置文字颜色
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            //设置文字大小
            btn.titleLabel.font = [UIFont systemFontOfSize:18];
            btn.tag = i;
            btn.frame = CGRectMake(i * btnW, 0, btnW, btnH);
            //设置点击事件
            [btn addTarget:self action:@selector(clickTitle:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:btn];
            
            if(i == 1){
                // 添加下划线
                // 下划线宽度 = 按钮文字宽度
                // 下划线中心点x = 按钮中心点x
                
                CGFloat h = 2;
                CGFloat y = 40;
                // 先计算文字尺寸,在给label去赋值
                [btn.titleLabel sizeToFit];
                UIView *lineView = [[UIView alloc] init];
                
                lineView.height = h;
                lineView.width = btn.titleLabel.width;
                lineView.centerX = btn.centerX;
                lineView.top = y;
                lineView.backgroundColor = [UIColor whiteColor];
                
                self.lineView = lineView;
                
                [self addSubview:self.lineView];
            }
        }
        
    }
    return self;
}

-(void)scrollingTo:(NSInteger)tag{
    UIButton *button = self.buttons[tag];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.lineView.centerX = button.centerX;
    } completion:nil];
}

-(void)clickTitle:(UIButton *)button{
    
    self.block(button.tag);
    
//    [UIView animateWithDuration:0.2 animations:^{
//        self.lineView.centerX = button.centerX;
//    } completion:nil];
    [self scrollingTo:button.tag];
}

@end
