//
//  Candy.m
//  TestUISearchBar
//
//  Created by zhang andy on 13-2-16.
//  Copyright (c) 2013年 com.andy. All rights reserved.
//

#import "Candy.h"

@implementation Candy
@synthesize category;
@synthesize name;

+ (id)candyOfCategory:(NSString *)category name:(NSString *)name
{
    Candy *newCandy = [[self alloc] init];
    newCandy.category = category;
    newCandy.name = name;
    return newCandy;
}
@end
