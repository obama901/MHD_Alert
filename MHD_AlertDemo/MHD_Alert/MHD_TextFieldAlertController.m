//
//  MHD_TextFieldAlertController.m
//  MHD_AlertDemo
//
//  Created by Ardee on 2018/8/1.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import "MHD_TextFieldAlertController.h"
#import "MHD_GetCurrentController.h"
#import <UIKit/UIKit.h>

@implementation MHD_TextFieldAlertController

#pragma mark 单输入框双按钮弹框
+ (void)mhd_oneTextFieldTitle:(NSString *)titleStr message:(NSString *)messageStr placeholder:(NSString *)placeholderStr cancelTitle:(NSString *)cancelStr confirmTitle:(NSString *)confirmStr click:(void(^)(BOOL isConfirm, NSString *contextStr))complent
{
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    [alertControl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholderStr;
    }];
    [alertControl addAction:[UIAlertAction actionWithTitle:cancelStr style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        complent(false,alertControl.textFields.firstObject.text);
    }]];
    [alertControl addAction:[UIAlertAction actionWithTitle:confirmStr style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        complent(true,alertControl.textFields.firstObject.text);
    }]];
    [MHD_GetCurrentController mhd_presentAlertController:alertControl];
}
#pragma mark 双输入框双按钮弹框
+ (void)mhd_twoTextFieldTitle:(NSString *)titleStr message:(NSString *)messageStr firstPlace:(NSString *)fPlaceStr secondPlace:(NSString *)sPlaceStr cancelTitle:(NSString *)cancelStr confirmTitle:(NSString *)confirmStr click:(void(^)(BOOL isConfirm,NSString *firstStr,NSString *secondStr))complent
{
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    [alertControl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = fPlaceStr;
    }];
    [alertControl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = sPlaceStr;
        textField.secureTextEntry = true;
    }];
    [alertControl addAction:[UIAlertAction actionWithTitle:cancelStr style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        complent(false,alertControl.textFields.firstObject.text,alertControl.textFields.lastObject.text);
    }]];
    [alertControl addAction:[UIAlertAction actionWithTitle:confirmStr style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        complent(true,alertControl.textFields.firstObject.text,alertControl.textFields.lastObject.text);
    }]];
    [MHD_GetCurrentController mhd_presentAlertController:alertControl];
}
#pragma mark 多输入框多按钮弹框
+ (void)mhd_moreTextFieldTitle:(NSString *)titleStr message:(NSString *)messageStr placeHolders:(NSArray<NSString *> *)placeHolders buttonTitleAry:(NSArray<NSString *> *)btnAry buttonClick:(void (^)(int, NSArray<NSString *> *))complent
{
    @autoreleasepool
    {
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
        for (int i = 0; i < placeHolders.count; i ++) {
            [alertControl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
                textField.placeholder = placeHolders[i];
            }];
        }
        for (int i = 0; i < btnAry.count; i ++) {
            [alertControl addAction:[UIAlertAction actionWithTitle:btnAry[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSMutableArray *contextArr = [NSMutableArray arrayWithCapacity:0];
                for (UITextField *alertTF in alertControl.textFields) {
                    [contextArr addObject:alertTF.text];
                }
                complent(i,contextArr);
            }]];
        }
        [MHD_GetCurrentController mhd_presentAlertController:alertControl];
    }
}


@end
