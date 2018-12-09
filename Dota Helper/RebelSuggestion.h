//
//  RebelSuggestion.h
//  Dota Helper
//
//  Created by 高志刚 on 15/10/1.
//  Copyright © 2015年 高志刚. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol rebeltarget <NSObject>

@required
-(void)setRebelTarget:(NSDictionary*)Target;
@end

@interface RebelSuggestion : UITableView <UITableViewDataSource,UITableViewDelegate,rebeltarget>
+(NSString*)Target1Key;
+(NSString*)Target2Key;
+(NSString*)Target3Key;
+(NSString*)Target4Key;
+(NSString*)Target5Key;
+(NSString*)WeakPointDicKey;
@end

