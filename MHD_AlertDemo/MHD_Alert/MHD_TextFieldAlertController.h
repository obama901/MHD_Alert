//
//  MHD_TextFieldAlertController.h
//  MHD_AlertDemo
//
//  Created by Ardee on 2018/8/1.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHD_TextFieldAlertController : NSObject


/**
 单输入框双按钮弹框

 @param titleStr alert标题
 @param messageStr alert信息
 @param placeholderStr 输入框占位字
 @param cancelStr 取消按钮
 @param confirmStr 确认按钮标题
 @param complent 按钮点击回调
 */
+ (void)mhd_oneTextFieldTitle:(NSString *)titleStr message:(NSString *)messageStr placeholder:(NSString *)placeholderStr cancelTitle:(NSString *)cancelStr confirmTitle:(NSString *)confirmStr click:(void(^)(BOOL isConfirm, NSString *contextStr))complent;

/**
 双输入框双按钮弹框

 @param titleStr alert标题
 @param messageStr alert信息
 @param fPlaceStr 输入框1占位字
 @param sPlaceStr 输入框2占位字
 @param cancelStr 取消按钮
 @param confirmStr 确认按钮标题
 @param complent 按钮点击回调
 */
+ (void)mhd_twoTextFieldTitle:(NSString *)titleStr message:(NSString *)messageStr firstPlace:(NSString *)fPlaceStr secondPlace:(NSString *)sPlaceStr cancelTitle:(NSString *)cancelStr confirmTitle:(NSString *)confirmStr click:(void(^)(BOOL isConfirm,NSString *firstStr,NSString *secondStr))complent;
+ (void)mhd_moreTextFieldTitle:(NSString *)titleStr message:(NSString *)messageStr placeHolders:(NSArray <NSString *>*)placeHolders buttonTitleAry:(NSArray <NSString *>*)btnAry buttonClick:(void(^)(int btnOrder,NSArray <NSString *>*contextArr))complent;
@end
