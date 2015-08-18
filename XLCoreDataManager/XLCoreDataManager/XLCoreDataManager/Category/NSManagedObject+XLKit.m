//
//  NSManagedObject+XLKit.m
//  XLCoreDataManager
//
//  Created by chuxiaolong on 15/8/17.
//  Copyright (c) 2015年 chuxiaolong. All rights reserved.
//

#import "NSManagedObject+XLKit.h"
#import "XLCoreDataManager.h"
@implementation NSManagedObject (XLKit)

+ (NSString*)entityName{
    return [NSStringFromClass(self) componentsSeparatedByString:@"."].lastObject;
}

+ (id)createEntity
{
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:[XLCoreDataManager defaultContext]];
}

- (BOOL)deleteEntity
{
    NSManagedObject *inContext = [[XLCoreDataManager defaultContext] existingObjectWithID:[self objectID] error:nil];
     [[XLCoreDataManager defaultContext] deleteObject:inContext];
    return [XLCoreDataManager save];
}



+ (NSFetchRequest*)createFetchRequest
{
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription * entity = [NSEntityDescription entityForName:[self entityName] inManagedObjectContext:[XLCoreDataManager defaultContext]];
    [request setEntity:entity];
    return request;
}


+(NSFetchRequest*)createFetchRequestByAttribute:(NSString*)attribute withValue:(id)searchValue
{
    NSFetchRequest * fetchRequest = [self createFetchRequest];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"%K = %@", attribute, searchValue]];
    return fetchRequest;
}

+(NSFetchRequest*)createFetchRequestByPredicate:(NSPredicate*)predicate
{
    NSFetchRequest * fetchRequest = [self createFetchRequest];
    [fetchRequest setPredicate:predicate];
    return fetchRequest;
}

@end
