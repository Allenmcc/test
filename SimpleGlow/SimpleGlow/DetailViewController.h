//
//  DetailViewController.h
//  SimpleGlow
//
//  Created by danny on 15/10/1.
//  Copyright (c) 2015年 danny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController


@property (nonatomic,strong) NSString *subTitle;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *commentCount;
@property (nonatomic,strong) NSString *viewCount;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *timeCreated;

@property (nonatomic,strong) NSMutableArray *commentArray;
@end
