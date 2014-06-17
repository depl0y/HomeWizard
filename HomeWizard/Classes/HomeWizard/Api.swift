//
//  Api.swift
//  HomeWizard
//
//  Created by Wim Haanstra on 16/06/14.
//  Copyright (c) 2014 Sorted Bits. All rights reserved.
//

import UIKit

class Api: NSObject {
 
	var hostname: String
	var password: String
	
	let discoverUrl: String = "http://gateway.homewizard.nl/discovery.php"
	
	init(hostname: String, password: String) {
		self.hostname = hostname
		self.password = password
	}
	
	init() {
		self.hostname = "localhost"
		self.password = ""
		/* Check settings for username and password */
	}
	
	func discover(success: (hostname: String) -> Void, failure: (error: NSError!) -> Void) {

		let manager = AFHTTPRequestOperationManager()
		
		manager.GET(self.discoverUrl, parameters: nil, success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
			
			if responseObject!["ip"] {
				
				self.hostname = responseObject!["ip"] as String
				
				success(hostname: responseObject!["ip"] as String)
			}
			else {
				failure(error: nil)
			}
		},
		failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
			println("Error: " + error.localizedDescription)
			failure(error: error)
		})
		
	}
	
	func login(hostname: String!, password: String, completed: (success: Bool) -> Void) {
		
		if (hostname != nil) {
			self.hostname = hostname
		}
		
		var url: String = "http://" + self.hostname + "/" + password + "/enlist"
		
		let manager = AFHTTPRequestOperationManager()
		
		manager.GET(url, parameters: nil, success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in

			println(responseObject)
			var dict: NSDictionary = responseObject as NSDictionary
			
			if (dict.objectForKey("error")) {
				completed(success: false)
			}
			else {
				self.password = password
				completed(success: true)
			}
			
		},
		failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
			println("Error: " + error.localizedDescription)
			completed(success: false)
		})
	}
	
	func updateSensors(completed: (success: Bool) -> Void) {
		var url: String = "http://" + self.hostname + "/" + self.password + "/get-sensors"
		
		let manager = AFHTTPRequestOperationManager()
		
		manager.GET(url, parameters: nil, success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
			
			println(responseObject.description)
			var dict: NSDictionary = responseObject as NSDictionary

			

			if (dict.objectForKey("error")) {
				completed(success: false)
			}
			else {
				completed(success: true)
			}
			
			},
			failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
				println("Error: " + error.localizedDescription)
				completed(success: false)
			})
	}
	
	func action(actionUrl: String, completed: (success: Bool) -> Void) {
		
		var url: String = "http://" + self.hostname + "/" + password + actionUrl
		
		let manager = AFHTTPRequestOperationManager()
		
		manager.GET(url, parameters: nil,
			success: { (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
			
			println(responseObject)
			var dict: NSDictionary = responseObject as NSDictionary
			
			if (dict.objectForKey("error")) {
				completed(success: false)
			}
			else {
				completed(success: true)
			}
		},
		failure: { (operation: AFHTTPRequestOperation!, error: NSError!) in
			println("Error: " + error.localizedDescription)
			completed(success: false)
		})
	}
}
