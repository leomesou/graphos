//
//  Level.swift
//  Graphos
//
//  Created by Leandro Sousa on 14/05/2025.
//  Copyright © 2025 Leandro Sousa. All rights reserved.
//

import Foundation

public struct Level {
	let number: Int
	var state: LevelState

	init(_ level: Int, _ state: LevelState) {
		self.number = level
		self.state = state
	}
}
