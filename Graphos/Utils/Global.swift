//
//  Global.swift
//  Graphos
//
//  Created by Leandro Sousa on 2021. 06. 02..
//  Copyright © 2021. Leandro Sousa. All rights reserved.
//

import Foundation

let numberOfLevels = 30

public enum PlistName: String {
	case gameData = "GameData"
	case gameDefinitions = "GameDefinitions"
}

public enum GameType: String, CaseIterable {
	case planar = "planar"
	case kRegular = "kRegular"
}

public enum LevelState: Int {
	case empty = 0
	case complete = 1
	case locked = 2

	public init(_ rawValue: Int) {
		switch rawValue {
		case 1:
			self = .complete
		case 2:
			self = .locked
		default:
			self = .empty
		}
	}
}
