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
	private var gameDataDict: [String: [Int]]?
	private var gameDefinitionsDict: [String: [String]]?

	// Preparação do arquivo plist
	public func preparePlistForUse(_ pListName: PlistName) {
		let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		guard let documentsDirectory = paths.first else { return }
		self.documentsDirectory = documentsDirectory
		let path = documentsDirectory + "/\(pListName.rawValue).plist"

		// Copiar o arquivo plist se não existir
		if !fileManager.fileExists(atPath: path), let bundlePath = Bundle.main.path(forResource: pListName.rawValue, ofType: "plist") {
			do {
				try fileManager.copyItem(atPath: bundlePath, toPath: path)
			} catch {
				print("Error preparing plist:", error.localizedDescription)
			}
		}

		// Carregar o conteúdo do plist
		var plist: [String: Any]?
		do {
			let data = try Data(contentsOf: URL(fileURLWithPath: path))
			plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? [String: Any]
		} catch {
			print("Error creating gamesDict:", error.localizedDescription)
		}

		switch pListName {
		case .gameData:
			gameDataDict = plist as? [String: [Int]]
		case .gameDefinitions:
			gameDefinitionsDict = plist as? [String: [String]]
		}
	}

	// Salvar progresso do jogo
	public func saveGame(_ gameType: GameType, levelNumber: Int, levelState: LevelState) {
		guard var gameLevels = getGameLevels(gameType: gameType) else { return }
		gameLevels[levelNumber] = levelState.rawValue
		gameDataDict?[gameType.rawValue] = gameLevels

		let path = documentsDirectory + "/\(PlistName.gameData.rawValue).plist"

		// Salvar os dados de volta ao arquivo
		DispatchQueue.global(qos: .background).async {
			do {
				let data = try PropertyListSerialization.data(fromPropertyList: self.gameDataDict ?? [:], format: .xml, options: 0)
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
			if self.fileManager.fileExists(atPath: path) {
				do {
					try self.fileManager.removeItem(atPath: path)
				} catch {
					print("Couldn't reset plist:", error.localizedDescription)
				}
			}

			self.gameDataDict?.removeAll()
			let emptyArray = Array(repeating: 2, count: numberOfLevels)
			for gameType in GameType.allCases {
				self.gameDataDict?[gameType.rawValue] = emptyArray
				self.saveGame(gameType, levelNumber: 0, levelState: .empty)
			}
			do {
				let data = try PropertyListSerialization.data(fromPropertyList: self.gameDataDict ?? [:], format: .xml, options: 0)
				try data.write(to: URL(fileURLWithPath: path))
			} catch {
				print("Error saving game data:", error.localizedDescription)
			}
		}
	}

	// Obter os níveis do jogo
	public func getGameLevels(gameType: GameType) -> [Int]? {
		return gameDataDict?[gameType.rawValue]
	}

	// Obter definições do jogo
	public func getGameDefinitions(gameType: GameType) -> [String]? {
		return gameDefinitionsDict?[gameType.rawValue]
	}
}
