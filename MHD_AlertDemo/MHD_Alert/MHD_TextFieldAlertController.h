//
//  MHD_TextFieldAlertController.h
//  MHD_AlertDemo
//
//  Created by Ardee on 2018/8/1.
//  Copyright © 2018年 马赫迪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MHD_TextFieldAlertController : NSObject

+ (void)mhd_oneTextFieldTitle:(NSString *)titleStr message:(NSString *)messageStr placeholder:(NSString *)placeholderStr cancelTitle:(NSString *)cancelStr cancelClick:(void(^)(NSString *contextStr))cancelComplent confirmTitle:(NSString *)confirmStr confirmClick:(void(^)(NSString *contextStr))confirmComplent;
@end
