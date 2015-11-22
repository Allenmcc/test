//
//  MainViewController.m
//  SimpleGlow
//
//  Created by danny on 15/9/30.
//  Copyright (c) 2015年 danny. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewCell.h"
#import "DetailViewController.h"

@interface MainViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSMutableArray *tagsArray;
@property(nonatomic,strong)NSMutableArray *firstNameArray;
@property(nonatomic,strong)NSMutableArray *subTitleArray;
@property(nonatomic,strong)NSMutableArray *contentArray;
@property(nonatomic,strong)NSMutableArray *commentArray;
@property(nonatomic,strong)NSMutableArray *viewsArray;
@property(nonatomic,strong)NSMutableArray *timeCreated;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildUI];
    [self loadViewDataSourceFromPlist];
//    [self loadDataSource];
    
}

-(void)loadViewDataSourceFromPlist
{
    NSString *addressPath = [[NSBundle mainBundle]pathForResource:@"content" ofType:@"plist"];
    _dataArray = [[NSMutableArray alloc]initWithContentsOfFile:addressPath];
    _tagsArray = [_dataArray valueForKey:@"tag"];
    _firstNameArray = [_dataArray valueForKey:@"first_name"];
    _subTitleArray = [_dataArray valueForKey:@"title"];
    _contentArray = [_dataArray valueForKey:@"content"];
    _commentArray = [_dataArray valueForKey:@"comments"];
    _viewsArray = [_dataArray valueForKey:@"views"];
    _timeCreated = [_dataArray valueForKey:@"time_created"];
    NSLog(@"%@",self.dataArray);

}



-(void)loadDataSource
{
    NSError *error = nil;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"content.json" ofType:nil];
    
    NSString *jsonStr = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSData *data = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
    id jsonArray =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];

    NSLog(@"%@",jsonArray);
    
}
-(void)buildUI
{
    self.title = @"Glow";
    self.view.backgroundColor = [UIColor redColor];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --getter
-(NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;

}

-(NSMutableArray *)tagsArray
{
    if (_tagsArray == nil) {
        _tagsArray = [[NSMutableArray alloc]init];
    }
    return _tagsArray;

}

-(NSMutableArray *)firstNameArray
{
    
    if (_firstNameArray == nil) {
        _firstNameArray = [[NSMutableArray alloc]init];
    }
    return _firstNameArray;

}


-(NSMutableArray*)subTitleArray
{
    if (_subTitleArray == nil) {
        _subTitleArray = [[NSMutableArray alloc]init];
    }
    return _subTitleArray;

}


-(NSMutableArray *)contentArray
{
    if (_contentArray == nil) {
        _contentArray = [[NSMutableArray alloc]init];
    }
    return _contentArray;


}


-(NSMutableArray *)commentArray
{
    if (_commentArray == nil) {
        _contentArray = [[NSMutableArray alloc]init];
    }
    return _commentArray;

}

-(NSMutableArray *)viewsArray
{
    if (_viewsArray == nil) {
        _viewsArray = [[NSMutableArray alloc]init];
    }
    return _viewsArray;

}

-(NSMutableArray *)timeCreated
{
    if (_timeCreated == nil) {
        _timeCreated = [[NSMutableArray alloc]init];
    }
    return _timeCreated;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArray count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180;


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"MainViewCell";
    MainViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[MainViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

    }
    cell.subject.text = [_tagsArray objectAtIndex:indexPath.row];
    cell.firstName.text = [_firstNameArray objectAtIndex:indexPath.row];
    cell.subTitle.text = [_subTitleArray objectAtIndex:indexPath.row];
    cell.firstComment.text = [_contentArray objectAtIndex:indexPath.row];
    cell.countLabel.text =[NSString stringWithFormat:@"%ld",[[_commentArray objectAtIndex:indexPath.row] count]];
    
 
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *VC = [[DetailViewController alloc]init];
    if (indexPath.section == 0) {
        VC.subTitle = [_subTitleArray objectAtIndex:indexPath.row];
        VC.content = [_contentArray objectAtIndex:indexPath.row];
        VC.commentCount = [NSString stringWithFormat:@"%ld",[_commentArray count]];
        VC.commentArray = [_commentArray objectAtIndex:indexPath.row];
        VC.viewCount =  [NSString stringWithFormat:@"%@",[_viewsArray objectAtIndex:indexPath.row]];
        VC.name = [_firstNameArray objectAtIndex:indexPath.row];
        VC.timeCreated = [NSString stringWithFormat:@"%@",[_timeCreated objectAtIndex:indexPath.row]];;

    }
    [self.navigationController pushViewController:VC animated:YES];

}

@end
