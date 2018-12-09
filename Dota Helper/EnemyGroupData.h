//
//  EnemyGroupData.h
//  Dota Helper
//
//  Created by 高志刚 on 15/9/30.
//  Copyright © 2015年 高志刚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnemyGroupData : UITableView <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSMutableDictionary* Slot1;
@property (nonatomic,strong) NSMutableDictionary* Slot2;
@property (nonatomic,strong) NSMutableDictionary* Slot3;
@property (nonatomic,strong) NSMutableDictionary* Slot4;
@property (nonatomic,strong) NSMutableDictionary* Slot5;
@property (nonatomic,strong) NSMutableDictionary* AllFilledSlots;
+(NSString*)HeroNameDictionaryKeyInSlot;
@end
