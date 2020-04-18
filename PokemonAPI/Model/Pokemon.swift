//
//  Pokemon.swift
//  PokemonAPI
//
//  Created by Henry Calderon on 4/17/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation

//MARK: Root Struct - 1 layer
// This is the first thing you recieve
struct PokemonResults: Codable {
    let next: String
    let results: [Pokemon]
}

//MARK: Decodable Struct - 2 layer
//The Pokemon in the list
struct Pokemon: Codable{
    let name: String
    let pokemonInforUrl: String
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case pokemonInforUrl = "url"
    }
}

//MARK: Pokemon Details Struct - 3 layer
struct pokemonDetail: Decodable{
    let forms: [Form]
}

//MARK: Form Struct - 4 layer
struct Form: Decodable {
    let name: String
    let sprites: pokemonSprite
    enum CodingKeys: String, CodingKey{
        case name = "name"
        case sprites = "sprites"
    }
}

//MARK: Pokemon Sprites Struct - 5 layer
struct pokemonSprite: Decodable{
    let front: String
    
    enum CodingKeys: String, CodingKey {
        case front = "front_default"
    }
}

//struct pokedex: Decodable {
//    var pokemon: [Pokemon]
//}

//extension Pokemon: Decodable{
//    enum PokemonKeys: String, CodingKey {
//        case name
//        case pokemonInforUrl = "url"
//    }
//
//    init(from decoder: Decoder) throws {
//        let pokemonContainer = try decoder.container(keyedBy: PokemonKeys.self)
//        name = try pokemonContainer.decode(String.self, forKey: .name)
////        let screenshotURLContainer = try pokemonContainer.nestedContainer(keyedBy: PreviewImageURLKeys.self, forKey: .previewImageURL)
//
////        pokemonInforUrl = try screenshotURLContainer.decode(URL.self, forKey: .imageURL)
//    }
//}
