//
//  NSManagedObject+Fetching.h
//  Shopify Mobile
//
//  Created by Wim Haanstra on 11/02/14.
//  Copyright (c) 2014 Wim Haanstra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NSManagedObject (Fetching)

+ (instancetype) first:(NSPredicate*) predicate;
+ (instancetype) first:(NSPredicate*) predicate includeSubEntities:(BOOL) includeSubEntities;

+ (NSArray*) all;
+ (NSArray*) allIncludeSubEntities:(BOOL) includeSubEntities;

+ (NSInteger) count;
+ (NSInteger) countIncludeSubEntities:(BOOL) includeSubEntities;

+ (NSArray*) all:(NSArray*) sortDescriptors;

+ (NSArray*) find:(NSArray*) filterPredicates sorting:(NSArray*) sortDescriptors;
+ (NSArray*) find:(NSArray*) filterPredicates sorting:(NSArray*) sortDescriptors maxRecords:(NSInteger) maxRecords;

@end
