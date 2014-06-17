//
//  Dimmer.swift
//  HomeWizard
//
//  Created by Wim Haanstra on 17/06/14.
//  Copyright (c) 2014 Sorted Bits. All rights reserved.
//

import Foundation

extension Dimmer {
	
	override func populate(dictionary: NSDictionary) {
		super.populate(dictionary)

		if let dimLevel = dictionary.objectForKey("dimlevel") as? Int {
			self.dimLevel = dimLevel
		}
		
	}
	
	func dim(dimLevel: Float) {
		
		var actionUrl = "/sw/dim/\(self.id)/\(dimLevel)"
		println(actionUrl)
		
		self.performAction(actionUrl, completed: { (success: Bool) -> Void in
		})
		
	}
	
}