//
//  XLCoreDataManager.m
//  XLCoreDataManager
//
//  Created by chuxiaolong on 15/8/17.
//  Copyright (c) 2015年 chuxiaolong. All rights reserved.
//

#import "XLCoreDataManager.h"

@interface XLCoreDataManager ()
@property (nonatomic, strong) NSManagedObjectContext * context;
@end

@implementation XLCoreDataManager
+ (XLCoreDataManager *)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (void)setupCoreDataStackWithStoreNamed:(NSString*)storeNamed{
    if ([XLCoreDataManager sharedInstance].context) {
        return;
    }

    NSManagedObjectModel *model = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    NSPersistentStoreCoordinator *store = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];

    NSArray *docs = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [docs[0] stringByAppendingPathComponent:storeNamed];
    NSURL *url = [NSURL fileURLWithPath:path];
    
    NSError *error = nil;
    [store addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:url options:nil error:&error];
    
    if (error) {
        NSLog(@"打开数据库出错 - %@", error.localizedDescription);
    } else {
        NSLog(@"打开数据库成功！");
        
        [XLCoreDataManager sharedInstance].context = [[NSManagedObjectContext alloc] init];
        
        [XLCoreDataManager sharedInstance].context.persistentStoreCoordinator = store;
    }

}
+ (NSManagedObjectContext *)defaultContext{
    return [XLCoreDataManager sharedInstance].context;
}

+ (BOOL)save{
    return [[XLCoreDataManager defaultContext] save:nil];
}
@end
