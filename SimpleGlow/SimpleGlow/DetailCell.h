//
//  DetailCell.h
//  SimpleGlow
//
//  Created by danny on 15/10/1.
//  Copyright (c) 2015年 danny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailCell : UITableViewCell

@property(nonatomic, strong) UILabel *subTitle;
@property(nonatomic, strong) UILabel *content;
@property(nonatomic, strong) UILabel *commentCount;
@property(nonatomic, strong) UILabel *viewCount;
@property(nonatomic, strong) UILabel *firstName;
@property(nonatomic, strong) UILabel *timeCreated;
@property(nonatomic, strong) UIImageView *headImageView;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier index:(NSIndexPath *)index;

@end
