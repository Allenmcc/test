//
//  MainViewCell.h
//  SimpleGlow
//
//  Created by danny on 15/9/30.
//  Copyright (c) 2015年 danny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *subject;
@property (nonatomic, strong) UILabel *firstName;
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UILabel *subTitle;
@property (nonatomic, strong) UILabel* firstComment;
@property (nonatomic, assign) NSInteger num;
@property (nonatomic, strong) UILabel *countLabel;

@end
