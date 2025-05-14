//
//  GameViewController.swift
//  Graphos
//
//  Created by Leandro Sousa on 08/02/20.
//  Copyright © 2020 Leandro Sousa. All rights reserved.
//

import UIKit
import SpriteKit

public class GameViewController: UIViewController {

	@IBOutlet weak var topView: UIView! {
		didSet {
			topView.backgroundColor = Colors.techGreen
		}
	}
	@IBOutlet weak var previousButton: UIButton! {
		didSet {
			previousButton.tintColor = .white
		}
	}
	@IBOutlet weak var reloadButton: UIButton! {
		didSet {
			reloadButton.tintColor = .white
		}
	}
	@IBOutlet weak var nextButton: UIButton! {
		didSet {
			nextButton.tintColor = .white
		}
	}
	@IBOutlet weak var helpButton: UIButton! {
		didSet {
			helpButton.tintColor = .white
		}
	}
	@IBOutlet weak var gameView: SKView! {
		didSet {
			gameView.backgroundColor = Colors.techGreen
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
			bottomView.backgroundColor = Colors.techGreen
		}
	}

	public var gameType: GameType = .planar
	public var levelNumber: Int = 1

	public override func viewDidLoad() {
		super.viewDidLoad()
		loadGame()
	}

	private func loadGame() {
		let gameScene = SKScene()
		gameScene.scaleMode = .aspectFill
		gameView.ignoresSiblingOrder = true
		gameView.presentScene(gameScene)
	}

	@IBAction func previousAction(_ sender: Any) {
		//
	}

	@IBAction func reloadAction(_ sender: Any) {
		//
	}

	@IBAction func nextAction(_ sender: Any) {
		//
	}

	@IBAction func helpAction(_ sender: Any) {
		navigationController?.pushViewController(ViewManager.helpViewController(), animated: true)
	}

	@IBAction func backAction(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}

	@IBAction func settingsAction(_ sender: Any) {
		navigationController?.pushViewController(ViewManager.settingsViewController(), animated: true)
	}
}
