//
//  NSManagedObject+Query.swift
//  HomeWizard
//
//  Created by Wim Haanstra on 17/06/14.
//  Copyright (c) 2014 Sorted Bits. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject {

	class func first(entityName: String, predicate: NSPredicate) -> NSManagedObject? {
		
		let request: NSFetchRequest = NSFetchRequest(entityName: entityName)
		request.returnsObjectsAsFaults = false
		request.predicate = predicate
		
		var error: NSError? = nil
		var objects: NSArray = DataManager.sharedInstance._managedObjectContext!.executeFetchRequest(request, error: &error)
		
		if (objects.count == 0) {
			return nil
		}
		else {
			return objects[0] as? NSManagedObject
		}
	}
	
}