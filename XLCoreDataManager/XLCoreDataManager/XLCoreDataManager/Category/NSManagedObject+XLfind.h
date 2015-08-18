//
//  NSManagedObject+XLfind.h
//  XLCoreDataManager
//
//  Created by chuxiaolong on 15/8/17.
//  Copyright (c) 2015年 chuxiaolong. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (XLfind)

//查找全部
+ (NSArray*)findAll;

//根据某个属性查找选择升序还是降序
+ (NSArray*)findAllSortedBy:(NSString*)sortTerm ascending:(BOOL)ascending;

//根据条件查找(比如arrribute @"age"  searchValue: [NSNumber numberWithInt:25])
+ (NSArray*)findByAttribute:(NSString*)attribute withValue:(id)searchValue;

//查找符合条件的第一个
+ (id)findFirstByAttribute:(NSString*)attribute withValue:(id)searchValue;

//查找所有的第一个
+ (id)findFirst;

//查找符合条件的并且根据某个条件排序
+ (NSArray*)findByAttribute:(NSString *)attribute withValue:(id)searchValue BySorted:(NSString*)sortTerm ascending:(BOOL)ascending;

//根据自定义条件查询
+ (NSArray*)findByPredicateFormat:(NSString*)predicateFormat;

@end
