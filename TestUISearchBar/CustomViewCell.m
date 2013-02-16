//
//  CustomViewCell.m
//  TestUISearchBar
//
//  Created by zhang andy on 13-2-16.
//  Copyright (c) 2013年 com.andy. All rights reserved.
//

#import "CustomViewCell.h"

@implementation CustomViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)candyNameButton:(id)sender {
}

- (IBAction)candyCategoryButton:(id)sender {
}
@end
