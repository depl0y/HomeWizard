//
//  Base.swift
//  HomeWizard
//
//  Created by Wim Haanstra on 17/06/14.
//  Copyright (c) 2014 Sorted Bits. All rights reserved.
//

import Foundation

extension Base {
	
	func performAction(url: String, completed: (success: Bool) -> Void) {
		var api = Api()
		api.action(url, completed: { (success: Bool) -> Void in
			completed(success: success)
		})
	}
	
	func populate(dictionary: NSDictionary) {
		/* favorite, id, name */
		
		if let sensorId = dictionary.objectForKey("id") as? Int {
			self.id = sensorId
		}
		
		if let name = dictionary.objectForKey("name") as? String {
			self.name = name
		}
		
		if let favorite = dictionary.objectForKey("favorite") as? String {
			if (favorite == "no") {
				self.favorite = false
			}
			else {
				self.favorite = true
			}
		}
		
	}
}

