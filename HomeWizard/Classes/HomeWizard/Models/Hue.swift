//
//  Hue.swift
//  HomeWizard
//
//  Created by Wim Haanstra on 17/06/14.
//  Copyright (c) 2014 Sorted Bits. All rights reserved.
//

import Foundation

extension Hue {
	
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
	
	func setColor(hue: Int, sat: Int, bri: Int) {

		var actionUrl = "/sw/\(self.id)/on/\(hue)/\(sat)/\(bri)"
		println(actionUrl)
		
		self.performAction(actionUrl, completed: { (success: Bool) -> Void in
		})
		
	}
	
}