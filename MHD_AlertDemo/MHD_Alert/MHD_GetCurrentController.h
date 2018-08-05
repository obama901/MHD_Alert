//
//  MHD_GetCurrentController.h
//  MHD_AlertDemo
//
//  Created by Ardee on 2018/8/5.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIAlertController,UIViewController;
@interface MHD_GetCurrentController : NSObject

/**
 展示alertController

 @param alertControl 需要展示的alertController
 */
+ (void)mhd_presentAlertController:(UIAlertController *)alertControl;

/**
 获取当前屏幕显示的viewcontroller

 @return 返回viewcontroller
 */
+ (UIViewController *)getCurrentVC;

/**
 获取当前屏幕中present出来的viewcontroller

 @return 返回viewcontroller
 */
+ (UIViewController *)getPresentedViewController;
@end
