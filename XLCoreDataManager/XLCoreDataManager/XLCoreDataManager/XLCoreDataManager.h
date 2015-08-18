//
//  XLCoreDataManager.h
//  XLCoreDataManager
//
//  Created by chuxiaolong on 15/8/17.
//  Copyright (c) 2015年 chuxiaolong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface XLCoreDataManager : NSObject
+ (void)setupCoreDataStackWithStoreNamed:(NSString*)storeNamed;
+ (NSManagedObjectContext *)defaultContext;
+ (BOOL)save;
@end
