//
//  ViewController.m
//  XLCoreDataManager
//
//  Created by BST on 15/8/18.
//  Copyright (c) 2015年 BST. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSManagedObject+XLKit.h"
#import "NSManagedObject+XLfind.h"
#import "XLCoreDataManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createData];
    [self findAll];
//    [self findByAge];
//    [self findByDepareMent];
//    [self findByAge];
//    [self findWithNameByAgeSort];
//    [self update];
//    [self delete];
}

- (void)createData{
    NSString * string = [[NSUserDefaults standardUserDefaults] objectForKey:@"first"];
    if ([string integerValue]) {
        return;
    }
    NSArray * nameArray = @[@"周灵龙",@"刘金林",@"张进",@"储小龙",@"任红尘",@"周灵龙",@"任红尘"];
    NSArray * ageArray = @[@22,@23,@24,@25,@22,@25,@28];
    NSArray * departMentArray = @[@"研发",@"产品",@"财务"];
    for (int i = 0; i < nameArray.count; i++) {
        Person * p = [Person createEntity];
        p.name = nameArray[i];
        p.age = ageArray[i] ;
        p.sex = @(i%2);
        NSString* dep = departMentArray[i%3];
        p.departMent = dep;
        BOOL success = [XLCoreDataManager save];
        if (success) {
            NSLog(@"成功");
        }else
        {
            NSLog(@"失败");
        }
    }
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"first"];
}
//查找全部
- (void)findAll
{
    NSArray * arr = [Person findAll];
    for (Person * p in arr) {
        NSLog(@"name = %@, age = %@, sex = %@, depar = %@",p.name,p.age,p.sex,p.departMent);
    }
}
//根据年龄查找并且按照年龄从小到大排列
- (void)findByAgeSort
{
    NSArray * arr = [Person findAllSortedBy:@"age" ascending:YES];
    for (Person * p in arr) {
        NSLog(@"name = %@, age = %@, sex = %@, depar = %@",p.name,p.age,p.sex,p.departMent);
    }
}

//根据部门来查询
-(void)findByDepareMent
{
    //    NSPredicate *peopleFilter = [NSPredicate predicateWithFormat:@"department IN %@", @[@"财务", @"研发"]];
    NSPredicate *peopleFilter = [NSPredicate predicateWithFormat:@"departMent like %@",@"财务"];
    NSArray * arr = [Person findByPredicate:peopleFilter];
    for (Person * p in arr) {
        NSLog(@"name = %@, age = %@, sex = %@, depar = %@",p.name,p.age,p.sex,p.departMent);
    }
}


//根据年龄查找
-(void)findByAge
{
    NSArray* arr = [Person findByAttribute:@"age" withValue:@(22)];
    for (Person * p in arr) {
        NSLog(@"name = %@, age = %@, sex = %@, depar = %@",p.name,p.age,p.sex,p.departMent);
    }
}
//根据名字查找并且按照年龄排序
- (void)findWithNameByAgeSort
{
    NSArray * arr = [Person findByAttribute:@"name" withValue:@"周灵龙" BySorted:@"age" ascending:NO];
    for (Person * p in arr) {
        NSLog(@"name = %@, age = %@, sex = %@, depar = %@",p.name,p.age,p.sex,p.departMent);
    }
}

#pragma mark ------update-------
- (void)update
{
    Person * p = [Person findFirstByAttribute:@"name" withValue:@"刘金林"];
    p.age = @99;
    BOOL success = [XLCoreDataManager save];
    NSLog(@"是否成功 %d",success);
    
    NSArray* arr = [Person findByAttribute:@"age" withValue:@(99)];
    for (Person * p in arr) {
        NSLog(@"name = %@, age = %@, sex = %@, depar = %@",p.name,p.age,p.sex,p.departMent);
    }
}

#pragma mark -------delete----
-(void)delete{
     Person * p = [Person findFirstByAttribute:@"name" withValue:@"任红尘"];
    BOOL success =  [p deleteEntity];
     NSLog(@"是否成功 %d",success);
}
@end
