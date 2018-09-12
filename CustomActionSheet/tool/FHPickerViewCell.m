//
//  FHPickerViewCell.m
//  DUDU_C
//
//  Created by pastjie on 2018/9/10.
//  Copyright © 2018年 刘杰. All rights reserved.
//

#import "FHPickerViewCell.h"

@implementation FHPickerViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self addContentView];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)addContentView {
    
    UILabel *title = [[UILabel alloc] init];
    title.textColor = UIColorFromHex(0x333333);
    title.font = [UIFont systemFontOfSize:15];
    self.titleLab = title;
    [self.contentView addSubview:title];
    
    self.clickImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sceneself_btn_gou_on_2_img"]];
     [self.contentView addSubview:self.clickImg];
    
    WS(ws);
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(@15);
        make.centerY.equalTo(ws.contentView);
    }];
    
    [self.clickImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(@-10);
//        make.width.height.equalTo(@35);
        make.centerY.equalTo(ws.contentView);
    }];
    
}

-(void)layoutSubviews
{
    for (UIControl *control in self.subviews){
        if ([control isMemberOfClass:NSClassFromString(@"UITableViewCellAccessoryType")]){
            for (UIView *v in control.subviews)
            {
                if ([v isKindOfClass: [UIImageView class]]) {
                    UIImageView *img=(UIImageView *)v;
                    if (self.selected) {
                        img.image=[UIImage imageNamed:@"sceneself_btn_gou_on"];
                    }else
                    {
                        img.image=[UIImage imageNamed:@"sceneself_btn_gou_on_2_img"];
                    }
                }
            }
        }
    }
    [super layoutSubviews];
}


//适配第一次图片为空的情况
- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    for (UIControl *control in self.subviews){
        if ([control isMemberOfClass:NSClassFromString(@"UITableViewCellEditControl")]){
            for (UIView *v in control.subviews)
            {
                if ([v isKindOfClass: [UIImageView class]]) {
                    UIImageView *img=(UIImageView *)v;
                    if (!self.selected) {
                        img.image=[UIImage imageNamed:@"sceneself_btn_gou_on_2_img"];
                    }
                }
            }
        }
    }
    
}
@end
