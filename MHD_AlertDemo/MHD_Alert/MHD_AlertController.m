//
//  MHD_AlertController.m
//  testDemo
//
//  Created by 马赫迪 on 2018/8/1.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import "MHD_AlertController.h"
#import <UIKit/UIKit.h>

@implementation MHD_AlertController
#pragma mark 无按钮的alert框
+ (void)mhd_alertTitle:(NSString *)titleStr message:(NSString *)messageStr delayTime:(NSTimeInterval)time click:(void (^)(void))complent
{
    @autoreleasepool{
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
        if ([self getCurrentVC].navigationController) {
            [[self getCurrentVC].navigationController presentViewController:alertControl animated:true completion:^{
                dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time/*延迟执行时间*/ * NSEC_PER_SEC));
                dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                    [alertControl dismissViewControllerAnimated:true completion:^{
                        complent();
                    }];
                });
            }];
        }else if([self getPresentedViewController]){
            [[self getPresentedViewController] presentViewController:alertControl animated:true completion:^{
                dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time/*延迟执行时间*/ * NSEC_PER_SEC));
                dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                    [alertControl dismissViewControllerAnimated:true completion:^{
                        complent();
                    }];
                });
            }];
        }else{
            [[self getCurrentVC] presentViewController:alertControl animated:true completion:^{
                dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time/*延迟执行时间*/ * NSEC_PER_SEC));
                dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                    [alertControl dismissViewControllerAnimated:true completion:^{
                        complent();
                    }];
                });
            }];
        }
    }
}
#pragma mark 一个按钮的alert框
+ (void)mhd_oneButtonAlertTitle:(NSString *)titleStr message:(NSString *)messageStr btnTitle:(NSString *)btnStr btnClick:(void (^)(void))complent
{
    @autoreleasepool{
        UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
        [alertControl addAction:[UIAlertAction actionWithTitle:btnStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            complent();
        }]];
        [self presentAlertController:alertControl];
    }
}
#pragma mark 两个按钮的alert框
+ (void)mhd_twoButtonAlertTitle:(NSString *)titleStr message:(NSString *)messageStr confirmTitle:(NSString *)confirmStr confirmClick:(void (^)(void))confirmComplent cancelTitle:(NSString *)cancelStr cancelClick:(void (^)(void))cancelComplent
{
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    [alertControl addAction:[UIAlertAction actionWithTitle:cancelStr style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelComplent();
    }]];
    [alertControl addAction:[UIAlertAction actionWithTitle:confirmStr style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        confirmComplent();
    }]];
    [self presentAlertController:alertControl];
}
#pragma mark 多按钮alert提示框
+ (void)mhd_moreButtonAlertTitle:(NSString *)titleStr message:(NSString *)messageStr buttonTitleAry:(NSArray *)btnAry buttonClick:(void (^)(int))complent
{
     UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    for (int i = 0; i < btnAry.count; i ++)
    {
        [alertControl addAction:[UIAlertAction actionWithTitle:btnAry[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            complent(i);
        }]];
    }
    [self presentAlertController:alertControl];
}
#pragma mark 多按钮alert弹框(可选按钮类型)
+ (void)mhd_moreButtonAlertFlexibleTitle:(NSString *)titleStr message:(NSString *)messageStr buttonTitleAry:(NSArray *)btnAry styleAry:(NSArray *)styleAry buttonClick:(void (^)(int))complent
{
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    for (int i = 0; i < btnAry.count; i ++)
    {
        NSInteger styleInt = [styleAry[i] integerValue];
        [alertControl addAction:[UIAlertAction actionWithTitle:btnAry[i] style:styleInt handler:^(UIAlertAction * _Nonnull action) {
            complent(i);
        }]];
    }
    [self presentAlertController:alertControl];
}
#pragma mark 无按钮的sheet框
+ (void)mhd_sheetTitle:(NSString *)titleStr message:(NSString *)messageStr delayTime:(NSTimeInterval)time click:(void (^)(void))complent
{
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleActionSheet];
    if ([self getCurrentVC].navigationController) {
        [[self getCurrentVC].navigationController presentViewController:alertControl animated:true completion:^{
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time/*延迟执行时间*/ * NSEC_PER_SEC));
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                [alertControl dismissViewControllerAnimated:true completion:complent];
            });
        }];
    }else if([self getPresentedViewController]){
        [[self getPresentedViewController] presentViewController:alertControl animated:true completion:^{
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time/*延迟执行时间*/ * NSEC_PER_SEC));
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                [alertControl dismissViewControllerAnimated:true completion:complent];
            });
        }];
    }else{
        [[self getCurrentVC] presentViewController:alertControl animated:true completion:^{
            dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time/*延迟执行时间*/ * NSEC_PER_SEC));
            dispatch_after(delayTime, dispatch_get_main_queue(), ^{
                [alertControl dismissViewControllerAnimated:true completion:complent];
            });
        }];
    }
}
#pragma mark 一个按钮的sheet提示框
+ (void)mhd_oneButtonSheetTitle:(NSString *)titleStr message:(NSString *)messageStr btnTitle:(NSString *)btnStr btnClick:(void (^)(void))complent
{
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleActionSheet];
    [alertControl addAction:[UIAlertAction actionWithTitle:btnStr style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        complent();
    }]];
    [self presentAlertController:alertControl];
}
#pragma mark 两个按钮的sheet提示框
+ (void)mhd_twoButtonSheetTitle:(NSString *)titleStr message:(NSString *)messageStr confirmTitle:(NSString *)confirmStr confirmClick:(void (^)(void))confirmComplent cancelTitle:(NSString *)cancelStr cancelClick:(void (^)(void))cancelComplent
{
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleActionSheet];
    [alertControl addAction:[UIAlertAction actionWithTitle:confirmStr style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        confirmComplent();
    }]];
    [alertControl addAction:[UIAlertAction actionWithTitle:cancelStr style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        cancelComplent();
    }]];
    [self presentAlertController:alertControl];
}
#pragma mark 多按钮的sheet提示框
+ (void)mhd_moreButtonSheetTitle:(NSString *)titleStr message:(NSString *)messageStr buttonTitleAry:(NSArray *)btnAry buttonClick:(void (^)(int))complent
{
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i < btnAry.count; i ++) {
        [alertControl addAction:[UIAlertAction actionWithTitle:btnAry[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            complent(i);
        }]];
    }
    [self presentAlertController:alertControl];
}
#pragma mark 多按钮的sheet提示框(可选按钮类型)
+ (void)mhd_moreButtonSheetFlexibleTitle:(NSString *)titleStr message:(NSString *)messageStr buttonTitleAry:(NSArray *)btnAry styleAry:(NSArray *)styleAry buttonClick:(void (^)(int))complent
{
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleActionSheet];
    for (int i = 0; i < btnAry.count; i ++)
    {
        NSInteger styleInt = [styleAry[i] integerValue];
        [alertControl addAction:[UIAlertAction actionWithTitle:btnAry[i] style:styleInt handler:^(UIAlertAction * _Nonnull action) {
            complent(i);
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
