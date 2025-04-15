//
//  PlayViewController.swift
//  Graphos
//
//  Created by Leandro Sousa on 08/02/20.
//  Copyright © 2020 Leandro Sousa. All rights reserved.
//

import UIKit

public class PlayViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel! {
		didSet {
			titleLabel.textColor = Colors.techGreen
		}
	}
	@IBOutlet weak var planarGraphView: UIView! {
		didSet {
			planarGraphView.backgroundColor = Colors.techGreen
			planarGraphView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(planarGraphAction)))
		}
	}
	@IBOutlet weak var planarGraphLabel: UILabel! {
		didSet {
			planarGraphLabel.textColor = .white
		}
	}
	@IBOutlet weak var kRegularGraphView: UIView! {
		didSet {
			kRegularGraphView.backgroundColor = Colors.techGreen
			kRegularGraphView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(kRegularGraphAction)))
		}
	}
	@IBOutlet weak var kRegularGraphLabel: UILabel! {
		didSet {
			kRegularGraphLabel.textColor = .white
		}
	}
	@IBOutlet weak var quizView: UIView! {
		didSet {
			quizView.backgroundColor = Colors.techGreen
			quizView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(quizAction)))
		}
	}
	@IBOutlet weak var quizLabel: UILabel! {
		didSet {
			quizLabel.textColor = .white
		}
	}
	@IBOutlet weak var backButton: UIButton! {
		didSet {
			backButton.tintColor = Colors.techGreen
		}
	}

	public override func viewDidLoad() {
		super.viewDidLoad()
		setStrings()
	}

	public override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		view.animateViews(views: [planarGraphView, kRegularGraphView, quizView])
	}

	@objc private func planarGraphAction() {
		navigateToLevelsViewController(gameType: .planar)
	}

	@objc private func kRegularGraphAction() {
		navigateToLevelsViewController(gameType: .kRegular)
	}

	@objc private func quizAction() {
		navigationController?.pushViewController(ViewManager.quizViewController(), animated: true)
	}

	@IBAction func backAction(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}

	private func setStrings() {
		titleLabel.text = Texts.Play.title
		planarGraphLabel.text = Texts.Play.planarGraph
		kRegularGraphLabel.text = Texts.Play.kRegularGraph
		quizLabel.text = Texts.Play.quiz
	}

	private func navigateToLevelsViewController(gameType: GameType) {
		if let levelsVC = ViewManager.levelsViewController() as? LevelsViewController {
			levelsVC.gameType = gameType
			navigationController?.pushViewController(levelsVC, animated: true)
		}
	}
}
