//
//  LGBadgeButton.h
//  LGBadgeButtonDemo
//
//  Created by liuge on 9/11/15.
//  Copyright (c) 2015 ZiXuWuYou. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef IB_DESIGNABLE
IB_DESIGNABLE
#endif

#ifndef IBInspectable
#define IBInspectable
#endif

@interface LGBadgeButton : UIButton

@property (nonatomic, copy) IBInspectable NSString *badgeText;

@property (nonatomic, strong) IBInspectable UIFont *badgeTextFont;

@property (nonatomic, strong) IBInspectable UIColor *badgeTextColor;

@property (nonatomic, strong) IBInspectable UIColor *badgeBackgroundColor;

@end
