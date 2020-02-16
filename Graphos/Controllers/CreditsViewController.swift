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

	@IBAction func backAction(_ sender: Any) {
		navigationController?.popToRootViewController(animated: true)
	}

	private func setStrings() {
		titleLabel.text = "Créditos"
		developedByLabel.text = "Desenvolvido por Leandro Sousa"
		aboutLabel.text = "Jogo criado para auxiliar no ensino de grafos"
	}

	private func animateViews() {

	}
}
