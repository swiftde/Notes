//
//  Note.swift
//  Notes
//
//  Created by Benjamin Herzog on 13/03/16.
//  Copyright © 2016 SwiftDe. All rights reserved.
//

import Foundation

class Note {

	var title: String
	var content: String

	init(title: String, content: String) {
		self.title = title
		self.content = content
	}

	convenience init(title: String) {
		self.init(title: title, content: "")
	}
}

extension Note: Equatable { }

func == (lhs: Note, rhs: Note) -> Bool {
	return lhs.title == rhs.title && lhs.content == rhs.content
}
