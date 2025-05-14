//
//  PersistenceManager.swift
//  Graphos
//
//  Created by Leandro Sousa on 2021. 06. 02..
//  Copyright © 2021. Leandro Sousa. All rights reserved.
//

import Foundation

public class PersistenceManager {

	public static var instance = PersistenceManager()
	private init() { }

	private let fileManager = FileManager.default
	private var documentsDirectory: String = ""
	private var gameDataDict: [String: [Level]]?
	private var gameDefinitionsDict: [String: [String]]?

	public func preparePlistForUse(_ pListName: PlistName) {
		let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		guard let documentsDirectory = paths.first else { return }
		self.documentsDirectory = documentsDirectory
		let path = documentsDirectory + "/\(pListName.rawValue).plist"

		// Check if the file exists in the documents directory
		if !fileManager.fileExists(atPath: path) {
			if let bundlePath = Bundle.main.path(forResource: pListName.rawValue, ofType: "plist") {
				do {
					// Copy the file from the bundle to the documents directory
					try fileManager.copyItem(atPath: bundlePath, toPath: path)
					print("File copied to documents directory: \(path)")
				} catch {
					print("Error copying plist file:", error.localizedDescription)
				}
			} else {
				print("Error: Plist file not found in bundle.")
			}
		} else {
			print("File already exists at path: \(path)")
		}

		// Load the plist content
		var plist: [String: Any]?
		do {
			let data = try Data(contentsOf: URL(fileURLWithPath: path))
			plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [String: Any]
			print("Plist loaded successfully.")
		} catch {
			print("Error loading plist:", error.localizedDescription)
		}

		// Map plist data to the appropriate dictionary
		switch pListName {
		case .gameData:
			gameDataDict = plist?.compactMapValues {
				($0 as? [Int])?.enumerated().map {
					Level($0.offset, LevelState(rawValue: $0.element) ?? .empty)
				}
			}
		case .gameDefinitions:
			gameDefinitionsDict = plist as? [String: [String]]
		}
	}

	// Salvar progresso do jogo
	public func saveGame(_ gameType: GameType, levelNumber: Int, levelState: LevelState) {
		var gameLevels = getGameLevels(gameType: gameType)
		gameLevels[levelNumber - 1].state = levelState
		gameDataDict?[gameType.rawValue] = gameLevels

		let path = documentsDirectory + "/\(PlistName.gameData.rawValue).plist"

		// Debugging: Check if the file exists
		if !fileManager.fileExists(atPath: path) {
			print("Error: File does not exist at path \(path).")
			return
		} else {
			print("File exists at path: \(path)")
		}

		// Salvar os dados de volta ao arquivo
		DispatchQueue.global(qos: .background).async {
			do {
				let gameIntData = [gameType.rawValue: gameLevels.map(\.state.rawValue)]
				let data = try PropertyListSerialization.data(fromPropertyList: gameIntData, format: .xml, options: 0)
				try data.write(to: URL(fileURLWithPath: path))
			} catch {
				print("Error saving game data:", error.localizedDescription)
			}
		}
	}

	// Resetar o progresso do jogo
	public func resetProgress() {
		let path = documentsDirectory + "/\(PlistName.gameData.rawValue).plist"

		DispatchQueue.global(qos: .background).async {
			do {
				// Remove the existing file if it exists
				if self.fileManager.fileExists(atPath: path) {
					try self.fileManager.removeItem(atPath: path)
					print("File removed at path: \(path)")
				} else {
					print("File does not exist at path: \(path)")
				}

				// Recreate the plist file
				self.preparePlistForUse(.gameData)

				self.gameDataDict?.removeAll()

				var gameIntData: [String: [Int]] = [:]
				for gameType in GameType.allCases {
					let levels = (0..<numberOfLevels).map { level in
						(Level(level, level == 0 ? .empty : .locked), level == 0 ? 0 : 2)
					}
					self.gameDataDict?[gameType.rawValue] = levels.map { $0.0 }
					gameIntData[gameType.rawValue] = levels.map { $0.1 }
				}

				let data = try PropertyListSerialization.data(fromPropertyList: gameIntData, format: .xml, options: 0)
				try data.write(to: URL(fileURLWithPath: path))
				print("Reset progress saved successfully.")
			} catch {
				print("Error saving reset progress:", error.localizedDescription)
			}
		}
	}

	// Obter os níveis do jogo
	public func getGameLevels(gameType: GameType) -> [Level] {
		return gameDataDict?[gameType.rawValue] ?? []
	}

	// Obter definições do jogo
	public func getGameDefinitions(gameType: GameType) -> [String]? {
		return gameDefinitionsDict?[gameType.rawValue]
	}
}
