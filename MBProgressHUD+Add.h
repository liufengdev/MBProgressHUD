//
//  MBProgressHUD+Add.h
//  BiLin
//
//  Created by Liu Feng on 14-5-21.
//  Copyright (c) 2014年 inbilin. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (Add)

+ (void)showProcessTip:(NSString *)tip;
+ (void)showProcessTip:(NSString *)tip offY:(CGFloat)y;
+ (void)hideProcessTip;
+ (void)showSuccessTip:(NSString *)tip;
+ (void)showFailTip:(NSString *)tip;
+ (void)showFailTipInFront:(NSString *)tip;
+ (void)showHUDInFrontWindowWithImage:(NSString *)imageName text:(NSString *)text detailText:(NSString *)detailsText detailFont:(UIFont *)detailsFont duration:(float)duration;

+ (MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view animated:(BOOL)animated withTitle:(NSString *)title;
+ (MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view animated:(BOOL)animated withTitle:(NSString *)title moveY:(CGFloat) offY;
+ (MB_INSTANCETYPE)showHUDInKeyWindowWithImage:(NSString *)imageName text:(NSString *)text duration:(float)duration ;
+ (MB_INSTANCETYPE)showHUDInKeyWindowWithImage:(NSString *)imageName text:(NSString *)text detailText:(NSString *)detailsText detailFont:(UIFont *)detailsFont duration:(float)duration ;
@end
