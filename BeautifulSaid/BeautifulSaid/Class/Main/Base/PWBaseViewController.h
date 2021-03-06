//
//  MLSBaseViewController.h
//  BeautifulSaid
//
//  Created by power on 2018/8/31.
//  Copyright © 2018年 BeautifulSaid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PWBaseViewController : UIViewController

@property (nonatomic, strong) ZMNavView       *navView;

@property (nonatomic,strong) PWSearchView *searchView;

- (void)setupNavView;

- (void)setupSeachView;

- (void)getRecommendData;

@end
