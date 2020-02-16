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
	@IBOutlet weak var graphByDegreeView: UIView! {
		didSet {
			graphByDegreeView.backgroundColor = Colors.techGreen
			graphByDegreeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(graphByDegreeAction)))
		}
	}
	@IBOutlet weak var graphByDegreeLabel: UILabel! {
		didSet {
			graphByDegreeLabel.textColor = .white
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
		animateViews()
	}

	@objc private func planarGraphAction() {
		if let levelsVC = ViewManager.levelsViewController() as? LevelsViewController {
			navigationController?.pushViewController(levelsVC, animated: true)
		}
	}

	@objc private func graphByDegreeAction() {
		if let levelsVC = ViewManager.levelsViewController() as? LevelsViewController {
			navigationController?.pushViewController(levelsVC, animated: true)
		}
	}

	@objc private func quizAction() {
		navigationController?.pushViewController(ViewManager.quizViewController(), animated: true)
	}

	@IBAction func backAction(_ sender: Any) {
		navigationController?.popToRootViewController(animated: true)
	}

	private func setStrings() {
		titleLabel.text = "Jogar"
		planarGraphLabel.text = "Grafo planar"
		graphByDegreeLabel.text = "Grafo por Grau"
		quizLabel.text = "Quiz"
	}

	private func animateViews() {

	}
}
