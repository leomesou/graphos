//
//  SettingsViewController.swift
//  Graphos
//
//  Created by Leandro Sousa on 08/02/20.
//  Copyright © 2020 Leandro Sousa. All rights reserved.
//

import UIKit

public class SettingsViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel! {
		didSet {
			titleLabel.textColor = Colors.smartPurple
		}
	}
	@IBOutlet weak var resetProgressView: UIView! {
		didSet {
			resetProgressView.backgroundColor = Colors.smartPurple
			resetProgressView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(resetProgressAction)))
		}
	}
	@IBOutlet weak var resetProgressLabel: UILabel! {
		didSet {
			resetProgressLabel.textColor = .white
		}
	}
	@IBOutlet weak var activateSoundView: UIView! {
		didSet {
			activateSoundView.backgroundColor = Colors.smartPurple
			activateSoundView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(activateSoundAction)))
		}
	}
	@IBOutlet weak var activateSoundLabel: UILabel! {
		didSet {
			activateSoundLabel.textColor = .white
		}
	}
	@IBOutlet weak var helpView: UIView! {
		didSet {
			helpView.backgroundColor = Colors.smartPurple
			helpView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(helpAction)))
		}
	}
	@IBOutlet weak var helpLabel: UILabel! {
		didSet {
			helpLabel.textColor = .white
		}
	}
	@IBOutlet weak var backButton: UIButton! {
		didSet {
			backButton.tintColor = Colors.smartPurple
		}
	}

	public override func viewDidLoad() {
		super.viewDidLoad()
		setStrings()
	}

	public override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		view.animateViews(views: [resetProgressView, activateSoundView, helpView])
	}

	@objc private func resetProgressAction() {
		let alert = UIAlertController(title: "Confirm", message: "Are you sure you want to reset your progress?", preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
			PersistenceManager.instance.resetProgress()
		}))
		self.present(alert, animated: true, completion: nil)
	}

	@objc private func activateSoundAction() {
		print("Activate Sound")
	}

	@objc private func helpAction() {
		navigationController?.pushViewController(ViewManager.helpViewController(), animated: true)
	}

	@IBAction func backAction(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}

	private func setStrings() {
		titleLabel.text = Texts.Settings.title
		resetProgressLabel.text = Texts.Settings.resetProgress
		activateSoundLabel.text = Texts.Settings.activateSound
		helpLabel.text = Texts.Settings.help
	}
}
