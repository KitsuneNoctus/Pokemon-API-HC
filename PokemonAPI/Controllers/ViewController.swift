//
//  ViewController.swift
//  PokemonAPI
//
//  Created by Henry Calderon on 4/17/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pokedexTable: UITableView!
    let pokeUrl = "https://pokeapi.co/api/v2/pokemon/?limit=20"
    var limit: Int = 0
    
    var pokemon: [Pokemon] = []{
        didSet{
            pokedexTable.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pokedexTable.delegate = self
        pokedexTable.dataSource = self
        fetchPokemonName(url: pokeUrl)
    }
    
    func fetchPokemonName(url: String){
        let defaultSession = URLSession(configuration: .default)
//        (string: "\(pokeUrl)?limit=\(limit)&offset=0")
        
        if let url = URL(string: url){
            
            let request = URLRequest(url: url)
            
            let dataTask = defaultSession.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
                
//                print("data is: ", data!)
//                print("response is: ", response!)
                //GOT a lot of help from Cao and Mondale
                do{
                    if let json = try? JSONSerialization.jsonObject(with: data!, options: []) {
                        print(json)
                    }
                    let decoder = JSONDecoder()
                    let pokemen = try decoder.decode(PokemonResults.self, from: data!)
//                    print(pokemen)
                    self.pokemon.append(contentsOf: pokemen.results)

                    DispatchQueue.main.async {
                        self.pokedexTable.reloadData()
                    }

                }catch{
                    print("JSON error: \(error.localizedDescription)")
                }

            })
            dataTask.resume()
        }
    }
    
//    func fetchPokemonSprite(){
//        let defaultSession = URLSession(configuration: .default)
//    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath) as! PokedexTableViewCell
        let aPokemon = pokemon[indexPath.row]
        cell.pokemonNameLabel.text = aPokemon.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == tableView.numberOfSections - 1 && indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1{
            self.limit += 20
            fetchPokemonName(url: "https://pokeapi.co/api/v2/pokemon/?limit=\(20 + limit)&offset=\(limit)")
        }
    }
    
    
}



