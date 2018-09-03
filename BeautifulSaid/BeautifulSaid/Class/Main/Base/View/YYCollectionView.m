//
//  YYCollectionView.m
//  BeautifulSaid
//
//  Created by power on 2018/9/3.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import "YYCollectionView.h"

@implementation YYCollectionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    self.delaysContentTouches = NO;
    self.canCancelContentTouches = YES;
//    self.separatorStyle = UITableViewCellSeparatorStyleNone;
#ifdef __IPHONE_11_0
//    self.estimatedRowHeight = 0;
//    self.estimatedSectionHeaderHeight = 0;
//    self.estimatedSectionFooterHeight = 0;
    if ([self respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
#endif
    // Remove touch delay (since iOS 8)
    UIView *wrapView = self.subviews.firstObject;
    // UITableViewWrapperView
    if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
        for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
            // UIScrollViewDelayedTouchesBeganGestureRecognizer
            if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"] ) {
                gesture.enabled = NO;
                break;
            }
        }
    }
    
    return self;
}

//- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
//    self = [super initWithFrame:frame style:style];
//    self.delaysContentTouches = NO;
//    self.canCancelContentTouches = YES;
//    self.separatorStyle = UITableViewCellSeparatorStyleNone;
//#ifdef __IPHONE_11_0
//    self.estimatedRowHeight = 0;
//    self.estimatedSectionHeaderHeight = 0;
//    self.estimatedSectionFooterHeight = 0;
//    if ([self respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
//        if (@available(iOS 11.0, *)) {
//            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        } else {
//            // Fallback on earlier versions
//        }if (@available(iOS 11.0, *)) {
//            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//        } else {
//            // Fallback on earlier versions
//        }
//    }
//#endif
//
//    // Remove touch delay (since iOS 8)
//    UIView *wrapView = self.subviews.firstObject;
//    // UITableViewWrapperView
//    if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
//        for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
//            // UIScrollViewDelayedTouchesBeganGestureRecognizer
//            if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"] ) {
//                gesture.enabled = NO;
//                break;
//            }
//        }
//    }
//
//    return self;
//}

- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
    if ( [view isKindOfClass:[UIControl class]]) {
        return YES;
    }
    return [super touchesShouldCancelInContentView:view];
}


@end
