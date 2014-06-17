//
//  Hue.swift
//  HomeWizard
//
//  Created by Wim Haanstra on 17/06/14.
//  Copyright (c) 2014 Sorted Bits. All rights reserved.
//

import Foundation
import CoreData

class Hue : Base {
	
	@NSManaged var hue: Int
	@NSManaged var bri: Int
	@NSManaged var sat: Int
	
	@NSManaged var hueId: Int
	@NSManaged var lightId: Int

}