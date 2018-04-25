//
//  SHRMainViewController.m
//  YingKe_OC
//
//  Created by huarong on 2018/4/24.
//  Copyright © 2018年 huarong. All rights reserved.
//

#import "SHRMainViewController.h"
#import "SHRMainTopView.h"

@interface SHRMainViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *contentView;

@property(strong, nonatomic) NSArray *datalist;

@property(strong, nonatomic) SHRMainTopView *topView;

@end

@implementation SHRMainViewController

//懒加载topView
-(SHRMainTopView *)topView{
    if(!_topView){
        _topView = [[SHRMainTopView alloc] initWithFrame:CGRectMake(0, 0, 200, 50) andTitles:self.datalist];
        __weak typeof(self) weakSelf = self;
        _topView.block = ^(NSInteger tag) {
            [weakSelf.contentView setContentOffset:CGPointMake(tag * SCREEN_WIDTH, weakSelf.contentView.contentOffset.y) animated:YES];
        };
        
    }
    return _topView;
}

//懒加载数据列表
-(NSArray *)datalist{
    if (!_datalist){
        _datalist = @[@"关注",@"热门",@"附近"];
    }
    return _datalist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)setupUI{
    //设置导航控制器
    [self setupNav];
    //添加子控制器
    [self setupChildVCs];
}

-(void)setupNav{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:nil action:nil];
    self.navigationItem.titleView = self.topView;
}

-(void)setupChildVCs{
    NSArray *vcNames = @[@"SHRFocusViewController",@"SHRHotViewController",@"SHRNearViewController"];
    for (int i = 0; i < vcNames.count; i++) {
        NSString *vcName = vcNames[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc] init];
        vc.title = self.datalist[i];
        [self addChildViewController:vc];
    }
    //将子控制器上的view添加到主控制器contentView上
    
    //设置contentView的contentsize
    self.contentView.contentSize = CGSizeMake(SCREEN_WIDTH * self.datalist.count, 0);
    //默认移动到第二个子控制器
    self.contentView.contentOffset = CGPointMake(SCREEN_WIDTH, 0);
    
    [self scrollViewDidEndDecelerating:self.contentView];
}


//动画停止时调用
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    CGFloat width = SCREEN_WIDTH;
    CGFloat height = SCREEN_HEIGHT;
    CGFloat offsetX = scrollView.contentOffset.x;
    //获取索引
    NSInteger idx = offsetX / width;
    
    [self.topView scrollingTo:idx];
    
    UIViewController *childVC = self.childViewControllers[idx];
    
    //视图控制器是否加载过
    if([childVC isViewLoaded]) return;
    
    childVC.view.frame = CGRectMake(offsetX, 0, width, height);
    [scrollView addSubview:childVC.view];
}

//减速停止时调用
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

@end
