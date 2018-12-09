//
//  RebelSuggestion.m
//  Dota Helper
//
//  Created by 高志刚 on 15/10/1.
//  Copyright © 2015年 高志刚. All rights reserved.
//

#import "RebelSuggestion.h"
#import "AllStars.h"
@interface RebelSuggestion()
@property (nonatomic,strong) AllStars* asData;
@property (nonatomic,strong) NSMutableDictionary* Rebel5Target;
@property (nonatomic,strong) NSMutableDictionary* WeakPointAllList;
@property (nonatomic,strong) NSArray* WeakPointShowArray;
@end

@implementation RebelSuggestion

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(NSMutableDictionary*)Rebel5Target
{
    if(!_Rebel5Target)
    {
        _Rebel5Target=[[NSMutableDictionary alloc] init];
    }
    return _Rebel5Target;
}
-(NSMutableDictionary*)WeakPointAllList
{
    if(!_WeakPointAllList)
    {
        _WeakPointAllList=[[NSMutableDictionary alloc] init];
    }
    return _WeakPointAllList;
}

-(AllStars*)asData
{
    if(!_asData)
    {
        _asData=[[AllStars alloc] init];
    }
    return _asData;
}

-(void)ReCaculateWeakPoint
{
    /** 清空上一次计算的结果 **/
    self.WeakPointAllList=nil;
    for (NSString* NameKey in [self.Rebel5Target allKeys]) {
        NSDictionary* RebelTargetDetail=[self.Rebel5Target objectForKey:NameKey];
        NSDictionary* WeakPointList=[RebelTargetDetail objectForKey:[self.class WeakPointDicKey]];
        for (NSString * RangeKey in WeakPointList) {
            NSString* WeakHeroName=[WeakPointList objectForKey:RangeKey];
            NSNumber* weakPointLastResult=[self.WeakPointAllList objectForKey:WeakHeroName];
            /** 把取到的每一个弱点英雄的相对强度累加起来，存储在WeakPointAllList里面 **/
            if (weakPointLastResult) {
                NSNumber* weakPointNewRelust=[[NSNumber alloc] initWithInteger:weakPointLastResult.integerValue+RangeKey.integerValue-5];
                [self.WeakPointAllList setObject:weakPointNewRelust forKey:WeakHeroName];
            }
            else
            {
                /** 表格里面的数字的意思是 **/
                /** 越高越强 **/
                /** 这里减5的意思是，我的plist里面，5就是相当，而10是强5度，0则是弱5度 **/
                NSNumber* weakPointNewRelust=[[NSNumber alloc] initWithInteger:RangeKey.integerValue-5];
                [self.WeakPointAllList setObject:weakPointNewRelust forKey:WeakHeroName];
            }

           
        }
    }
    
    /** 将弱点数据排序成可以显示的数据 **/
    NSArray* tempArray=[self.WeakPointAllList allKeys];
    self.WeakPointShowArray=[tempArray sortedArrayUsingComparator:
     ^NSComparisonResult(NSString *Hero1, NSString *Hero2) {
         // 先按照姓排序
         NSNumber* weakPointOfHero1=[self.WeakPointAllList objectForKey:Hero1];
         NSNumber* weakPointOfHero2=[self.WeakPointAllList objectForKey:Hero2];
         NSComparisonResult result = [weakPointOfHero1 compare:weakPointOfHero2];
         return (result * (-1));
     }];
    return;
}


-(void)setRebelTarget:(NSDictionary*)Target
{
    self.Rebel5Target=nil;
    for (NSString* NameKey in [Target allKeys])
    {
        if ([self.asData DetailOfChosenNameKey:NameKey]) {
            [self.Rebel5Target setObject:[self.asData DetailOfChosenNameKey:NameKey] forKey:NameKey];
        }
    }
    [self ReCaculateWeakPoint];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.WeakPointShowArray  count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* Cell=[tableView dequeueReusableCellWithIdentifier:@"RebelStars"];  // Used by the delegate to acquire an already allocated cell, in lieu of allocating a new one.
    if (!Cell) {
        Cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"RebelStars"];
    }
    NSString* ToShow=[self.WeakPointShowArray objectAtIndex:indexPath.row];
    NSNumber* weakPointRelust=[self.WeakPointAllList objectForKey:ToShow];
    NSDictionary* TryToGetDetail=[self.asData DetailOfChosenNameKey:ToShow];
    if (TryToGetDetail) {
        Cell.textLabel.text=[TryToGetDetail objectForKey:@"name"];
    }
    else
    {
        Cell.textLabel.text=ToShow;
    }
    Cell.detailTextLabel.text=[[NSString alloc] initWithFormat:@"%@",weakPointRelust ];
    return Cell;
}
/**********Export Keys as Class method **/
+(NSString*)Target1Key
{
    return @"chosen1Name";
}
+(NSString*)Target2Key
{
    return @"chosen2Name";
}
+(NSString*)Target3Key
{
    return @"chosen3Name";
}
+(NSString*)Target4Key
{
    return @"chosen4Name";
}
+(NSString*)Target5Key
{
    return @"chosen5Name";
}
+(NSString*)WeakPointDicKey
{
    return @"weak";
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
// fixed font style. use custom view (UILabel) if you want something different
{
    return @"己方推荐阵容";
}


@end
