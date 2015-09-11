//
//  ViewController.m
//  LGBadgeButtonDemo
//
//  Created by liuge on 9/11/15.
//  Copyright (c) 2015 ZiXuWuYou. All rights reserved.
//

#import "ViewController.h"
#import "LGBadgeButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    LGBadgeButton *button = [LGBadgeButton buttonWithType:UIButtonTypeSystem];
    
    button.frame = (CGRect){100, 100, 100, 50};
    
    [self.view addSubview:button];
    
    button.backgroundColor = [UIColor lightGrayColor];
    button.badgeText = @"SALE";
    
    button.layer.cornerRadius = 2;
    [button setBackgroundColor:[UIColor colorWithRed:61 / 255.f green:182 / 255.f blue:128 / 255.f alpha:1]];
    [button setTitle:@"$12.99" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
