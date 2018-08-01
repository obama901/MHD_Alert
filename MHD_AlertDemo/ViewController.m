//
//  ViewController.m
//  MHD_AlertDemo
//
//  Created by 马赫迪 on 2018/8/1.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import "ViewController.h"
#import "MHD_Alert.h"

//屏幕尺寸
#define MAIN_SIZE ([ [ UIScreen mainScreen ] bounds ].size)
#define MHD_ALERT_CELL @"mhd_alert_cell"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,retain)UITableView *mhdAlertTable;
@end

@implementation ViewController
{
    NSMutableArray *alertTypeArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    alertTypeArr = [NSMutableArray arrayWithObjects:@"无按钮alert弹框",@"单按钮alert弹框",@"双按钮alert弹框",@"多按钮alert弹框",@"",@"",@"",@"",@"",@"", nil];
    
}
#pragma mark alert展示列表
- (UITableView *)mhdAlertTable
{
    if (!_mhdAlertTable) {
        _mhdAlertTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MAIN_SIZE.width, MAIN_SIZE.height) style:UITableViewStyleGrouped];
        _mhdAlertTable.delegate = self;
        _mhdAlertTable.dataSource = self;
        [_mhdAlertTable registerClass:[UITableViewCell class] forCellReuseIdentifier:MHD_ALERT_CELL];
        [self.view addSubview:_mhdAlertTable];
    }
    return _mhdAlertTable;
}
#pragma mark 返回单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MHD_ALERT_CELL forIndexPath:indexPath];
    
    return cell;
}
#pragma mark 返回单元格个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
#pragma mark 返回区的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
}
#pragma mark 单元格点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
