//
//  ViewController.m
//  Demo
//
//  Created by Jowyer on 14-6-7.
//  Copyright (c) 2014年 jo2studio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    int tableCellCount;
}

- (void)viewDidLoad
{
    // Define if tableview has header? footer?
    [self defineExistenceOfHeader:YES Footer:YES];
    
    // After definition, [super viewDidLoad];
    [super viewDidLoad];
    
    tableCellCount = 10;
}

#pragma mark- Inherited Methods
// When there is a Header
-(void)headerViewBeginsRefreshing;
{
    NSLog(@"headerViewBeginsRefreshing...");
    [self performSelector:@selector(doneRefreshingTableViewData) withObject:nil afterDelay:2];
}

// When there is a Footer
-(void)footerViewBeginsRefreshing
{
    NSLog(@"footerViewBeginsRefreshing...");
    tableCellCount += 2;
    [self performSelector:@selector(doneRefreshingTableViewData) withObject:nil afterDelay:2];
}

#pragma mark- TableView Delegate & DataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return tableCellCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    cell.contentView.backgroundColor = [UIColor grayColor];
    return cell;
}
@end
