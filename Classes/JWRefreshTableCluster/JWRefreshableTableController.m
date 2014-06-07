//
//  JWRefreshableTableController.m
//  MyEgoRefresh
//
//  Created by Jowyer on 14-6-6.
//  Copyright (c) 2014年 jo2studio. All rights reserved.
//

#import "JWRefreshableTableController.h"
#import "EGORefreshTableHeaderView.h"
#import "EGORefreshTableFooterView.h"

@interface JWRefreshableTableController ()<EGORefreshTableDelegate>

@end

@implementation JWRefreshableTableController
{
    EGORefreshTableHeaderView *refreshHeaderView;
    EGORefreshTableFooterView *refreshFooterView;
    
    BOOL isReloading;
    BOOL isHeaderExist;
    BOOL isFooterExist;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (isHeaderExist) [self createHeaderView];
    if (isFooterExist) [self setFooterView];
}

- (void)dealloc
{
    [self removeHeaderView];
    [self removeFooterView];
}

#pragma mark- Private Methods
-(void)createHeaderView
{
    [self removeFooterView];
	refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:
                         CGRectMake(0.0f, 0.0f - self.tableView.bounds.size.height,
                                    self.tableView.frame.size.width, self.tableView.bounds.size.height)];
    refreshHeaderView.delegate = self;
    
	[self.tableView addSubview:refreshHeaderView];
}

-(void)removeHeaderView
{
    if (refreshHeaderView)
    {
        if ([refreshHeaderView superview])
        {
            [refreshHeaderView removeFromSuperview];
        }
        refreshHeaderView = nil;
    }
}

-(void)setFooterView
{
    CGFloat height = MAX(self.tableView.contentSize.height, self.tableView.frame.size.height);
    if (refreshFooterView && [refreshFooterView superview])
    {
        refreshFooterView.frame = CGRectMake(0.0f, height, self.tableView.frame.size.width, self.view.bounds.size.height);
    }
    else
    {
        refreshFooterView = [[EGORefreshTableFooterView alloc] initWithFrame: CGRectMake(0.0f, height, self.tableView.frame.size.width, self.view.bounds.size.height)];
        refreshFooterView.delegate = self;
        [self.tableView addSubview:refreshFooterView];
    }
}

-(void)removeFooterView
{
    if (refreshFooterView)
    {
        if ([refreshFooterView superview])
        {
            [refreshFooterView removeFromSuperview];
        }
        refreshFooterView = nil;
    }
}

-(void)reloadTableViewData:(EGORefreshPos)aRefreshPos
{
    isReloading = YES;
    
    if(aRefreshPos == EGORefreshFooter)
    {
        [self footerViewBeginsRefreshing];
    }
    else if (aRefreshPos == EGORefreshHeader)
    {
        [self headerViewBeginsRefreshing];
    }
}

#pragma mark- Public Methods
-(void)defineExistenceOfHeader:(BOOL)headerExist Footer:(BOOL)footerExist
{
    isHeaderExist = headerExist;
    isFooterExist = footerExist;
}

-(void)doneRefreshingTableViewData
{
//    NSLog(@"doneRefreshingTableViewData");
    isReloading = NO;
    
    [self.tableView reloadData];
    if (refreshHeaderView)
    {
        [refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
    }
    
    if (refreshFooterView)
    {
        [refreshFooterView egoRefreshScrollViewDataSourceDidFinishedLoading:self.tableView];
        [self setFooterView];
    }
}

#pragma mark- Methods to be Inherited
-(void)headerViewBeginsRefreshing;
{
    NSLog(@"should inherit this function");
    assert(false);
}

-(void)footerViewBeginsRefreshing
{
    NSLog(@"should inherit this function");
    assert(false);
}

#pragma mark- EGORefreshTableDelegate
- (void)egoRefreshTableDidTriggerRefresh:(EGORefreshPos)aRefreshPos
{
    [self reloadTableViewData:aRefreshPos];
}

- (BOOL)egoRefreshTableDataSourceIsLoading:(UIView*)view
{
    return isReloading;
}

#pragma mark- UIScrollViewDelegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (refreshHeaderView)
    {
        [refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    }
    
	if (refreshFooterView)
    {
        [refreshFooterView egoRefreshScrollViewDidScroll:scrollView];
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (refreshHeaderView)
    {
        [refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    }
    
	if (refreshFooterView)
    {
        [refreshFooterView egoRefreshScrollViewDidEndDragging:scrollView];
    }
}

@end
