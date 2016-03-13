//
//  ViewController.swift
//  Notes
//
//  Created by Benjamin Herzog on 13/03/16.
//  Copyright © 2016 SwiftDe. All rights reserved.
//

import UIKit

class  Master: UITableViewController {
	
	var notes = [Note]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Todo-Notizen"
		let titles = ["Abonniere SwiftDe", "Tritt http://slack.swiftde.net bei", "Be awesome!"]
		notes += titles.map(Note.init)
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return notes.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
		
		cell.textLabel?.text = notes[indexPath.row].title
		
		return cell
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		guard let detail = segue.destinationViewController as? Detail else { return }
		guard let indexPath = sender as? NSIndexPath else { return }

		detail.note = notes[indexPath.row]
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		performSegueWithIdentifier("showDetail", sender: indexPath)

		tableView.deselectRowAtIndexPath(indexPath, animated: true)
	}
}
