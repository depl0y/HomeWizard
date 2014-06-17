//
//  Base.swift
//  HomeWizard
//
//  Created by Wim Haanstra on 17/06/14.
//  Copyright (c) 2014 Sorted Bits. All rights reserved.
//

import UIKit
import CoreData

class Base: NSManagedObject {
	
	@NSManaged var favorite: Bool
	@NSManaged var id: Int
	@NSManaged var name: String
	
	@NSManaged var lastUpdate: NSTimeInterval
	@NSManaged var homeWizard: HomeWizard
	@NSManaged var room: Room
	
}