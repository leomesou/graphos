//
//  FirstViewController.swift
//  Graphos
//
//  Created by Leandro Sousa on 08/02/20.
//  Copyright © 2020 Leandro Sousa. All rights reserved.
//

import UIKit

public class FirstViewController: UIViewController {

	@IBOutlet weak var logoImageView: UIImageView!
	@IBOutlet weak var playView: UIView! {
		didSet {
			playView.backgroundColor = Colors.techGreen
			playView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(playAction)))
		}
	}
	@IBOutlet weak var gameCenterView: UIView! {
		didSet {
			gameCenterView.backgroundColor = Colors.challengerange
			gameCenterView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gameCenterAction)))
		}
	}
	@IBOutlet weak var settingsView: UIView! {
		didSet {
			settingsView.backgroundColor = Colors.smartPurple
			settingsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(settingsAction)))
		}
	}
	@IBOutlet weak var creditsView: UIView! {
		didSet {
			creditsView.backgroundColor = Colors.iPink
			creditsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(creditsAction)))
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

	@objc private func playAction() {
		navigationController?.pushViewController(ViewManager.playViewController(), animated: true)
	}

	@objc private func gameCenterAction() {
		print("Game Center")
	}

	@objc private func settingsAction() {
		navigationController?.pushViewController(ViewManager.settingsViewController(), animated: true)
	}

	@objc private func creditsAction() {
		navigationController?.pushViewController(ViewManager.creditsViewController(), animated: true)
	}

	private func setStrings() {

	}

	private func animateViews() {

	}
}
