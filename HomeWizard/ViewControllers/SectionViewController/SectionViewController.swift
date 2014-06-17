//
//  SectionViewController.swift
//  HomeWizard
//
//  Created by Wim Haanstra on 16/06/14.
//  Copyright (c) 2014 Sorted Bits. All rights reserved.
//

import UIKit

class SectionViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {

	override func viewWillAppear(animated: Bool) {
		var api = Api();

		
		api.discover(
			{ (hostname: String) -> Void in
				println(hostname)
				
				api.login(nil, password: "reb00t", completed: { (success: Bool) -> Void in
					if (success) {
						println("logged in")
						
						api.updateSensors({ (success: Bool) -> Void in
							
						})
						
					}
					else {
						println("failed");
					}
				})

			},
			{ (error: NSError!) -> Void in
				println("nooo")
		})
		

		/*
		api.discover(completed: { (hostname: String) in
			println(hostname)
			var x = "test"
		}, failed: {( message: NSError) in
			
		})
		*/
	}
	
	override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!  {
		var cell = tableView.dequeueReusableCellWithIdentifier("CELL") as? UITableViewCell
		
		if !cell {
			cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CELL")
		}
		
		cell!.textLabel.text = "Hello World"
		cell!.detailTextLabel.text = "1/2 cup"
		
		return cell
	}
	
	override func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
		return 88;
	}
	
}
