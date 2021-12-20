//
//  LevelsViewController.swift
//  Graphos
//
//  Created by Leandro Sousa on 08/02/20.
//  Copyright © 2020 Leandro Sousa. All rights reserved.
//

import UIKit

public class LevelsViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel! {
		didSet {
			titleLabel.textColor = .white
		}
	}
	@IBOutlet weak var topView: UIView! {
		didSet {
			topView.backgroundColor = Colors.iPink
		}
	}
	@IBOutlet weak var backButton: UIButton! {
		didSet {
			backButton.tintColor = .white
		}
	}
	@IBOutlet weak var settingsButton: UIButton! {
		didSet {
			settingsButton.tintColor = .white
		}
	}
	@IBOutlet weak var bottomView: UIView! {
		didSet {
			bottomView.backgroundColor = Colors.iPink
		}
	}

	public var gameType: GameType = .planar

	public override func viewDidLoad() {
		super.viewDidLoad()
		setStrings()
	}

	@IBAction func backAction(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}

	@IBAction func settingsAction(_ sender: Any) {
		navigationController?.pushViewController(ViewManager.settingsViewController(), animated: true)
	}

	private func setStrings() {
		titleLabel.text = Texts.Levels.title
	}
}
