//
//  Switch.swift
//  HomeWizard
//
//  Created by Wim Haanstra on 17/06/14.
//  Copyright (c) 2014 Sorted Bits. All rights reserved.
//

import Foundation

extension Switch {
	
	override func populate(dictionary: NSDictionary) {
		super.populate(dictionary)
		
		self.status = false
		if let status = dictionary.objectForKey("status") as? String {
			if (status == "on") {
				self.status = true
			}
		}
	}
	
	func on() {
		
		var actionUrl = "/sw/\(self.id)/on"
		println(actionUrl)
		
		self.performAction(actionUrl, completed: { (success: Bool) -> Void in
		})
		
	}
	
	func off() {

		var actionUrl = "/sw/\(self.id)/off"
		println(actionUrl)
		
		self.performAction(actionUrl, completed: { (success: Bool) -> Void in
		})
		
	}
	
}