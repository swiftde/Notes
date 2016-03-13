//
//  Detail.swift
//  Notes
//
//  Created by Kilian Költzsch on 13/03/16.
//  Copyright © 2016 SwiftDe. All rights reserved.
//

import UIKit

class Detail: UIViewController {

	var note: Note?

	@IBOutlet weak var contentLabel: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

		contentLabel?.text = note?.title
    }

}
