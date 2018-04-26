//
//  SHRHotViewController.m
//  YingKe_OC
//
//  Created by huarong on 2018/4/25.
//  Copyright © 2018年 huarong. All rights reserved.
//

#import "SHRHotViewController.h"
#import "SHRHotLiveHandler.h"
#import "SHRLive.h"

static NSString *ID = @"MyCell";

@interface SHRHotViewController ()

@property(nonatomic, strong) NSMutableArray *datalist;


@end

@implementation SHRHotViewController

-(NSMutableArray *)datalist{
    if(!_datalist){
        _datalist = [NSMutableArray array];
    }
    return _datalist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupUI];
    
    [self loadData];
}

-(void)setupUI{
    //注册cell
    [self.tableView registerClass:NSClassFromString(@"UITableViewCell") forCellReuseIdentifier:ID];
}

-(void)loadData{
    [SHRHotLiveHandler excuteGetHotLiveTaskWithSuccess:^(id obj) {
        
//        NSLog(@"%@",obj);
        [self.datalist addObjectsFromArray:obj];
        [self.tableView reloadData];
        
    } faild:^(id obj) {
        NSLog(@"失败   %@",obj);
    }];
}


#pragma mark:实现UITableView数据源方法&代理方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datalist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    SHRLive *live = self.datalist[indexPath.row];
    cell.textLabel.text = live.city;
    cell.textLabel.textColor = [UIColor greenColor];
    return cell;
}



@end
