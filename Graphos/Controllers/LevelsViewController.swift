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
	@IBOutlet weak var collectionView: UICollectionView!
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
	private var levels: [Level] = []

	public override func viewDidLoad() {
		super.viewDidLoad()
		setStrings()
		setupLevels()
		setupCollectionView()
	}

	public override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		adjustCollectionViewLayout()
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

	private func setupLevels() {
		levels = PersistenceManager.instance.getGameLevels(gameType: gameType)
	}

	private func setupCollectionView() {
		let layout = UICollectionViewFlowLayout()
		layout.minimumLineSpacing = 10
		layout.minimumInteritemSpacing = 10
		layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

		collectionView.setCollectionViewLayout(layout, animated: true)
		collectionView.backgroundColor = .clear
		collectionView.dataSource = self
		collectionView.delegate = self
		collectionView.register(LevelCell.self, forCellWithReuseIdentifier: "LevelCell")
	}

	private func adjustCollectionViewLayout() {
		guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout else { return }

		let itemsPerRow: CGFloat = 5
		let itemsPerColumn: CGFloat = 6
		let totalHorizontalSpacing = layout.minimumInteritemSpacing * (itemsPerRow - 1) + layout.sectionInset.left + layout.sectionInset.right
		let totalVerticalSpacing = layout.minimumLineSpacing * (itemsPerColumn - 1) + layout.sectionInset.top + layout.sectionInset.bottom
		let itemWidth = (collectionView.bounds.width - totalHorizontalSpacing) / itemsPerRow
		let itemHeight = (collectionView.bounds.height - totalVerticalSpacing) / itemsPerColumn
		layout.itemSize = CGSize(width: itemWidth, height: itemHeight)

		collectionView.collectionViewLayout.invalidateLayout()
	}

	private func actionLevel(_ level: Level) {
		if let gameVC = ViewManager.gameViewController() as? GameViewController {
			gameVC.gameType = gameType
			gameVC.levelNumber = level.number
			navigationController?.pushViewController(gameVC, animated: true)
		}
	}
}

extension LevelsViewController: UICollectionViewDataSource {
	public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return levels.count
	}

	public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LevelCell", for: indexPath) as! LevelCell
		cell.configure(with: levels[indexPath.item])
		return cell
	}
}

extension LevelsViewController: UICollectionViewDelegateFlowLayout {
	public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let level = levels[indexPath.item]
		guard level.state != .locked else { return }
		actionLevel(level)
	}
}
