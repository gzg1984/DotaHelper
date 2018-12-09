//
//  EnemyGroupData.m
//  Dota Helper
//
//  Created by 高志刚 on 15/9/30.
//  Copyright © 2015年 高志刚. All rights reserved.
//

#import "EnemyGroupData.h"
#import "AllStars.h"

@interface EnemyGroupData()

@property (nonatomic,strong) AllStars* asData;
@end

@implementation EnemyGroupData
-(AllStars*)asData
{
    if (!_asData) {
        _asData=[[AllStars alloc] init];
    }
    return _asData;
}

/*****Lazy **/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;//
}

-(NSMutableDictionary*)Slot1
{
    if (!_Slot1) {
        _Slot1=[[NSMutableDictionary alloc] init];
    }
    return _Slot1;
}

-(NSMutableDictionary*)Slot2
{
    if (!_Slot2) {
        _Slot2=[[NSMutableDictionary alloc] init];
    }
    return _Slot2;
}

-(NSMutableDictionary*)Slot3
{
    if (!_Slot3) {
        _Slot3=[[NSMutableDictionary alloc] init];
    }
    return _Slot3;
}
-(NSMutableDictionary*)Slot4
{
    if (!_Slot4) {
        _Slot4=[[NSMutableDictionary alloc] init];
    }
    return _Slot4;
}
-(NSMutableDictionary*)Slot5
{
    if (!_Slot5) {
        _Slot5=[[NSMutableDictionary alloc] init];
    }
    return _Slot5;
}
-(NSMutableDictionary*)AllFilledSlots
{
    if (!_AllFilledSlots) {
        _AllFilledSlots=[[NSMutableDictionary alloc] init];
    }
    [_AllFilledSlots removeAllObjects];
    if ([self.Slot1 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]) {
        [_AllFilledSlots setObject:@"Enable" forKey:[self.Slot1 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]];
    }
    if ([self.Slot2 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]) {
        [_AllFilledSlots setObject:@"Enable" forKey:[self.Slot2 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]];
    }
    if ([self.Slot3 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]) {
        [_AllFilledSlots setObject:@"Enable" forKey:[self.Slot3 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]];
    }
    if ([self.Slot4 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]) {
        [_AllFilledSlots setObject:@"Enable" forKey:[self.Slot4 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]];
    }
    if ([self.Slot5 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]) {
        [_AllFilledSlots setObject:@"Enable" forKey:[self.Slot5 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]];
    }
    return _AllFilledSlots;
}
// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
+(NSString*)HeroNameDictionaryKeyInSlot
{
    return @"ChosenName";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* Id=[[NSString alloc] initWithFormat:@"Cell%d",indexPath.row+1];
    UITableViewCell* Cell=[tableView dequeueReusableCellWithIdentifier:Id];  // Used by the delegate to acquire an already allocated cell, in lieu of allocating a new one.
    if (!Cell) {
                    return nil;
    }
    else
    {
        if (indexPath.row == 0) {
            if ([self.Slot1 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]) {
                Cell.textLabel.text=[[self.asData DetailOfChosenNameKey:[self.Slot1 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]] objectForKey:@"name"];
            }

        }
        if (indexPath.row == 1) {
            if ([self.Slot2 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]) {
                Cell.textLabel.text=[[self.asData DetailOfChosenNameKey:[self.Slot2 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]] objectForKey:@"name"];
            }
            
        }
        
        if (indexPath.row == 2) {
            if ([self.Slot3 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]) {
                Cell.textLabel.text=[[self.asData DetailOfChosenNameKey:[self.Slot3 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]] objectForKey:@"name"];
            }
            
        }
        
        if (indexPath.row == 3) {
            if ([self.Slot4 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]) {
                Cell.textLabel.text=[[self.asData DetailOfChosenNameKey:[self.Slot4 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]] objectForKey:@"name"];
            }
            
        }
        
        if (indexPath.row == 4) {
            if ([self.Slot5 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]) {
                Cell.textLabel.text=[[self.asData DetailOfChosenNameKey:[self.Slot5 objectForKey:[self.class HeroNameDictionaryKeyInSlot]]] objectForKey:@"name"];
            }
            
        }
        
    }
    return Cell;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
// fixed font style. use custom view (UILabel) if you want something different
{
    return @"对方选人";
}
/*
-(float)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0;
}
-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    return 30.0;
}
 */
@end
