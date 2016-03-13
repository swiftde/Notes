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
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:
			.Add, target: self, action: "addNewNote")
	}
	
	func addNewNote() {
		let alert = UIAlertController(title: "Hinzufügen", message: "Bitte gib einen Title der Notiz ein!", preferredStyle: .Alert)
		
		alert.addTextFieldWithConfigurationHandler {
			textField in
			textField.placeholder = "Title"
		}
		
		alert.addAction(UIAlertAction(title: "Speichern", style: .Default, handler: {
			[weak self] _ in
			guard let title = alert.textFields?.first?.text else { return }
			self?.notes.append(Note(title: title))
			self?.tableView.reloadData()
			}))
		
		alert.addAction(UIAlertAction(title: "Abbrechen", style: .Cancel, handler: nil))
		
		presentViewController(alert, animated: true, completion: nil)
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
