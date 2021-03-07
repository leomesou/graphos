//
//  HelpViewController.swift
//  Graphos
//
//  Created by Leandro Sousa on 16/02/20.
//  Copyright © 2020 Leandro Sousa. All rights reserved.
//

import UIKit

class HelpViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel! {
		didSet {
			titleLabel.textColor = Colors.challengerange
		}
	}
	@IBOutlet weak var planarGraphView: UIView! {
		didSet {
			planarGraphView.backgroundColor = Colors.challengerange
		}
	}
	@IBOutlet weak var planarGraphLabel: UILabel! {
		didSet {
			planarGraphLabel.textColor = .white
		}
	}
	@IBOutlet weak var graphByDegreeView: UIView! {
		didSet {
			graphByDegreeView.backgroundColor = Colors.challengerange
		}
	}
	@IBOutlet weak var graphByDegreeLabel: UILabel! {
		didSet {
			graphByDegreeLabel.textColor = .white
		}
	}
	@IBOutlet weak var quizView: UIView! {
		didSet {
			quizView.backgroundColor = Colors.challengerange
		}
	}
	@IBOutlet weak var quizLabel: UILabel! {
		didSet {
			quizLabel.textColor = .white
		}
	}
	@IBOutlet weak var backButton: UIButton! {
		didSet {
			backButton.tintColor = Colors.challengerange
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

	@IBAction func backAction(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}

	private func setStrings() {
		titleLabel.text = "Ajuda"
		planarGraphLabel.text = "Grafo planar é sobre ..."
		graphByDegreeLabel.text = "Grafo por Grau é sobre ..."
		quizLabel.text = "Quiz é sobre ..."
	}

	private func animateViews() {

	}
}
