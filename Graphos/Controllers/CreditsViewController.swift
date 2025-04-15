//
//  CreditsViewController.swift
//  Graphos
//
//  Created by Leandro Sousa on 08/02/20.
//  Copyright © 2020 Leandro Sousa. All rights reserved.
//

import UIKit

class CreditsViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel! {
		didSet {
			titleLabel.textColor = Colors.iPink
		}
	}
	@IBOutlet weak var developedByView: UIView! {
		didSet {
			developedByView.backgroundColor = Colors.iPink
		}
	}
	@IBOutlet weak var developedByLabel: UILabel! {
		didSet {
			developedByLabel.textColor = .white
		}
	}
	@IBOutlet weak var aboutView: UIView! {
		didSet {
			aboutView.backgroundColor = Colors.iPink
		}
	}
	@IBOutlet weak var aboutLabel: UILabel! {
		didSet {
			aboutLabel.textColor = .white
		}
	}
	@IBOutlet weak var backButton: UIButton! {
		didSet {
			backButton.tintColor = Colors.iPink
		}
	}

	public override func viewDidLoad() {
		super.viewDidLoad()
		setStrings()
	}

	public override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		view.animateViews(views: [developedByView, aboutView])
	}

	@IBAction func backAction(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}

	private func setStrings() {
		titleLabel.text = Texts.Credits.title
		developedByLabel.text = Texts.Credits.developedBy
		aboutLabel.text = Texts.Credits.about
	}
}
