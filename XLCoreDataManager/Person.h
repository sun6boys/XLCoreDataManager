//
//  Person.h
//  XLCoreDataManager
//
//  Created by chuxiaolong on 15/8/18.
//  Copyright (c) 2015年 BST. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * departMent;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * sex;

@end
