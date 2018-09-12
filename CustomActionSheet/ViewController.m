//
//  ViewController.m
//  CustomActionSheet
//
//  Created by pastjie on 2018/9/10.
//  Copyright © 2018年 pastjie. All rights reserved.
//

#import "ViewController.h"
#import "FHPickerView.h"
#import "HWPopTool.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnAction;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.btnAction addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)click{
    FHPickerView *alertView = [[FHPickerView alloc] initWithDataSource:@[@"每周日", @"每周一", @"每周二", @"每周三", @"每周四", @"每周五", @"每周六"]];
    alertView.leftBlock = ^{
        [[HWPopTool sharedInstance] closeWithBlcok:nil];
        
    };
    
    alertView.rightBlock = ^(NSArray *weekAry) {
        
    };
    
    [alertView showAnimated:NO];
}
@end
