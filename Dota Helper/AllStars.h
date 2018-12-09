//
//  AllStars.h
//  Dota Helper
//
//  Created by 高志刚 on 15/9/30.
//  Copyright © 2015年 高志刚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllStars : UITableView <UITableViewDataSource,UITableViewDelegate>
-(NSDictionary*)DetailOfChosen:(NSInteger)Index;
-(NSString*)NameKeyOfChosen:(NSInteger)Index;
-(NSDictionary*)DetailOfChosenNameKey:(NSString*)NameKey;
-(NSMutableArray*)SelectForNick:(NSString*)NickName;
@end
