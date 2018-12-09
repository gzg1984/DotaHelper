//
//  AllStars.m
//  Dota Helper
//
//  Created by 高志刚 on 15/9/30.
//  Copyright © 2015年 高志刚. All rights reserved.
//

#import "AllStars.h"
@interface AllStars()

@property (strong,nonatomic)NSDictionary* AllStars;
@property (strong,nonatomic)NSMutableArray* SelectedArray;

@end

@implementation AllStars
-(NSMutableArray*)SelectForNick:(NSString*)NickName
{
    [self.SelectedArray removeAllObjects];
    for (NSString* KeyName in [self.AllStars allKeys]) {
        NSDictionary* Detail=[self.AllStars objectForKey:KeyName];
        /**Check Key Name **/
        NSRange Found=[KeyName.lowercaseString rangeOfString:NickName.lowercaseString];
        if (Found.location == NSNotFound) {
            /** Do nothing **/
        }
        else
        {
            [self.SelectedArray addObject:KeyName];
            continue;
        }
        /**Check Show Name **/
        NSString* ShowName=[Detail objectForKey:@"name"];
        if (ShowName) {
            NSRange Found=[ShowName rangeOfString:NickName.lowercaseString];
            if (Found.location == NSNotFound) {
                /** Do nothing **/
            }
            else
            {
                [self.SelectedArray addObject:KeyName];
                continue;
            }
        }
        /** Check Nick Name **/
        NSString* AllNickName=[Detail objectForKey:@"nickname"];
        if (AllNickName) {
            NSRange Found=[AllNickName rangeOfString:NickName.lowercaseString];
            if (Found.location == NSNotFound) {
                /** Do nothing **/
            }
            else
            {
                [self.SelectedArray addObject:KeyName];
            }
        }
    }
    NSLog(@"self.SelectedArray %@",self.SelectedArray );
    return self.SelectedArray;
}
-(NSMutableArray*)SelectedArray
{
    if(!_SelectedArray)
    {
        _SelectedArray=[[NSMutableArray alloc] init];
    }
    return _SelectedArray;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(NSDictionary*)AllStars
{
    if(!_AllStars)
    {
        NSBundle* mb=[NSBundle mainBundle];
        NSString* filefullpath=[[mb resourcePath] stringByAppendingPathComponent:@"data.plist"];
        _AllStars=[[NSDictionary alloc] initWithContentsOfFile:filefullpath];
        //NSLog(@"data.plist %@",_AllStars);
    }
    /*
     NSMutableDictionary* trywrite=[[NSMutableDictionary alloc] init];
     NSMutableDictionary* trywrite1=[[NSMutableDictionary alloc] init];
     [trywrite1 setObject:@"影魔" forKey:@"name"];
     [trywrite1 setObject:@"白牛" forKey:@"weak"];
     NSMutableDictionary* trywrite2=[[NSMutableDictionary alloc] init];
     [trywrite2 setObject:@"狗头" forKey:@"name"];
     [trywrite2 setObject:@"小牛" forKey:@"weak"];
     [trywrite setObject:trywrite1 forKey:@"sf"];
     [trywrite setObject:trywrite2 forKey:@"gt"];
     NSArray *UserSandBox=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
     
     NSString *UserSandBoxPath = [UserSandBox objectAtIndex:0];
     
     //得到完整的文件名
     
     //NSString* TargetFile= [UserSandBoxPath stringByAppendingPathComponent:@"data.plist"];
     //[trywrite writeToFile:TargetFile atomically:YES];
     //NSLog(@"Target File %@",TargetFile);
     */
    
    return _AllStars;
}


/*****Lazy **/
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[self.AllStars allKeys] count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
-(NSDictionary*)DetailOfChosen:(NSInteger)Index
{
    return [self.AllStars objectForKey:[[self.AllStars allKeys] objectAtIndex:Index]];

}
-(NSString*)NameKeyOfChosen:(NSInteger)Index
{
    return [[self.AllStars allKeys] objectAtIndex:Index];
}
-(NSDictionary*)DetailOfChosenNameKey:(NSString*)NameKey
{
    return [self.AllStars objectForKey:NameKey];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* Cell=[tableView dequeueReusableCellWithIdentifier:@"Stars"];  // Used by the delegate to acquire an already allocated cell, in lieu of allocating a new one.
    if (!Cell) {
        Cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Stars"];
    }
    NSDictionary* ToShow=[self.AllStars objectForKey:[[self.AllStars allKeys] objectAtIndex:indexPath.row]];
    Cell.textLabel.text=[ToShow objectForKey:@"name"];
    return Cell;
}



@end
