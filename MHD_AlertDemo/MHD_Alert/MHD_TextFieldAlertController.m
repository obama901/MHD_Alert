//
//  MHD_TextFieldAlertController.m
//  MHD_AlertDemo
//
//  Created by Ardee on 2018/8/1.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import "MHD_TextFieldAlertController.h"
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
    [self presentAlertController:alertControl];
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
    [self presentAlertController:alertControl];
}
#pragma mark 多输入框多按钮弹框
+ (void)mhd_moreTextFieldTitle:(NSString *)titleStr message:(NSString *)messageStr placeHolders:(NSArray<NSString *> *)placeHolders buttonTitleAry:(NSArray<NSString *> *)btnAry buttonClick:(void (^)(int, NSArray<NSString *> *))complent
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
    [self presentAlertController:alertControl];
}
#pragma mark 推出提示框
+ (void)presentAlertController:(UIAlertController *)alertControl
{
    if ([self getCurrentVC].navigationController) {
        [[self getCurrentVC].navigationController presentViewController:alertControl animated:true completion:nil];
    }else if([self getPresentedViewController]){
        [[self getPresentedViewController] presentViewController:alertControl animated:true completion:nil];
    }else{
        [[self getCurrentVC] presentViewController:alertControl animated:true completion:nil];
    }
}
#pragma mark 获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}
#pragma mark 获取当前屏幕中present出来的viewcontroller
+ (UIViewController *)getPresentedViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    if (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}
@end
