/**
 * iLasse
 *
 * Created by Lasse Kehler
 * Copyright (c) 2015 Omegapoint. All rights reserved.
 */

#import "TiRootViewController+Extend.h"
#import "TiUtils.h"
#import <objc/runtime.h>
#include "TiApp.h"

@implementation TiRootViewController (Extend)

/*
 * Workaround for <select> bug in UIWebView
 */
-(void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    //NSLog(@"[INFO] iLasse: presentViewController");
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_USEC), dispatch_get_main_queue(),
                   ^{
                       [super presentViewController:viewControllerToPresent animated:flag completion:completion];
                   });
}

-(void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    //NSLog(@"[INFO] iLasse: dismissViewControllerAnimated");
    if (completion)
    {
        completion();
    }
    
    [super dismissViewControllerAnimated:NO completion:nil];
}

@end