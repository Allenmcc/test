//
//  MainViewCell.m
//  SimpleGlow
//
//  Created by danny on 15/9/30.
//  Copyright (c) 2015年 danny. All rights reserved.
//


#import "MainViewCell.h"
#import "Common.h"

@implementation MainViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self buildUI];
    }
    return self;

}


-(void)buildUI
{
    self.subject = [[UILabel alloc]initWithFrame:CGRectMake(kBorderWidth, kBorderWidth,  kBorderLabel, kLabelHeight)];
    self.subject.textColor = [UIColor blueColor];
    self.subject.font = [UIFont systemFontOfSize:18];
    [self addSubview:self.subject];
    
    self.firstName = [[UILabel alloc]initWithFrame:CGRectMake(kBorderWidthName, _subject.frame.origin.y + _subject.frame.size.height , kNameWidth, kLabelHeight)];
    self.firstName.textColor = kColor(102, 96, 197);
    [self addSubview:self.firstName];
    
    UILabel *responded = [[UILabel alloc]initWithFrame:CGRectMake(_firstName.frame.origin.x + _firstName.frame.size.width, _subject.frame.origin.y + _subject.frame.size.height, 100, kLabelHeight)];
    responded.text = @"responded";
    responded.textColor = [UIColor grayColor];
    [self addSubview:responded];
    
    self.headImage = [[UIImageView alloc]initWithFrame:CGRectMake(responded.frame.origin.x + responded.frame.size.width + 100, _subject.frame.size.height , kImageWidth, kImageWidth)];
    self.headImage.image = [UIImage imageNamed:@"headImage.png"];
    self.headImage.layer.masksToBounds = YES;
    self.headImage.layer.cornerRadius = 25;
    [self addSubview:self.headImage];
    
    self.subTitle = [[UILabel alloc]initWithFrame:CGRectMake(kBorderWidthName, _firstName.frame.origin.y + _subject.frame.size.height , kBorderLabel, kLabelHeight)];
    self.subTitle.textColor = kColor(107, 163, 169);
    [self addSubview:self.subTitle];
    
    self.firstComment = [[UILabel alloc]initWithFrame:CGRectMake(kBorderWidthName, _subTitle.frame.origin.y + _subTitle.frame.size.height  ,320 , kLabelHeight)];
    self.firstComment.textColor = kColor(136, 136, 195);
   [self addSubview:self.firstComment];
    
     self.countLabel = [[UILabel alloc]initWithFrame:CGRectMake(kBorderWidthName, _firstComment.frame.origin.y + _firstComment.frame.size.height, 30, kLabelHeight)];
//    countLabel.text = [NSString stringWithFormat:@"%ld",(long)self.num];
    self.countLabel.textColor = [UIColor grayColor];
    [self addSubview:self.countLabel];
    
    UILabel *responses = [[UILabel alloc]initWithFrame:CGRectMake(_countLabel.frame.origin.x + _countLabel.frame.size.width, _firstComment.frame.origin.y + _firstComment.frame.size.height, 100, kLabelHeight)];
    responses.text = @"responses";
    responses.textColor = [UIColor grayColor];
    [self addSubview:responses];

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




@end
