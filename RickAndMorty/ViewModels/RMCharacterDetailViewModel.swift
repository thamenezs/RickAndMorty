//
//  RMCharacterDetailViewModel.swift
//  RickAndMorty
//
//  Created by Thais Souza on 17/07/25.
//

import Foundation

final class RMCharacterDetailViewModel {
    
    private let character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
    
    public var title: String {
        character.name.uppercased()
    }
}
