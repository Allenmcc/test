//
//  DetailCell.m
//  SimpleGlow
//
//  Created by danny on 15/10/1.
//  Copyright (c) 2015年 danny. All rights reserved.
//

#import "DetailCell.h"
#import "Common.h"

@implementation DetailCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier index:(NSIndexPath *)index

{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildUI:index];
    }
    return self;
    
}

-(void)buildUI:(NSIndexPath*)index
{
    if (index.section == 0 && index.row == 0) {
        _subTitle = [[UILabel alloc]initWithFrame:CGRectMake(kBorderWidth, kBorderWidth, kBorderLabel, kLabelHeight)];
        _subTitle.font = [UIFont systemFontOfSize:20];
        [self addSubview:self.subTitle];
        
    
        _content = [[UILabel alloc]initWithFrame:CGRectMake(kBorderWidth, _subTitle.frame.origin.y + _subTitle.frame.size.height, kContentWidth, kLabelHeight)];
//        NSLog(@"%@",NSStringFromCGRect(_content.frame));
        [self addSubview:self.content];
        
        _commentCount = [[UILabel alloc]initWithFrame:CGRectMake(kBorderWidth, _content.frame.origin.y + _subTitle.frame.size.height, 110, kLabelHeight)];
        _commentCount.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.commentCount];
        
        _viewCount = [[UILabel alloc]initWithFrame:CGRectMake(_commentCount.frame.origin.x + _commentCount.frame.size.width, _content.frame.origin.y + _subTitle.frame.size.height, 110, kLabelHeight)];
        _viewCount.font = [UIFont systemFontOfSize:16];
        [self addSubview:self.viewCount];
        
        _firstName = [[UILabel alloc]initWithFrame:CGRectMake(kBorderWidth, _commentCount.frame.origin.y + _commentCount.frame.size.height, kBorderLabel- 40, kLabelHeight)];
        _firstName.textColor = [UIColor grayColor];
        _firstName.font = [UIFont systemFontOfSize:14];
        [self addSubview:_firstName];
        
        _timeCreated = [[UILabel alloc]initWithFrame:CGRectMake(_firstName.frame.origin.x + _firstName.frame.size.width, _commentCount.frame.origin.y + _commentCount.frame.size.height, kBorderLabel, kLabelHeight)];
        _timeCreated.textColor = [UIColor grayColor];
        _timeCreated.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.timeCreated];
        
        UIButton *like = [[UIButton alloc]initWithFrame:CGRectMake(kBorderWidth, _firstName.frame.origin.y + _firstName.frame.size.height, 60, kLabelHeight)];
        [like setTitle:@"Like" forState:UIControlStateNormal];
        like.layer.cornerRadius = 5;
        [like setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        like.titleLabel.font = [UIFont systemFontOfSize:13];
        like.backgroundColor = kColor(234, 232, 241);
        [self addSubview:like];
        
        UIButton *share = [[UIButton alloc]initWithFrame:CGRectMake(like.frame.origin.x + like.frame.size.width + 10 , _firstName.frame.origin.y + _firstName.frame.size.height, 60, kLabelHeight)];
        
        [share setTitle:@"Share" forState:UIControlStateNormal];
        share.layer.cornerRadius = 5;
        [share setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        share.titleLabel.font = [UIFont systemFontOfSize:13];
        share.backgroundColor = kColor(234, 232, 241);
        [self addSubview:share];
        
        UILabel *report = [[UILabel alloc]initWithFrame:CGRectMake(share.frame.origin.x + share.frame.size.width + 100, _firstName.frame.origin.y + _firstName.frame.size.height, 120, kLabelHeight)];
        report.text = @"Report this post";
        report.font = [UIFont systemFontOfSize:13];
        report.textColor = [UIColor grayColor];
        [self addSubview:report];

    }else{
        _firstName = [[UILabel alloc]initWithFrame:CGRectMake(kBorderWidth, kBorderWidth, kNameWidth, kLabelHeight)];
        _firstName.textColor = [UIColor grayColor];
        _firstName.font = [UIFont systemFontOfSize:14];
        _firstName.textColor = kColor(119, 116, 194);
        [self addSubview:_firstName];
        
        _timeCreated = [[UILabel alloc]initWithFrame:CGRectMake(_firstName.frame.origin.x + _firstName.frame.size.width, kBorderWidth, kBorderLabel, kLabelHeight)];
        _timeCreated.textColor = [UIColor grayColor];
        _timeCreated.font = [UIFont systemFontOfSize:14];
        [self addSubview:self.timeCreated];
        
        _headImageView = [[UIImageView alloc]initWithFrame:CGRectMake(_timeCreated.frame.origin.x + _timeCreated.frame.size.width, kBorderWidth + 5, kImageWidth, kImageWidth)];
        self.headImageView.image = [UIImage imageNamed:@"headImage.png"];
        self.headImageView.layer.masksToBounds = YES;
        self.headImageView.layer.cornerRadius = 25;
        [self addSubview:_headImageView];
        
        _content = [[UILabel alloc]initWithFrame:CGRectMake(kBorderWidth, _firstName.frame.origin.y + _firstName.frame.size.height, kContentWidth, kLabelHeight)];
        _content.textColor = [UIColor blackColor];
        [self addSubview:self.content];

        UIButton *like = [[UIButton alloc]initWithFrame:CGRectMake(kBorderWidth, _content.frame.origin.y + _content.frame.size.height, 60, kLabelHeight)];
        [like setTitle:@"Like" forState:UIControlStateNormal];
        like.layer.cornerRadius = 5;
        [like setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        like.titleLabel.font = [UIFont systemFontOfSize:13];
        like.backgroundColor = kColor(234, 232, 241);
        [self addSubview:like];
        
        UIButton *share = [[UIButton alloc]initWithFrame:CGRectMake(like.frame.origin.x + like.frame.size.width + 10 , _content.frame.origin.y + _content.frame.size.height, 60, kLabelHeight)];
        
        [share setTitle:@"Share" forState:UIControlStateNormal];
        share.layer.cornerRadius = 5;
        [share setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        share.titleLabel.font = [UIFont systemFontOfSize:13];
        share.backgroundColor = kColor(234, 232, 241);
        [self addSubview:share];
        
        UILabel *report = [[UILabel alloc]initWithFrame:CGRectMake(share.frame.origin.x + share.frame.size.width + 100, _content.frame.origin.y + _content.frame.size.height, 120, kLabelHeight)];
        report.text = @"Report this reply";
        report.font = [UIFont systemFontOfSize:13];
        report.textColor = [UIColor grayColor];
        [self addSubview:report];

    
    }


}

#pragma mark --private
-(NSString*)dateFromLongLong:(long long)msSince1970{
    // 转换成nsdate
    NSDate *myDate =[NSDate dateWithTimeIntervalSince1970:msSince1970 / 1000];
    //转换成nssting
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    NSString *timeString = [dateFormatter stringFromDate:myDate];
    
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc]init];
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss zzz";
    fmt.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"en_US"];
    NSDate *date = [fmt dateFromString:timeString];
    //获取当前时间
    NSDate *now = [NSDate date];
    
    NSTimeInterval delta = [now timeIntervalSinceDate:date];
    //根据当前时间算出合理字符串
    if (delta < 60) {
        return @"刚刚";
    }else if(delta < 60*60){
        //%.f,小数点后不留
        return [NSString stringWithFormat:@"%.f分钟前",delta/60];
    }else if(delta <60*60*24){
        return [NSString stringWithFormat:@"%.f小时前",delta/60/60];
    }else{
        
        fmt.dateFormat = @"MM-dd HH:mm";
        return [fmt stringFromDate:date];
    }
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
