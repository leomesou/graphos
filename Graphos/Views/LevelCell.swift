//
//  LevelCell.swift
//  Graphos
//
//  Created by Leandro Sousa on 13/05/2025.
//  Copyright © 2025 Leandro Sousa. All rights reserved.
//

import UIKit

class LevelCell: UICollectionViewCell {
	private let imageView = UIImageView()
	private let levelLabel = UILabel()
	private let overlayImageView = UIImageView()

	override init(frame: CGRect) {
		super.init(frame: frame)

		contentView.layer.borderColor = UIColor.white.cgColor
		contentView.layer.borderWidth = 3
		contentView.clipsToBounds = true
		contentView.backgroundColor = .clear

		// Add overlayImageView
		overlayImageView.contentMode = .center
		overlayImageView.alpha = 0.25
		overlayImageView.tintColor = .white
		overlayImageView.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(overlayImageView)

		// Add levelLabel
		levelLabel.textAlignment = .center
		levelLabel.font = UIFont(name: "Rajdhani-Medium", size: 30)
		levelLabel.textColor = .white
		levelLabel.translatesAutoresizingMaskIntoConstraints = false
		contentView.addSubview(levelLabel)

		// Set up constraints
		NSLayoutConstraint.activate([
			// Center overlayImageView
			overlayImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			overlayImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			overlayImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
			overlayImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),

			// Center levelLabel
			levelLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
			levelLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			levelLabel.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor, multiplier: 0.9)
		])
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configure(with level: Level) {
		levelLabel.text = "\(level.number)"
		switch level.state {
		case .empty:
			overlayImageView.image = nil
			overlayImageView.isHidden = true
		case .complete:
			overlayImageView.image = Images.checkmark
			overlayImageView.isHidden = false
		case .locked:
			overlayImageView.image = Images.lock
			overlayImageView.isHidden = false
		}
	}
}
