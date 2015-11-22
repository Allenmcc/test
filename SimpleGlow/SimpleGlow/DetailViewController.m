//
//  DetailViewController.m
//  SimpleGlow
//
//  Created by danny on 15/10/1.
//  Copyright (c) 2015年 danny. All rights reserved.
//

#import "DetailViewController.h"
#import "DetailCell.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self buildUI];
}

-(void)buildUI
{
    self.title = @"Deatil";
   // self.view.backgroundColor = [UIColor redColor];
     self.tableView.tableFooterView = [[UIView alloc]init];


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return [self.commentArray count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"DetailViewCell";
    DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier ];
    if (cell == nil) {
        cell = [[DetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier index:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    if (indexPath.section == 0&&indexPath.row ==0) {
        
        cell.subTitle.text =  self.subTitle;
        cell.content.text = self.content;
        NSString *strComment = @"Comments";
        cell.commentCount.text = [[self.commentCount stringByAppendingString:strComment]stringByAppendingString:@"* "];
        NSString *strView = @"Views";
        cell.viewCount.text = [self.viewCount stringByAppendingString:strView];
        NSString *strName = @"Posted by ";
        cell.firstName.text = [[strName stringByAppendingString:self.name]stringByAppendingString:@" *"];
        cell.timeCreated.text = self.timeCreated;
        
    }else{
        cell.firstName.text = [[[self.commentArray  objectAtIndex:indexPath.row ] valueForKey:@"author"] valueForKey:@"first_name"];
      
        cell.timeCreated.text = [NSString stringWithFormat:@"%@",[[self.commentArray  objectAtIndex:indexPath.row ] valueForKey:@"time_created"]];
        cell.content.text = [[self.commentArray objectAtIndex:indexPath.row ] valueForKey:@"content"];
    
    
    }
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0 && indexPath.row == 0) {
        return 180;
    }
        return 120;
    
    
}

@end
