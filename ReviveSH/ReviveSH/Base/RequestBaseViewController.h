//
//  RequestBaseViewController.h
//  ReviveSH
//
//  Created by zhb on 15/5/24.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "BaseViewController.h"
#import "NetWorkManager.h"

@interface RequestBaseViewController : BaseViewController

@property (nonatomic,strong) NetWorkManager *requestManager;

@property (nonatomic,strong) UIButton *requestAgainButton;

-(IBAction)requestAgain:(UIButton *)sender;

@end
