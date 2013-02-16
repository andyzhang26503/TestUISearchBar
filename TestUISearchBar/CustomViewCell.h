//
//  CustomViewCell.h
//  TestUISearchBar
//
//  Created by zhang andy on 13-2-16.
//  Copyright (c) 2013年 com.andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewCell : UITableViewCell
- (IBAction)candyNameButton:(id)sender;
- (IBAction)candyCategoryButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *candyNameButton;
@property (weak, nonatomic) IBOutlet UIButton *candyCategoryButton;

@end
