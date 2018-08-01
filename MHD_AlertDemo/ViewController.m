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
    NSMutableArray *sheetTypeArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    alertTypeArr = [NSMutableArray arrayWithObjects:@"无按钮alert弹框",@"单按钮alert弹框",@"双按钮alert弹框",@"多按钮alert弹框",@"多按钮样式alert弹框", nil];
    sheetTypeArr = [NSMutableArray arrayWithObjects:@"无按钮sheet弹框",@"单按钮sheet弹框",@"双按钮sheet弹框",@"多按钮sheet弹框",@"多按钮样式sheet弹框", nil];
    [self mhdAlertTable];
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
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = alertTypeArr[indexPath.row];
            break;
        case 1:
            cell.textLabel.text = sheetTypeArr[indexPath.row];
            break;
        default:
            cell.textLabel.text = @"";
            break;
    }
    return cell;
}
#pragma mark 返回单元格个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return alertTypeArr.count;
            break;
        case 1:
            return sheetTypeArr.count;
            break;
        default:
            return 0;
            break;
    }
}
#pragma mark 返回区的个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
#pragma mark 单元格点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    switch (indexPath.section) {
        case 0://alert
        {
            switch (indexPath.row) {
                case 0://无按钮alert弹框
                {
                    [MHD_AlertController mhd_alertTitle:@"无按钮Alert" message:@"MHD_Message" delayTime:1.f click:^{
                        NSLog(@"[MHD_AlertController]无按钮alert消失");
                    }];
                }
                    break;
                case 1://单按钮alert弹框
                {
                    [MHD_AlertController mhd_oneButtonAlertTitle:@"单按钮Alert" message:@"MHD_Message" btnTitle:@"MHD_按钮标题" btnClick:^{
                        NSLog(@"[MHD_AlertController]单按钮alert点击");
                    }];
                }
                    break;
                case 2://双按钮alert弹框
                {
                    [MHD_AlertController mhd_twoButtonAlertTitle:@"双按钮Alert" message:@"MHD_Message" confirmTitle:@"MHD_确定" confirmClick:^{
                        NSLog(@"[MHD_AlertController]双按钮alert确定");
                    } cancelTitle:@"MHD_取消" cancelClick:^{
                        NSLog(@"[MHD_AlertController]双按钮alert取消");
                    }];
                }
                    break;
                case 3://多按钮alert弹框
                {
                    [MHD_AlertController mhd_moreButtonAlertTitle:@"多按钮Alert" message:@"MHD_Message" buttonTitleAry:@[@"MHD_标题1",@"MHD_标题2",@"MHD_标题3",@"MHD_标题4"] buttonClick:^(int btnOrder)
                    {
                        switch (btnOrder) {
                            case 0:
                                NSLog(@"[MHD_AlertController]多按钮alert标题1");
                                break;
                            case 1:
                                NSLog(@"[MHD_AlertController]多按钮alert标题2");
                                break;
                            case 2:
                                NSLog(@"[MHD_AlertController]多按钮alert标题3");
                                break;
                            case 3:
                                NSLog(@"[MHD_AlertController]多按钮alert标题4");
                                break;
                            default:
                                NSLog(@"[MHD_AlertController]多按钮alert默认");
                                break;
                        }
                    }];
                }
                    break;
                case 4://多按钮样式alert弹框
                {
                    [MHD_AlertController mhd_moreButtonAlertFlexibleTitle:@"多按钮样式Alert" message:@"MHD_Message" buttonTitleAry:@[@"MHD_灵活标题1",@"MHD_灵活标题2",@"MHD_灵活标题3",@"MHD_灵活标题4"] styleAry:@[@0,@1,@2,@2] buttonClick:^(int btnOrder) {
                        switch (btnOrder) {
                            case 0:
                                NSLog(@"[MHD_AlertController]多按钮样式alert标题1");
                                break;
                            case 1:
                                NSLog(@"[MHD_AlertController]多按钮样式alert标题2");
                                break;
                            case 2:
                                NSLog(@"[MHD_AlertController]多按钮样式alert标题3");
                                break;
                            case 3:
                                NSLog(@"[MHD_AlertController]多按钮样式alert标题4");
                                break;
                            default:
                                NSLog(@"[MHD_AlertController]多按钮样式alert默认");
                                break;
                        }
                    }];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        case 1://sheet
        {
            switch (indexPath.row) {
                case 0://无按钮sheet弹框
                {
                    [MHD_AlertController mhd_sheetTitle:@"无按钮Sheet" message:@"MHD_Message" delayTime:1.f click:^{
                        NSLog(@"[MHD_AlertController]无按钮sheet消失");
                    }];
                }
                    break;
                case 1://单按钮sheet弹框
                {
                    [MHD_AlertController mhd_oneButtonSheetTitle:@"单按钮Sheet" message:@"MHD_Message" btnTitle:@"MHD_按钮标题" btnClick:^{
                        NSLog(@"[MHD_AlertController]单按钮sheet点击");
                    }];
                }
                    break;
                case 2://双按钮sheet弹框
                {
                    [MHD_AlertController mhd_twoButtonSheetTitle:@"双按钮Sheet" message:@"MHD_Message" confirmTitle:@"MHD_确定" confirmClick:^{
                        NSLog(@"[MHD_AlertController]双按钮sheet确定");
                    } cancelTitle:@"MHD_取消" cancelClick:^{
                        NSLog(@"[MHD_AlertController]双按钮sheet取消");
                    }];
                }
                    break;
                case 3://多按钮sheet弹框
                {
                    [MHD_AlertController mhd_moreButtonSheetTitle:@"多按钮Sheet" message:@"MHD_Message" buttonTitleAry:@[@"MHD_标题1",@"MHD_标题2",@"MHD_标题3",@"MHD_标题4"] buttonClick:^(int btnOrder)
                    {
                        switch (btnOrder) {
                            case 0:
                                NSLog(@"[MHD_AlertController]多按钮sheet标题1");
                                break;
                            case 1:
                                NSLog(@"[MHD_AlertController]多按钮sheet标题2");
                                break;
                            case 2:
                                NSLog(@"[MHD_AlertController]多按钮sheet标题3");
                                break;
                            case 3:
                                NSLog(@"[MHD_AlertController]多按钮sheet标题4");
                                break;
                            default:
                                NSLog(@"[MHD_AlertController]多按钮sheet默认");
                                break;
                        }
                    }];
                }
                    break;
                case 4://多按钮样式sheet弹框
                {
                    [MHD_AlertController mhd_moreButtonSheetFlexibleTitle:@"多按钮样式Sheet" message:@"MHD_Message" buttonTitleAry:@[@"MHD_灵活标题1",@"MHD_灵活标题2",@"MHD_灵活标题3",@"MHD_灵活标题4"] styleAry:@[@0,@1,@2,@2] buttonClick:^(int btnOrder) {
                        switch (btnOrder) {
                            case 0:
                                NSLog(@"[MHD_AlertController]多按钮样式sheet标题1");
                                break;
                            case 1:
                                NSLog(@"[MHD_AlertController]多按钮样式sheet标题2");
                                break;
                            case 2:
                                NSLog(@"[MHD_AlertController]多按钮样式sheet标题3");
                                break;
                            case 3:
                                NSLog(@"[MHD_AlertController]多按钮样式sheet标题4");
                                break;
                            default:
                                NSLog(@"[MHD_AlertController]多按钮样式sheet默认");
                                break;
                        }
                    }];
                }
                    break;
                    
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Alert弹框";
            break;
        case 1:
            return @"Sheet弹框";
            break;
        default:
            return @"";
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
