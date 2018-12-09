//
//  AllStarsTableViewController.m
//  Dota Helper
//
//  Created by 高志刚 on 15/9/30.
//  Copyright © 2015年 高志刚. All rights reserved.
//

#import "AllStarsTableViewController.h"
#import "AllStars.h"

@interface AllStarsTableViewController ()
@property (strong, nonatomic) IBOutlet AllStars *AllStarsTable;
@property (weak,nonatomic) NSMutableDictionary* ReturnDic;
@property (weak, nonatomic) IBOutlet UISearchBar *Search;
@property (strong,nonatomic) NSArray* SearchResult;

@end

@implementation AllStarsTableViewController
-(void)TheReturnChosen:(NSMutableDictionary*)ReturnDic
{
    _ReturnDic=ReturnDic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.AllStarsTable.delegate=self;
    self.AllStarsTable.dataSource=self.AllStarsTable;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.AllStarsTable) {
        NSString* ReturnName=[self.AllStarsTable NameKeyOfChosen:indexPath.row];
        [self.ReturnDic setObject:ReturnName forKey:@"ChosenName"];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        NSString* ReturnName=[self.SearchResult objectAtIndex:indexPath.row];
        [self.ReturnDic setObject:ReturnName forKey:@"ChosenName"];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText     //called when text changes (including clear)

{
    /**
    if ([searchBar.text length]!=0)
        
    {
        
        self.InSearchingMode=YES;
        
        [self.ClassAndDirectoriesTable reloadData];
        
    }
    
    else
        
    {
        
        self.InSearchingMode=NO;
        
        [self.ClassAndDirectoriesTable reloadData];
        
    }
    **/
}


-(BOOL)searchDisplayController:(UISearchController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    NSLog(@"Scope %@",[self.Search scopeButtonTitles]);
    /*
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"SELF contains[cd] %@",
                                    searchString];
    
    SearchResult = [recipes filteredArrayUsingPredicate:resultPredicate];
    */
    self.SearchResult=[[NSArray alloc] initWithArray:[self.AllStarsTable SelectForNick:searchString]];
    
    return YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.SearchResult count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* Cell=[tableView dequeueReusableCellWithIdentifier:@"Search"];  // Used by the delegate to acquire an already allocated cell, in lieu of allocating a new one.
    if (!Cell) {
        Cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Search"];
    }
    NSDictionary* ToShow=[self.AllStarsTable DetailOfChosenNameKey:[self.SearchResult objectAtIndex:indexPath.row]];
    //Cell.textLabel.text=[self.SearchResult objectAtIndex:indexPath.row];
    Cell.textLabel.text=[ToShow objectForKey:@"name"];

    return Cell;
}
@end
