//
//  CandyTableViewController.m
//  TestUISearchBar
//
//  Created by zhang andy on 13-2-16.
//  Copyright (c) 2013年 com.andy. All rights reserved.
//

#import "CandyTableViewController.h"
#import "CustomViewCell.h"
#import "CandyDetailViewController.h"
#define CustomView @"CustomViewCell"
@interface CandyTableViewController ()

@end

@implementation CandyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //self.navigationController.title = @"CandySearch";
    self.navigationItem.title= @"CandySearch";
    //UINib *nib = [UINib nibWithNibName:@"CustomViewCell" bundle:nil];
    //[self.tableView registerNib:nib forCellReuseIdentifier:CustomView];
    // Sample Data for candyArray
    
    //[self.candySearchBar setShowsScopeBar:NO];
    self.searchDisplayController.searchBar.showsScopeBar = NO;
    [self.candySearchBar sizeToFit];
    
    CGRect newBounds = self.tableView.bounds;
    NSLog(@"x=%f,y=%f",newBounds.origin.x,newBounds.origin.y);
    newBounds.origin.y = newBounds.origin.y + self.candySearchBar.bounds.size.height;
    NSLog(@"x=%f,y=%f",newBounds.origin.x,newBounds.origin.y);
    self.tableView.bounds = newBounds;
    
//    CGRect newFrame = self.tableView.frame;
//    NSLog(@"x=%f,y=%f",newFrame.origin.x,newFrame.origin.y);
//    newFrame.origin.y = newFrame.origin.y - self.candySearchBar.bounds.size.height;
//    newFrame.origin.x = 44;
//    NSLog(@"x=%f,y=%f",newFrame.origin.x,newFrame.origin.y);
    
//    self.tableView.frame = newFrame;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(goToSearch)];
    
    self.candyArray = [NSArray arrayWithObjects:
                  [Candy candyOfCategory:@"chocolate" name:@"chocolate bar"],
                  [Candy candyOfCategory:@"chocolate" name:@"chocolate chip"],
                  [Candy candyOfCategory:@"chocolate" name:@"dark chocolate"],
                  [Candy candyOfCategory:@"hard" name:@"lollipop"],
                  [Candy candyOfCategory:@"hard" name:@"candy cane"],
                  [Candy candyOfCategory:@"hard" name:@"jaw breaker"],
                  [Candy candyOfCategory:@"other" name:@"caramel"],
                  [Candy candyOfCategory:@"other" name:@"sour chew"],
                  [Candy candyOfCategory:@"other" name:@"peanut butter cup"],
                  [Candy candyOfCategory:@"other" name:@"gummi bear"], nil];
    self.filteredCandyArray = [NSMutableArray arrayWithCapacity:self.candyArray.count];
    // Reload the table
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)goToSearch
{
    [self.candySearchBar becomeFirstResponder];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.filteredCandyArray count];
    }
    return [self.candyArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 106;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    CustomViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CustomView];
    if ( cell == nil ) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CustomViewCell" owner:nil options:nil];
        cell  = [array objectAtIndex:0];
    }
    
    // Create a new Candy Object
    Candy *candy = nil;

    if (tableView == self.searchDisplayController.searchResultsTableView) {
        candy = [self.filteredCandyArray objectAtIndex:indexPath.row];
    } else {
        candy = [self.candyArray objectAtIndex:indexPath.row];
    }
    
    // Configure the cell
    [cell.candyNameButton setTitle:candy.name forState:UIControlStateNormal];
    [cell.candyCategoryButton setTitle:candy.category forState:UIControlStateNormal];

    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CandyDetailViewController *dvc = [[CandyDetailViewController alloc] init];
    NSString *title;
    if (tableView==self.searchDisplayController.searchResultsTableView) {
        title = [(Candy *)[self.filteredCandyArray objectAtIndex:indexPath.row] name];
    }else{
        title = [(Candy *)[self.candyArray objectAtIndex:indexPath.row] name];
    }
    
    dvc.navigationItem.title = title;
    [[self navigationController] pushViewController:dvc animated:YES];
}

- (void)filterContentForSearchText:(NSString *)searchText scope:(NSString *)scope
{
    [self.filteredCandyArray removeAllObjects];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.name contains[c] %@",searchText];
    NSArray *tempArray = [self.candyArray filteredArrayUsingPredicate:predicate];
    if (![scope isEqualToString:@"All"]) {
        NSPredicate *scopePredicate = [NSPredicate predicateWithFormat:@"self.category contains[c] %@",scope];
        tempArray = [tempArray filteredArrayUsingPredicate:scopePredicate];
    }
    self.filteredCandyArray  = [NSMutableArray arrayWithArray:tempArray];
}


- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:self.searchDisplayController.searchBar.text scope:[self.searchDisplayController.searchBar.scopeButtonTitles objectAtIndex:searchOption]];
     return YES;
}
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:self.searchDisplayController.searchBar.selectedScopeButtonIndex]];
    return YES;
}
@end
