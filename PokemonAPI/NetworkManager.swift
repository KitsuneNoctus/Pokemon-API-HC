//
//  NetworkManager.swift
//  PokemonAPI
//
//  Created by Henry Calderon on 4/17/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation

class NetworkManager{
    // shared singleton session object used to run tasks. Will be useful later
    let defaultSession = URLSession(configuration: .default)
//    let urlSession = URLSession.shared
    
    var baseURL = "https://pokeapi.co/api/v2/pokemon/"
    
//    let fullURL = URL(string: baseURL + query)!
    
//    var request = URLRequest(url: fullURL)
    
    //MARK: Get Pokemon
    func getPokemon(completion: @escaping ([Pokemon]) -> Void){
        
    }
    
    //MARK: Endpoint
//    enum EndPoints{
//
//    }
    
    //MARK: Make Request
//    private func makeRequest(){
//
//    }
    
    //MARK: Result ENUM
//    enum Result<T> {
//     case success(T)
//     case failure(Error)
//    }
    
    //MARK: Endpoint Error ENUM
//    enum EndPointError: Error {
//      case couldNotParse
//      case noData
//    }
}
