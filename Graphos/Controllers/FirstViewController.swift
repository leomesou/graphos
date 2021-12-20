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
	@IBOutlet weak var playLabel: UILabel! {
		didSet {
			playLabel.textColor = .white
		}
	}
	@IBOutlet weak var gameCenterView: UIView! {
		didSet {
			gameCenterView.backgroundColor = Colors.challengerange
			gameCenterView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gameCenterAction)))
		}
	}
	@IBOutlet weak var gameCenterLabel: UILabel! {
		didSet {
			gameCenterLabel.textColor = .white
		}
	}
	@IBOutlet weak var settingsView: UIView! {
		didSet {
			settingsView.backgroundColor = Colors.smartPurple
			settingsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(settingsAction)))
		}
	}
	@IBOutlet weak var settingsLabel: UILabel! {
		didSet {
			settingsLabel.textColor = .white
		}
	}
	@IBOutlet weak var creditsView: UIView! {
		didSet {
			creditsView.backgroundColor = Colors.iPink
			creditsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(creditsAction)))
		}
	}
	@IBOutlet weak var creditsLabel: UILabel! {
		didSet {
			creditsLabel.textColor = .white
		}
	}

	public override func viewDidLoad() {
		super.viewDidLoad()
		setStringsAndImages()
	}

	public override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		animateViews()
	}

	public override var prefersStatusBarHidden : Bool {
		return true
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

	private func setStringsAndImages() {
		logoImageView.image = Images.graphosLogoColor
		playLabel.text = Texts.First.play
		gameCenterLabel.text = Texts.First.gameCenter
		settingsLabel.text = Texts.First.settings
		creditsLabel.text = Texts.First.credits
	}

	private func animateViews() {

	}
}
