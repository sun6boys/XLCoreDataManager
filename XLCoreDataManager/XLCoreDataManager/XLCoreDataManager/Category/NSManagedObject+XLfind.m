//
//  NSManagedObject+XLfind.m
//  XLCoreDataManager
//
//  Created by chuxiaolong on 15/8/17.
//  Copyright (c) 2015年 chuxiaolong. All rights reserved.
//

#import "NSManagedObject+XLfind.h"
#import "NSManagedObject+XLKit.h"
#import "XLCoreDataManager.h"

@implementation NSManagedObject (XLfind)

+ (NSArray*)findAll
{
    NSFetchRequest *request = [self createFetchRequest];
    return [self findBySearChRequest:request];
}

+ (NSArray*)findAllSortedBy:(NSString*)sortTerm ascending:(BOOL)ascending
{
    NSFetchRequest *request = [self createFetchRequest];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:sortTerm ascending:ascending];
    request.sortDescriptors = [NSArray arrayWithObject:sort];
    return [self findBySearChRequest:request];
}
+(NSArray*)findByAttribute:(NSString*)attribute withValue:(id)searchValue
{
    NSFetchRequest*fetchRequest = [self createFetchRequestByAttribute:attribute withValue:searchValue];
    return  [self findBySearChRequest:fetchRequest];
}

+(id)findFirstByAttribute:(NSString*)attribute withValue:(id)searchValue
{
    NSFetchRequest*fetchRequest = [self createFetchRequestByAttribute:attribute withValue:searchValue];
    [fetchRequest setFetchLimit:1];
    return [[self findBySearChRequest:fetchRequest]count]? [[self findBySearChRequest:fetchRequest] firstObject]:nil;
}

+ (id)findFirst
{
    NSFetchRequest * request = [self createFetchRequest];
     [request setFetchLimit:1];
    return [[self findBySearChRequest:request]count]? [[self findBySearChRequest:request] firstObject]:nil;
}

+ (NSArray*)findByAttribute:(NSString *)attribute withValue:(id)searchValue BySorted:(NSString*)sortTerm ascending:(BOOL)ascending
{
    NSFetchRequest * fetchRequest = [self createFetchRequestByAttribute:attribute withValue:searchValue];
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:sortTerm ascending:ascending];
    fetchRequest.sortDescriptors = [NSArray arrayWithObject:sort];
    return [self findBySearChRequest:fetchRequest];
}

+ (NSArray*)findByPredicateFormat:(NSString*)predicateFormat
{
    NSFetchRequest * fetchRequest = [self createFetchRequestByPredicateFormat:predicateFormat];
    return [self findBySearChRequest:fetchRequest];
}

+ (NSArray*)findBySearChRequest:(NSFetchRequest*)ferchRequest
{
    return [[XLCoreDataManager defaultContext] executeFetchRequest:ferchRequest error:nil];
}




@end
