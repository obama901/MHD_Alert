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

+ (void)mhd_oneTextFieldTitle:(NSString *)titleStr message:(NSString *)messageStr placeholder:(NSString *)placeholderStr cancelTitle:(NSString *)cancelStr cancelClick:(void (^)(NSString *))cancelComplent confirmTitle:(NSString *)confirmStr confirmClick:(void (^)(NSString *))confirmComplent
{
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    [alertControl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = placeholderStr;
    }];
    [alertControl addAction:[UIAlertAction actionWithTitle:cancelStr style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelComplent(alertControl.textFields.firstObject.text);
    }]];
    [alertControl addAction:[UIAlertAction actionWithTitle:confirmStr style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        confirmComplent(alertControl.textFields.firstObject.text);
    }]];
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
