//
//  MBProgressHUD+Add.m
//  BiLin
//
//  Created by Liu Feng on 14-5-21.
//  Copyright (c) 2014年 inbilin. All rights reserved.
//

#import "MBProgressHUD+Add.h"

@implementation MBProgressHUD (Add)

+ (void)showProcessTip:(NSString *)tip {
    [self hideProcessTip];
    [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES withTitle:tip];
}

+ (void)showProcessTip:(NSString *)tip offY:(CGFloat)y {
    [self hideProcessTip];
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES withTitle:tip moveY:y];
    });
}

+ (void)hideProcessTip {
//    [MBProgressHUD hideHUDForView:[[UIApplication sharedApplication] keyWindow] animated:NO];
    [MBProgressHUD hideHUDsForViews:[UIApplication sharedApplication].windows animated:NO];
}

+ (void)showSuccessTip:(NSString *)tip {
    [self hideProcessTip];
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [MBProgressHUD showHUDInKeyWindowWithImage:@"ico_send_success" text:tip duration:1.5];
    });
}

+ (void)showFailTip:(NSString *)tip {
    [self hideProcessTip];
    double delayInSeconds = 0.5;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [MBProgressHUD showHUDInKeyWindowWithImage:@"ico_send_fail" text:tip duration:1];
    });
}

+ (void)showFailTipInFront:(NSString *)tip{
    [CATransaction begin];
    UIWindow *win = [[[UIApplication sharedApplication] windows] lastObject];
    [MBProgressHUD hideHUDForView:win animated:NO];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithWindow:win];
    [win addSubview:HUD];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ico_send_fail"]];
    [HUD removeFromSuperViewOnHide];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = tip;
    [HUD show:YES];
    [CATransaction commit];
    [HUD hide:YES afterDelay:1.5];
}

+ (void)showHUDInFrontWindowWithImage:(NSString *)imageName text:(NSString *)text detailText:(NSString *)detailsText detailFont:(UIFont *)detailsFont duration:(float)duration{
    [CATransaction begin];
    UIWindow *keyWindow = [[[UIApplication sharedApplication] windows] lastObject];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithWindow:keyWindow];
    [HUD setUserInteractionEnabled:YES];
    [keyWindow addSubview:HUD];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [HUD removeFromSuperViewOnHide];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = text;
    HUD.detailsLabelText = detailsText;
    HUD.detailsLabelFont = detailsFont;
    [HUD show:YES];
    [CATransaction commit];
    [HUD hide:YES afterDelay:duration];
}

+ (MB_INSTANCETYPE )showHUDAddedTo:(UIView *)view animated:(BOOL)animated withTitle:(NSString *)title
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.labelText = title;
    [view addSubview:hud];
    [hud show:animated];
    return hud;
}

+ (MB_INSTANCETYPE)showHUDAddedTo:(UIView *)view animated:(BOOL)animated withTitle:(NSString *)title moveY:(CGFloat) offY
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    hud.labelText = title;
    [hud setCenter:CGPointMake(hud.center.x, hud.center.y+offY)];
    [view addSubview:hud];
    [hud show:animated];
    return hud;
}

+ (void)hideHUDsForViews:(NSArray *)views animated:(BOOL)animated
{
    for (UIView *subview in views) {
        [MBProgressHUD hideAllHUDsForView:subview animated:animated];
    }
}

+ (MB_INSTANCETYPE)showHUDInKeyWindowWithImage:(NSString *)imageName text:(NSString *)text duration:(float)duration {
    [CATransaction begin];
    
    //    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    UIWindow *win = [[UIApplication sharedApplication] keyWindow];
    [MBProgressHUD hideHUDForView:win  animated:NO];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithWindow:win];
    
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [HUD removeFromSuperViewOnHide];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = text;
    
    [win addSubview:HUD];
    [HUD show:YES];
    
    [CATransaction commit];
    [HUD hide:YES afterDelay:duration];
    return HUD;
}

+ (MB_INSTANCETYPE)showHUDInKeyWindowWithImage:(NSString *)imageName text:(NSString *)text detailText:(NSString *)detailsText detailFont:(UIFont *)detailsFont duration:(float)duration {
    [CATransaction begin];
    
    //    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithWindow:keyWindow];
    [HUD setUserInteractionEnabled:YES];
    
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [HUD removeFromSuperViewOnHide];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.labelText = text;
    HUD.detailsLabelText = detailsText;
    HUD.detailsLabelFont = detailsFont;
    
    [keyWindow addSubview:HUD];
    [HUD show:YES];
    
    [CATransaction commit];
    [HUD hide:YES afterDelay:duration];
    
    return HUD;
}


@end
