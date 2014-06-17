//
//  Room.swift
//  HomeWizard
//
//  Created by Wim Haanstra on 17/06/14.
//  Copyright (c) 2014 Sorted Bits. All rights reserved.
//

import UIKit
import CoreData

class Room: NSManagedObject {
 
	@NSManaged var name: String
	@NSManaged var sensors: Array<Base>
	
}
