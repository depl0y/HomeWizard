//
//  Parser.swift
//  HomeWizard
//
//  Created by Wim Haanstra on 17/06/14.
//  Copyright (c) 2014 Sorted Bits. All rights reserved.
//

import UIKit

class Parser: NSObject {

	class func getSensors(dictionary: NSDictionary) {
		
		if let response = dictionary.objectForKey("response") as? NSDictionary {
			
			if let switches = response.objectForKey("switches") as? Array<NSDictionary> {
				
				for dict in switches {
					
					if (dict.objectForKey("type") as String == "switch") {

					}
					else if (dict.objectForKey("type") as String == "dimmer") {
						
					}
					
				}
				
			}
			
		}
		
	}
	
}

