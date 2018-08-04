//
//  MHD_AlertController.h
//  testDemo
//
//  Created by 马赫迪 on 2018/8/1.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHD_AlertController : NSObject

/**
 无按钮的alert框

 @param titleStr alert标题
 @param messageStr alert信息
 @param time 显示时间
 @param complent alert消失后的事件
 */
+ (void)mhd_alertTitle:(NSString *)titleStr message:(NSString *)messageStr delayTime:(NSTimeInterval)time click:(void(^)(void))complent;
/**
 一个按钮的alert框

 @param titleStr alert标题
 @param messageStr alert信息
 @param btnStr 按钮标题
 @param complent 按钮点击事件
 */
+ (void)mhd_oneButtonAlertTitle:(NSString *)titleStr message:(NSString *)messageStr btnTitle:(NSString *)btnStr btnClick:(void(^)(void))complent;
/**
 两个按钮的alert框

 @param titleStr alert标题
 @param messageStr alert信息
 @param confirmStr 确定按钮标题
 @param confirmComplent 确定按钮点击事件
 @param cancelStr 取消按钮标题
 @param cancelComplent 取消按钮点击事件
 */
+ (void)mhd_twoButtonAlertTitle:(NSString *)titleStr message:(NSString *)messageStr confirmTitle:(NSString *)confirmStr confirmClick:(void(^)(void))confirmComplent cancelTitle:(NSString *)cancelStr cancelClick:(void(^)(void))cancelComplent;
/**
 多按钮alert提示框

 @param titleStr alert标题
 @param messageStr alert信息
 @param btnAry 按钮标题数组
 @param complent 按钮点击事件
 */
+ (void)mhd_moreButtonAlertTitle:(NSString *)titleStr message:(NSString *)messageStr buttonTitleAry:(NSArray <NSString *>*)btnAry buttonClick:(void(^)(int btnOrder))complent;
/**
 无按钮的sheet框

 @param titleStr sheet标题
 @param messageStr sheet信息
 @param time 显示时间
 @param complent sheet框消失事件
 */
+ (void)mhd_sheetTitle:(NSString *)titleStr message:(NSString *)messageStr delayTime:(NSTimeInterval)time click:(void(^)(void))complent;
/**
 一个按钮的sheet提示框

 @param titleStr sheet标题
 @param messageStr sheet信息
 @param btnStr 按钮标题
 @param complent 按钮点击事件
 */
+ (void)mhd_oneButtonSheetTitle:(NSString *)titleStr message:(NSString *)messageStr btnTitle:(NSString *)btnStr btnClick:(void(^)(void))complent;
/**
 两个按钮的sheet提示框

 @param titleStr sheet标题
 @param messageStr sheet信息
 @param confirmStr 确认按钮标题
 @param confirmComplent 确认按钮点击事件
 @param cancelStr 取消按钮标题
 @param cancelComplent 取消按钮点击事件
 */
+ (void)mhd_twoButtonSheetTitle:(NSString *)titleStr message:(NSString *)messageStr confirmTitle:(NSString *)confirmStr confirmClick:(void(^)(void))confirmComplent cancelTitle:(NSString *)cancelStr cancelClick:(void(^)(void))cancelComplent;
/**
 多按钮的sheet提示框

 @param titleStr sheet标题
 @param messageStr sheet信息
 @param btnAry 按钮数组
 @param complent 按钮点击事件
 */
+ (void)mhd_moreButtonSheetTitle:(NSString *)titleStr message:(NSString *)messageStr buttonTitleAry:(NSArray <NSString *>*)btnAry buttonClick:(void(^)(int btnOrder))complent;
/**
 多按钮alert弹框(可选按钮类型)
 按钮style:
 UIAlertActionStyleDefault = 0,默认样式
 UIAlertActionStyleCancel = 1,取消按钮样式,字体加粗,一个弹框只允许有一个取消样式按钮
 UIAlertActionStyleDestructive = 2,红色字体按钮
 @param titleStr alert标题
 @param messageStr alert信息
 @param btnAry 按钮标题数组
 @param styleAry 按钮风格数组
 @param complent 按钮点击事件
 */
+ (void)mhd_moreButtonAlertFlexibleTitle:(NSString *)titleStr message:(NSString *)messageStr buttonTitleAry:(NSArray <NSString *>*)btnAry styleAry:(NSArray <NSNumber *>*)styleAry buttonClick:(void(^)(int btnOrder))complent;
/**
 多按钮的sheet提示框(可选按钮类型)
 按钮style:
 UIAlertActionStyleDefault = 0,默认样式
 UIAlertActionStyleCancel = 1,取消按钮样式,字体加粗,一个弹框只允许有一个取消样式按钮
 UIAlertActionStyleDestructive = 2,红色字体按钮
 @param titleStr sheet标题
 @param messageStr sheet信息
 @param btnAry 按钮标题数组
 @param styleAry 按钮风格数组
 @param complent 按钮点击事件
 */
+ (void)mhd_moreButtonSheetFlexibleTitle:(NSString *)titleStr message:(NSString *)messageStr buttonTitleAry:(NSArray *)btnAry styleAry:(NSArray *)styleAry buttonClick:(void(^)(int btnOrder))complent;
@end
