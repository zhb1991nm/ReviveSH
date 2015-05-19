//
//  HomePageViewController.h
//  ReviveSH
//
//  Created by zhb on 15/5/19.
//  Copyright (c) 2015年 wonders. All rights reserved.
//

#import "BaseViewController.h"

@interface HomePageViewController : BaseViewController

@end

@interface ShowObject : NSObject

@property (nonatomic,copy) NSString *url;

@property (nonatomic,assign) CGFloat height;

@end
