//
//  FHPickerViewCell.h
//  DUDU_C
//
//  Created by pastjie on 2018/9/10.
//  Copyright © 2018年 刘杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FHPickerViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIImageView *clickImg;
@property (nonatomic,assign) BOOL selectedRow;

@end
