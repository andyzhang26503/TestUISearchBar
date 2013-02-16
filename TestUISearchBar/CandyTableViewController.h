//
//  CandyTableViewController.h
//  TestUISearchBar
//
//  Created by zhang andy on 13-2-16.
//  Copyright (c) 2013年 com.andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Candy.h"
@interface CandyTableViewController : UITableViewController<UISearchBarDelegate,UISearchDisplayDelegate>

@property (nonatomic,strong) NSMutableArray *candyArray;
@property (nonatomic,strong) NSMutableArray *filteredCandyArray;
@property (weak, nonatomic) IBOutlet UISearchBar *candySearchBar;
@end
