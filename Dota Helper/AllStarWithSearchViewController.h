//
//  AllStarWithSearchViewController.h
//  Dota Helper
//
//  Created by 高志刚 on 15/10/2.
//  Copyright © 2015年 高志刚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllStarWithSearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
-(void)TheReturnChosen:(NSMutableDictionary*)ReturnDic;

@end
