  扔数据源即可
  FHPickerView *alertView = [[FHPickerView alloc] initWithDataSource:@[@"每周日", @"每周一", @"每周二", @"每周三", @"每周四", @"每周五", @"每周六"]];
    alertView.leftBlock = ^{
        [[HWPopTool sharedInstance] closeWithBlcok:nil];
        
    };
    
    alertView.rightBlock = ^(NSArray *weekAry) {
        
    };
    
    [alertView showAnimated:NO];

![image](https://github.com/liujieyuu/CustomActionSheet/raw/master/pic/IMG7285.png)
