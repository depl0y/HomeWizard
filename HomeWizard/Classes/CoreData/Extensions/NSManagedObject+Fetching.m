//
//  NSManagedObject+Fetching.m
//  Shopify Mobile
//
//  Created by Wim Haanstra on 11/02/14.
//  Copyright (c) 2014 Wim Haanstra. All rights reserved.
//

#import "NSManagedObject+Fetching.h"

@implementation NSManagedObject (Fetching)

+ (instancetype) first:(NSPredicate*) predicate {
	
	return [self first:predicate includeSubEntities:NO];
	
}

+ (instancetype) first:(NSPredicate*) predicate includeSubEntities:(BOOL) includeSubEntities {
	NSString* className = [[self class] description];
	
	NSEntityDescription *entity = [NSEntityDescription entityForName:className inManagedObjectContext:[DataManager instance].managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	[fetchRequest setEntity:entity];
	[fetchRequest setIncludesSubentities:includeSubEntities];

	if (predicate != nil)
		[fetchRequest setPredicate:predicate];
	
	NSError* error = nil;
	NSArray *fetchedObjects = [[DataManager instance].managedObjectContext executeFetchRequest:fetchRequest error:&error];
	
	if ([fetchedObjects count] == 0)
		return nil;
	else
		return [fetchedObjects objectAtIndex:0];
}

+ (NSInteger) count {
	return [self countIncludeSubEntities:YES];
}

+ (NSInteger) countIncludeSubEntities:(BOOL) includeSubEntities {
	NSString* className = [[self class] description];
	
	NSFetchRequest* request = [[NSFetchRequest alloc] init];
	[request setEntity:[NSEntityDescription entityForName:className inManagedObjectContext:[DataManager instance].managedObjectContext]];
	[request setIncludesSubentities:includeSubEntities]; //Omit subentities. Default is YES (i.e. include subentities)
	
	NSError *err;
	NSUInteger count = [[DataManager instance].managedObjectContext countForFetchRequest:request error:&err];
	if(count == NSNotFound) {
		return 0;
	}
	else
		return count;
}

+ (NSArray*) all {
	return [self allIncludeSubEntities:YES];
}

+ (NSArray*) allIncludeSubEntities:(BOOL) includeSubEntities; {
	NSString* className = [[self class] description];
	
	//	NSEntityDescription *entity = ;
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	[fetchRequest setEntity:[NSEntityDescription entityForName:className inManagedObjectContext:[DataManager instance].managedObjectContext]];
	[fetchRequest setIncludesSubentities:includeSubEntities];
	
	NSError* error = nil;
	return [[DataManager instance].managedObjectContext executeFetchRequest:fetchRequest error:&error];
}

+ (NSArray*) all:(NSArray*) sortDescriptors {
	NSString* className = [[self class] description];
	
	NSEntityDescription *entity = [NSEntityDescription entityForName:className inManagedObjectContext:[DataManager instance].managedObjectContext];
	
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	[fetchRequest setEntity:entity];
	[fetchRequest setIncludesSubentities:NO];
	[fetchRequest setSortDescriptors: sortDescriptors];
	
	NSError* error = nil;
	return [[DataManager instance].managedObjectContext executeFetchRequest:fetchRequest error:&error];
}

+ (NSArray*) find:(NSArray*) filterPredicates sorting:(NSArray*) sortDescriptors {
	return [self find:filterPredicates sorting:sortDescriptors maxRecords:0];
}

+ (NSArray*) find:(NSArray*) filterPredicates sorting:(NSArray*) sortDescriptors maxRecords:(NSInteger) maxRecords {
	NSString* className = [[self class] description];
	
	NSEntityDescription *entity = [NSEntityDescription entityForName:className inManagedObjectContext:[DataManager instance].managedObjectContext];
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	
	if (maxRecords > 0)
		fetchRequest.fetchLimit = maxRecords;
	
	[fetchRequest setEntity:entity];
	[fetchRequest setIncludesSubentities:YES];
	
	if (filterPredicates != nil) {
		for (NSPredicate* predicate in filterPredicates) {
			[fetchRequest setPredicate:predicate];
		}
	}
	
	if (sortDescriptors != nil) {
		[fetchRequest setSortDescriptors:sortDescriptors];
	}
	
	NSError* error = nil;
	NSArray *fetchedObjects = [[DataManager instance].managedObjectContext executeFetchRequest:fetchRequest error:&error];
	
	return fetchedObjects;
}

@end
