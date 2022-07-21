//
//  CharacterModelToHomeCellModeMapper.swift
//  PatronesDiseno
//
//  Created by Julio Rodriguez Reategui on 21/07/22.
//

import Foundation

protocol CharacterModelToHomeCellModelMapperProtocol {
    func map(_ characters: CharactersModel?) -> [HomeCellModel]
    func map(_ character: CharacterModel?) -> HomeCellModel?
}

class CharacterModelToHomeCellModelMapper: CharacterModelToHomeCellModelMapperProtocol {
    func map(_ characters: CharactersModel?) -> [HomeCellModel] {
        guard let characters = characters else { return [] }
        return characters.compactMap { map($0) }
    }

    func map(_ character: CharacterModel?) -> HomeCellModel? {
        guard let character = character else { return nil }
        return HomeCellModel(image: character.image,
                             title: character.name)
    }
}
