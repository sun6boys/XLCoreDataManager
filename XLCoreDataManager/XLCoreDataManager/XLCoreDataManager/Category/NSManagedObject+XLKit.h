//
//  NSManagedObject+XLKit.h
//  XLCoreDataManager
//
//  Created by chuxiaolong on 15/8/17.
//  Copyright (c) 2015年 chuxiaolong. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (XLKit)

+ (NSString*)entityName;

+ (id)createEntity;

- (BOOL)deleteEntity;


+ (NSFetchRequest*)createFetchRequest;

+(NSFetchRequest*)createFetchRequestByAttribute:(NSString*)attribute withValue:(id)searchValue;

+(NSFetchRequest*)createFetchRequestByPredicateFormat:(NSString*)predicateFormat;
@end
