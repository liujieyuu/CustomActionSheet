//
//  FHPickerView.m
//  DUDU_C
//
//  Created by pastjie on 2018/9/7.
//  Copyright © 2018年 刘杰. All rights reserved.
//

#import "FHPickerView.h"
#import "FHPickerViewCell.h"
#import "HWPopTool.h"
@interface FHPickerView()<UITableViewDelegate, UITableViewDataSource>

@property (assign, nonatomic) NSIndexPath    *selIndex;   //单选选中的行

@end
static NSString *cellIdentifier = @"weekCell";

@implementation FHPickerView



-(instancetype)initWithDataSource:(NSArray *)dataSource{
    self = [super init];
    if (self) {
        self.dataAry = dataSource;
        self.frame = CGRectMake(0.0, 0.0, SCREEN_WIDTH - 50, 50*dataSource.count + 70);
         [HWPopTool sharedInstance].shadeBackgroundType = ShadeBackgroundTypeSolid;
        [self addContentView];
    }
    return self;
}
- (void)addContentView {
    _selectDataAry = [NSMutableArray array];
      _isSingle = NO;
    //表格
    self.mTableview = [[UITableView alloc] init];
    self.mTableview.backgroundColor = [UIColor whiteColor];
    self.mTableview.tableFooterView = [UIView new];
    self.mTableview.frame = self.frame;
    self.mTableview.delegate = self;
    self.mTableview.dataSource = self;
     self.mTableview.showsVerticalScrollIndicator = NO;
    self.mTableview.showsHorizontalScrollIndicator = NO;
    [self.mTableview registerClass:[FHPickerViewCell class] forCellReuseIdentifier:cellIdentifier];
     self.mTableview.scrollEnabled = NO;
    [self addSubview:self.mTableview];
    if (self.dataAry.count > 5) {
        self.mTableview.scrollEnabled = YES;

    }
 }



#pragma mark -- table data & delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataAry.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //取消之前的选择
     if (_isSingle) {    //单选
         [_selectDataAry removeAllObjects];
         [_selectIndexs removeAllObjects];
        //取消之前的选择
    FHPickerViewCell *celled = [_mTableview cellForRowAtIndexPath:_selIndex];
        celled.accessoryType = UITableViewCellAccessoryCheckmark;
        [celled.clickImg setImage:[UIImage imageNamed:@"sceneself_btn_gou_on_2_img"]  ];
        //记录当前的选择的位置
        _selIndex = indexPath;
        //当前选择的打钩
  FHPickerViewCell *cells = [_mTableview cellForRowAtIndexPath:indexPath];
        cells.accessoryType = UITableViewCellAccessoryCheckmark;
        [cells.clickImg setImage:[UIImage imageNamed:@"sceneself_btn_gou_on"] ];
         [_selectIndexs addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]; //添加索引数据到数组
         [_selectDataAry addObject:_dataAry[indexPath.row]];
        
    }else{           //多选
 FHPickerViewCell *cell = [_mTableview cellForRowAtIndexPath:indexPath];        if (cell.accessoryType == UITableViewCellAccessoryCheckmark) { //如果为选中状态
            cell.accessoryType = UITableViewCellAccessoryNone;
            [cell.clickImg setImage:[UIImage imageNamed:@"sceneself_btn_gou_on_2_img"]  ]; //切换为未选中
            [_selectIndexs removeObject:indexPath]; //数据移除
     [_selectDataAry removeObject:_dataAry[indexPath.row]];
     [_selectIndexs removeObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
         }else { //未选中
        
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            [cell.clickImg setImage:[UIImage imageNamed:@"sceneself_btn_gou_on"]  ]; //切换为选中
            [_selectIndexs addObject:[NSString stringWithFormat:@"%ld",(long)indexPath.row]]; //添加索引数据到数组
             [_selectDataAry addObject:_dataAry[indexPath.row]];

         }
}
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 70.f;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    //尾视图
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0, SCREEN_WIDTH-50, 70)];
    footView.backgroundColor = UIColorFromHex(0xF9F9F9);
    //取消按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake((SCREEN_WIDTH - 50) / 2 / 2 - 120 / 2, 70 / 2 - 40 / 2, 120, 40);
    leftBtn.layer.masksToBounds = YES;
    leftBtn.layer.cornerRadius = 7.f;
    leftBtn.layer.borderWidth = 1.0f;
    [leftBtn setTitle:@"取消" forState: UIControlStateNormal];
    leftBtn.layer.borderColor = UIColorFromHex(0xfc7e7c).CGColor;
    [leftBtn setTitleColor:UIColorFromHex(0x999999) forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:leftBtn];
    //确定按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake((SCREEN_WIDTH - 50) / 2 / 2 - 120 / 2 + (SCREEN_WIDTH - 50) / 2, 70 / 2 - 40 / 2, 120, 40);
    rightBtn.layer.masksToBounds = YES;
    rightBtn.layer.cornerRadius = 7.f;
    rightBtn.layer.borderWidth = 1.0f;
    rightBtn.layer.borderColor = UIColorFromHex(0x45bd61).CGColor;
    [rightBtn setTitle:@"确定" forState: UIControlStateNormal];
    [rightBtn setTitleColor:UIColorFromHex(0x999999) forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:rightBtn];
    return footView;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FHPickerViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
   
    cell.titleLab.text = _dataAry[indexPath.row];
     cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.selectedRow = NO;

    if (_isSingle) {
        cell.accessoryType = UIAccessibilityTraitNone;
        
        //单选
        if (_selIndex == indexPath) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            [cell.clickImg setImage:[UIImage imageNamed:@"sceneself_btn_gou_on"] ];
        }else{
            cell.accessoryType = UITableViewCellAccessoryNone;
            [cell.clickImg setImage:[UIImage imageNamed:@"sceneself_btn_gou_on_2_img"]  ];
            
        }
        cell.accessoryView = [UIView new];
        
        return cell;
    }else{           //多选
        cell.accessoryType = UIAccessibilityTraitNone;
        for (NSIndexPath *index in _selectIndexs) {
            if (indexPath == index) {
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
                [cell.clickImg setImage:[UIImage imageNamed:@"sceneself_btn_gou_on"]  ];
            }
        }
    }
    cell.accessoryView = [UIView new];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50.f;
}

#pragma mark -- button aciton

/**
 取消
 
 @param sender sender description
 */
- (void)leftBtnAction:(UIButton *)sender {
    
    self.leftBlock();
    [[HWPopTool sharedInstance] closeWithBlcok:nil];

}

/**
 确定
 
 @param sender sender description
 */
- (void)rightBtnAction:(UIButton *)sender {
    
 
        self.rightBlock(_selectDataAry);
    [[HWPopTool sharedInstance] closeWithBlcok:nil];

}

- (void)showAnimated:(BOOL)animated{
    [[HWPopTool sharedInstance] showWithPresentView:self animated:animated];

}
@end
