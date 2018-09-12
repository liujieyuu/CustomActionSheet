//
//  FHPickerView.h
//  DUDU_C
//
//  Created by pastjie on 2018/9/7.
//  Copyright © 2018年 刘杰. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^leftBtnBlock)(void);
typedef void(^rightBtnBlock)(NSArray *selectAry );

@interface FHPickerView : UIView
- (instancetype)initWithDataSource:(NSArray *)dataSource;
- (void)addContentView;
-(void)showAnimated:(BOOL)animated;
@property (nonatomic, strong) UITableView *mTableview;

 @property (nonatomic, strong) NSArray *dataAry;//数据源
@property (nonatomic, strong) NSMutableArray *selectDataAry;//选中的数据
@property (nonatomic, assign) BOOL       isSingle;    //单选还是多选,默认多选

@property (nonatomic, copy) leftBtnBlock leftBlock;
@property (nonatomic, copy) rightBtnBlock rightBlock;
@property (strong, nonatomic) NSMutableArray  *selectIndexs;

@end
