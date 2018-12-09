//
//  AllStarWithSearchViewController.m
//  Dota Helper
//
//  Created by 高志刚 on 15/10/2.
//  Copyright © 2015年 高志刚. All rights reserved.
//

#import "AllStarWithSearchViewController.h"
#import "AllStars.h"

@interface AllStarWithSearchViewController ()
@property (weak,nonatomic) NSMutableDictionary* ReturnDic;
@property (strong,nonatomic) NSArray* SearchResult;

@property (weak, nonatomic) IBOutlet AllStars *AllStarsTable;
@property (weak, nonatomic) IBOutlet UISearchBar *Search;

@end

@implementation AllStarWithSearchViewController
-(void)TheReturnChosen:(NSMutableDictionary*)ReturnDic
{
    _ReturnDic=ReturnDic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.AllStarsTable.delegate=self;
    self.AllStarsTable.dataSource=self.AllStarsTable;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.AllStarsTable) {
        NSLog(@"Chosen in orginal");
        NSString* ReturnName=[self.AllStarsTable NameKeyOfChosen:indexPath.row];
        [self.ReturnDic setObject:ReturnName forKey:@"ChosenName"];
        NSLog(@"After set the self.ReturnDic is %@",self.ReturnDic);

        [self dismissViewControllerAnimated:YES completion:nil];
    }
    else
    {
        NSLog(@"Chosen in search");
        NSString* ReturnName=[self.SearchResult objectAtIndex:indexPath.row];
        [self.ReturnDic setObject:ReturnName forKey:@"ChosenName"];
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}


-(BOOL)searchDisplayController:(UISearchController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    NSLog(@"Scope %@",[self.Search scopeButtonTitles]);
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
    Cell.textLabel.text=[ToShow objectForKey:@"name"];
    
    return Cell;
}
@end
