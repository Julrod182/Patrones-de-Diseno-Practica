//
//  CharacterModel.swift
//  PatronesDiseno
//
//  Created by Julio Rodriguez Reategui on 18/07/22.
//

import Foundation

typealias CharactersModel = [CharacterModel]

struct CharacterModel {
    var image: String?
    var name: String
    var lastname: String
    var score: Float = 0.0
}

var sampleCharactersData: CharactersModel = [
    
    CharacterModel(image: "goku", name: "Goku", lastname: "", score: 10.0),
    CharacterModel(image: "vegeta", name: "Vegeta", lastname: "", score: 9.8),
    CharacterModel(image: "roshi", name: "Mestro Roshi", lastname: "", score: 9.0),
    CharacterModel(image: "gohan", name: "Gohan", lastname: "", score: 8.0),
    CharacterModel(image: "goten", name: "Goten", lastname: "", score: 9.2),
    CharacterModel(image: "trunks", name: "Trunks", lastname: "", score: 8.5),
    CharacterModel(image: "krilin", name: "Krilin", lastname: "", score: 8.5),
    CharacterModel(image: "picoro", name: "Picoro", lastname: "", score: 8.5)
]
