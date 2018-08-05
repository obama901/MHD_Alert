# MHD_Alert
封装系统原生弹框,实现一句话调用.

# 说明
系统原生的提示框调用起来需要很多句话,所以特地将提示框分类封装,实现一句话调用,可以更便捷的开发.

# 使用方法
* 无需传入显示在哪个视图上,默认显示在当前视图

### 无按钮的alert弹框
![](http://mhd-picture.oss-cn-beijing.aliyuncs.com/18-8-6/56875619.jpg)

```
/**
 无按钮的alert框

 @param titleStr alert标题
 @param messageStr alert信息
 @param time 显示时间
 @param complent alert消失后的事件
 */
[MHD_AlertController mhd_alertTitle:@"无按钮Alert" message:@"MHD_Message" delayTime:1.f click:^{
                        NSLog(@"[MHD_AlertController]无按钮alert消失");
                    }];
```

### 一个按钮的alert框
![](http://mhd-picture.oss-cn-beijing.aliyuncs.com/18-8-6/76716857.jpg)

```
/**
 一个按钮的alert框

 @param titleStr alert标题
 @param messageStr alert信息
 @param btnStr 按钮标题
 @param complent 按钮点击事件
 */
 [MHD_AlertController mhd_oneButtonAlertTitle:@"单按钮Alert" message:@"MHD_Message" btnTitle:@"MHD_按钮标题" btnClick:^{
                        NSLog(@"[MHD_AlertController]单按钮alert点击");
                    }];
```

### 双按钮alert弹框
![](http://mhd-picture.oss-cn-beijing.aliyuncs.com/18-8-6/47093205.jpg)

```
/**
 两个按钮的alert框

 @param titleStr alert标题
 @param messageStr alert信息
 @param confirmStr 确定按钮标题
 @param confirmComplent 确定按钮点击事件
 @param cancelStr 取消按钮标题
 @param cancelComplent 取消按钮点击事件
 */
[MHD_AlertController mhd_twoButtonAlertTitle:@"双按钮Alert" message:@"MHD_Message" confirmTitle:@"MHD_确定" confirmClick:^{
                        NSLog(@"[MHD_AlertController]双按钮alert确定");
                    } cancelTitle:@"MHD_取消" cancelClick:^{
                        NSLog(@"[MHD_AlertController]双按钮alert取消");
                    }];
```

### 多按钮alert弹框
![](http://mhd-picture.oss-cn-beijing.aliyuncs.com/18-8-6/11997616.jpg)

```
/**
 多按钮alert提示框

 @param titleStr alert标题
 @param messageStr alert信息
 @param btnAry 按钮标题数组
 @param complent 按钮点击事件
 */
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
```

### 多按钮样式alert弹框
![](http://mhd-picture.oss-cn-beijing.aliyuncs.com/18-8-6/55155068.jpg)

```
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
```

### 无按钮sheet弹框
![](http://mhd-picture.oss-cn-beijing.aliyuncs.com/18-8-6/5782050.jpg)

```
/**
 无按钮的sheet框

 @param titleStr sheet标题
 @param messageStr sheet信息
 @param time 显示时间
 @param complent sheet框消失事件
 */
[MHD_AlertController mhd_sheetTitle:@"无按钮Sheet" message:@"MHD_Message" delayTime:1.f click:^{
                        NSLog(@"[MHD_AlertController]无按钮sheet消失");
                    }];
```

### 单按钮sheet弹框
![](http://mhd-picture.oss-cn-beijing.aliyuncs.com/18-8-6/41533932.jpg)

```
/**
 一个按钮的sheet提示框

 @param titleStr sheet标题
 @param messageStr sheet信息
 @param btnStr 按钮标题
 @param complent 按钮点击事件
 */
[MHD_AlertController mhd_oneButtonSheetTitle:@"单按钮Sheet" message:@"MHD_Message" btnTitle:@"MHD_按钮标题" btnClick:^{
                        NSLog(@"[MHD_AlertController]单按钮sheet点击");
                    }];
```

### 双按钮sheet弹框
![](https://mhd-picture.oss-cn-beijing.aliyuncs.com/18-8-6/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-08-05%20at%2011.25.30.png)

```
/**
 两个按钮的sheet提示框

 @param titleStr sheet标题
 @param messageStr sheet信息
 @param confirmStr 确认按钮标题
 @param confirmComplent 确认按钮点击事件
 @param cancelStr 取消按钮标题
 @param cancelComplent 取消按钮点击事件
 */
[MHD_AlertController mhd_twoButtonSheetTitle:@"双按钮Sheet" message:@"MHD_Message" confirmTitle:@"MHD_确定" confirmClick:^{
                        NSLog(@"[MHD_AlertController]双按钮sheet确定");
                    } cancelTitle:@"MHD_取消" cancelClick:^{
                        NSLog(@"[MHD_AlertController]双按钮sheet取消");
                    }];
```

### 多按钮sheet弹框
![](https://mhd-picture.oss-cn-beijing.aliyuncs.com/18-8-6/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-08-05%20at%2011.25.33.png)

```
/**
 多按钮的sheet提示框

 @param titleStr sheet标题
 @param messageStr sheet信息
 @param btnAry 按钮数组
 @param complent 按钮点击事件
 */
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
```

### 多按钮样式sheet弹框
![](https://mhd-picture.oss-cn-beijing.aliyuncs.com/18-8-6/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-08-05%20at%2011.25.36.png)

```
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
```

### 单输入框双按钮弹框
![](https://mhd-picture.oss-cn-beijing.aliyuncs.com/18-8-6/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-08-05%20at%2011.25.41.png)

```
/**
 单输入框双按钮弹框

 @param titleStr alert标题
 @param messageStr alert信息
 @param placeholderStr 输入框占位字
 @param cancelStr 取消按钮
 @param confirmStr 确认按钮标题
 @param complent 按钮点击回调
 */
[MHD_TextFieldAlertController mhd_oneTextFieldTitle:@"单输入框Textfield" message:@"MHD_Message" placeholder:@"MHD_Placeholder" cancelTitle:@"MHD_取消" confirmTitle:@"MHD_确认" click:^(BOOL isConfirm, NSString *contextStr) {
                        NSLog(@"[MHD_TextFieldAlertController]%@ %@",isConfirm?@"确认":@"取消",contextStr);
                     }];
```

### 双输入框双按钮弹框
![](https://mhd-picture.oss-cn-beijing.aliyuncs.com/18-8-6/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-08-05%20at%2011.25.44.png)

```
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
[MHD_TextFieldAlertController mhd_twoTextFieldTitle:@"双输入框Textfield" message:@"MHD_Message" firstPlace:@"MHD_Placeholder1" secondPlace:@"MHD_Placeholder2" cancelTitle:@"MHD_取消" confirmTitle:@"MHD_确认" click:^(BOOL isConfirm, NSString *firstStr, NSString *secondStr) {
                        NSLog(@"[MHD_TextFieldAlertController]%@ %@ %@",isConfirm?@"确认":@"取消",firstStr,secondStr);
                    }];
```

### 多输入框多按钮弹框
![](https://mhd-picture.oss-cn-beijing.aliyuncs.com/18-8-6/Simulator%20Screen%20Shot%20-%20iPhone%208%20-%202018-08-05%20at%2011.25.47.png)

```
/**
 多输入框多按钮弹框

 @param titleStr alert标题
 @param messageStr alert信息
 @param placeHolders 输入框占位字数组
 @param btnAry 按钮标题数组
 @param complent 按钮点击回调
 */
[MHD_TextFieldAlertController mhd_moreTextFieldTitle:@"多输入框Textfield" message:@"MHD_Message" placeHolders:@[@"MHD_Placeholder1",@"MHD_Placeholder2",@"MHD_Placeholder3",@"MHD_Placeholder4"] buttonTitleAry:@[@"MHD_按钮1",@"MHD_按钮2",@"MHD_按钮3"] buttonClick:^(int btnOrder, NSArray<NSString *> *contextArr) {
                        NSLog(@"[MHD_TextFieldAlertController]按钮%d %@",btnOrder+1,contextArr);
                    }];
```

# 感谢
如果大家用着简单,记得Star哦😯,谢谢!