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
		animateViews()
	}

	@objc private func resetProgressAction() {
		print("Reset Progress")
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
		titleLabel.text = "Configs."
		resetProgressLabel.text = "Resetar Progresso"
		activateSoundLabel.text = "Ativar Sons"
		helpLabel.text = "Ajuda"
	}

	private func animateViews() {

	}
}
