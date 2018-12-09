//
//  ChooseAndRebelViewController.m
//  Dota Helper
//
//  Created by 高志刚 on 15/9/30.
//  Copyright © 2015年 高志刚. All rights reserved.
//

#import "ChooseAndRebelViewController.h"
#import "EnemyGroupData.h"
#import "AllStarWithSearchViewController.h"
#import "RebelSuggestion.h"
#import "AllStars.h"

@interface ChooseAndRebelViewController ()
@property (weak, nonatomic) IBOutlet EnemyGroupData *EnemyGroup;
@property (weak, nonatomic) IBOutlet RebelSuggestion *Rebel;
@property (strong, nonatomic)  AllStars *asData;
@property (nonatomic,strong) NSMutableDictionary* Choosen2;
@property (nonatomic,strong) NSMutableDictionary* Choosen3;
@property (nonatomic,strong) NSMutableDictionary* Choosen4;
@property (nonatomic,strong) NSMutableDictionary* Choosen5;
@end

@implementation ChooseAndRebelViewController
-(AllStars*)asData
{
    if(!_asData)
    {
        _asData=[[AllStars alloc] init];
    }
    return _asData;
}

-(NSMutableDictionary*)Choosen2
{
    if(!_Choosen2)
    {
        _Choosen2=[[NSMutableDictionary alloc] init];
    }
    return _Choosen2;
}
-(NSMutableDictionary*)Choosen3
{
    if(!_Choosen3)
    {
        _Choosen3=[[NSMutableDictionary alloc] init];
    }
    return _Choosen3;
}
-(NSMutableDictionary*)Choosen4
{
    if(!_Choosen4)
    {
        _Choosen4=[[NSMutableDictionary alloc] init];
    }
    return _Choosen4;
}
-(NSMutableDictionary*)Choosen5
{
    if(!_Choosen5)
    {
        _Choosen5=[[NSMutableDictionary alloc] init];
    }
    return _Choosen5;
}
/*****Lazy ******/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.EnemyGroup.delegate=self.EnemyGroup;
    self.EnemyGroup.dataSource=self.EnemyGroup;
    self.Rebel.dataSource=self.Rebel;
    self.Rebel.delegate=self.Rebel;
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.EnemyGroup reloadData];
    [self.Rebel setRebelTarget:[self.EnemyGroup AllFilledSlots]];
    [self.Rebel reloadData];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Cell1"]) {
        AllStarWithSearchViewController* New= [segue destinationViewController];
        [New TheReturnChosen:self.EnemyGroup.Slot1];
    }
    if ([segue.identifier isEqualToString:@"Cell2"]) {
        AllStarWithSearchViewController* New= [segue destinationViewController];
        [New TheReturnChosen:self.EnemyGroup.Slot2];
    }
    if ([segue.identifier isEqualToString:@"Cell3"]) {
        AllStarWithSearchViewController* New= [segue destinationViewController];
        [New TheReturnChosen:self.EnemyGroup.Slot3];
    }
    if ([segue.identifier isEqualToString:@"Cell4"]) {
        AllStarWithSearchViewController* New= [segue destinationViewController];
        [New TheReturnChosen:self.EnemyGroup.Slot4];
    }
    if ([segue.identifier isEqualToString:@"Cell5"]) {
        AllStarWithSearchViewController* New= [segue destinationViewController];
        [New TheReturnChosen:self.EnemyGroup.Slot5];
    }
}

@end
