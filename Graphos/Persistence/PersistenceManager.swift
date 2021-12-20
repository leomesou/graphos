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
	private var gameDataDict: NSMutableDictionary?
	private var gameDefinitionsDict: NSMutableDictionary?

	public func preparePlistForUse(_ pListName: PlistName) {
		let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
		guard let documentsDirectory = paths.first else { return }
		self.documentsDirectory = documentsDirectory
		let path = documentsDirectory + "/\(pListName.rawValue).plist"
		if !fileManager.fileExists(atPath: path), let bundlePath = Bundle.main.path(forResource: pListName.rawValue, ofType: "plist") {
			do {
				try fileManager.copyItem(atPath: bundlePath, toPath: path)
			} catch {
				print("Error preparing plist:", error.localizedDescription)
			}
		}
		var plist: NSMutableDictionary?
		do {
			let data = fileManager.contents(atPath: path) ?? Data()
			plist = try PropertyListSerialization.propertyList(from: data, options: .mutableContainersAndLeaves, format: nil) as? NSMutableDictionary
		}
		catch {
			print("Error creating gamesDict:", error.localizedDescription)
		}
		switch pListName {
		case .gameData:
			gameDataDict = plist
		case .gameDefinitions:
			gameDefinitionsDict = plist
		}
	}

	public func saveGame(_ gameType: GameType, levelNumber: Int, levelState: LevelState) {
		let gameLevels = getGameLevels(gameType: gameType)
		gameLevels?.replaceObject(at: levelNumber, with: levelState.rawValue)
		gameDataDict?.setValue(gameLevels, forKey: gameType.rawValue)
		let path = documentsDirectory + "/\(PlistName.gameData.rawValue).plist"
		gameDataDict?.write(toFile: path, atomically: true)
	}

	public func resetProgress() {
		let path = documentsDirectory + "/\(PlistName.gameData.rawValue).plist"
		if fileManager.fileExists(atPath: path) {
			do {
				try fileManager.removeItem(atPath: path)
			}
			catch {
				print("Couldn't reset plist:", error.localizedDescription)
			}
		}

		gameDataDict?.removeAllObjects()
		let emptyArray = NSMutableArray(array: Array(repeating: 2, count: numberOfLevels))
		for gameType in GameType.allCases {
			gameDataDict?.setValue(emptyArray, forKey: gameType.rawValue)
			saveGame(gameType, levelNumber: 0, levelState: .empty)
		}
		gameDataDict?.write(toFile: path, atomically: true)
	}

	public func getGameLevels(gameType: GameType) -> NSMutableArray? {
		return gameDataDict?.value(forKey: gameType.rawValue) as? NSMutableArray
	}

	public func getGameDefinitions(gameType: GameType) -> NSArray? {
		return gameDefinitionsDict?.value(forKey: gameType.rawValue) as? NSArray
	}
}
