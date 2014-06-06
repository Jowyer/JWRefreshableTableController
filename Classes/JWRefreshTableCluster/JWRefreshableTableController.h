//
//  JWRefreshableTableController.h
//  MyEgoRefresh
//
//  Created by Jowyer on 14-6-6.
//  Copyright (c) 2014年 jo2studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JWRefreshableTableController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

-(void)defineExistenceOfHeader:(BOOL)headerExist Footer:(BOOL)footerExist;
-(void)doneRefreshingTableViewData;

@end
