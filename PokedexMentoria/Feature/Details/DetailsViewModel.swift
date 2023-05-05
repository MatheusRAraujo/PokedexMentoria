//
//  DetailsViewModel.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 24/02/23.
//

import UIKit

protocol DetailsViewDelegate: AnyObject {
    func setUpInfo(model: PokemonModel)
}

protocol AbilitiesDetailsViewDelegate: AnyObject {
    func setUpAbilities(abilities: [AbilityModel])
}

protocol InfoDetailsViewDelegate: AnyObject {
    func setUpInfos(height: String, weight: String)
    func setUpSpecieInfo(pokedexEntry: String, specieName: String)
}

protocol StatsViewDelegate: AnyObject {
    func setUpStats(baseStatus: [BaseStats])
}

final class DetailsViewModel {
    
    let pokemonNumber: Int
    weak var delegate: DetailsCoordinatorDelegate?
    var detailsDelegate: DetailsViewDelegate?
    weak var abilitiesDelegate: AbilitiesDetailsViewDelegate?
    weak var infoDelegate: InfoDetailsViewDelegate?
    weak var statsDelegate: StatsViewDelegate?
    private let network = NetworkManager()
    
    var pokemonModel: PokemonModel?
    var pokemonSpecieModel: PokemonSpeciesModel?
    
    init(pokemonNumber: Int) {
        self.pokemonNumber = pokemonNumber
        loadInfos()
    }
    
    func loadInfos() {
        network.fetch(request: PokemonAPI.pokemon(id: pokemonNumber)) { [weak self] (result: Result<PokemonModel, Error>) in
            guard let self else { return }
            switch result {
            case .success(let pokemonModel):
                self.pokemonModel = pokemonModel
                self.detailsDelegate?.setUpInfo(model: pokemonModel)
                DispatchQueue.main.async {
                    self.abilitiesDelegate?.setUpAbilities(abilities: pokemonModel.abilities.compactMap{$0})
                    self.infoDelegate?.setUpInfos(height: self.height, weight: self.weight)
                    self.statsDelegate?.setUpStats(baseStatus: self.baseStats)
                }
                print(self.pokemonModel)
            case .failure(let error):
                print("Erro no details: \(error)")
            }
        }
        
        network.fetch(request: PokemonAPI.pokemonSpecies(id: pokemonNumber)) { [weak self] (result: Result<PokemonSpeciesModel, Error>) in
            guard let self else { return }
            print("id is: \(self.pokemonNumber)")
            switch result {
            case .success(let pokemonSpeciesModel):
                DispatchQueue.main.async {
                    self.pokemonSpecieModel = pokemonSpeciesModel
                    self.infoDelegate?.setUpSpecieInfo(pokedexEntry: self.pokedexEntry, specieName: self.specieName)
                    print(pokemonSpeciesModel)
                }
            case .failure(let error):
                print("Erro no details: \(error)")
            }
        }
    }
    
    var pokemonName: String {
        pokemonModel?.name.capitalized ?? ""
    }
    
    var pokemonPokedexNumber: String {
        pokemonModel?.id.stringWithFourCharacters ?? "#0000"
    }
    
    var pokemonTypes: [Types] {
        var pokemonTypes: [Types] = []
        guard let modelTypes = pokemonModel?.types else { return [] }
        for typeModel in modelTypes {
            if let type = Types(rawValue: typeModel.type.name) {
                pokemonTypes.append(type)
            }
        }
        return pokemonTypes
    }
    
    var height: String {
        guard let intHeight = pokemonModel?.height else { return "" }
        return "\(Double(intHeight) / 10) m"
    }
    
    var weight: String {
        guard let intWeight = pokemonModel?.weight else { return "" }
        return "\(Double(intWeight) / 10) kg"
    }
    
    var pokedexEntry: String {
        guard let model = pokemonSpecieModel else { return ""}
        var pokedexEntry = ""
        for flavorEntry in model.flavorTextEntries {
            if flavorEntry.language.name == "en" {
                pokedexEntry = flavorEntry.flavorText
                break
            }
        }
        return pokedexEntry.replacingOccurrences(of: "\\s", with: " ", options: .regularExpression)
    }
    
    var specieName: String {
        guard let model = pokemonSpecieModel else { return ""}
        var specieName = ""
        for genus in model.genera {
            if genus.language.name == "en" {
                specieName = genus.genus
                break
            }
        }
        return specieName.replacingOccurrences(of: "\\s", with: " ", options: .regularExpression)
    }
    
    var baseStats: [BaseStats] {
        var baseStats: [BaseStats] = []
        guard let statsModel = pokemonModel?.stats else {return []}
        for stat in statsModel {
            switch stat.stat.name {
            case "hp":
                baseStats.append(BaseStats(stat: .hp, value: stat.baseStat))
            case "attack":
                baseStats.append(BaseStats(stat: .attack, value: stat.baseStat))
            case "defense":
                baseStats.append(BaseStats(stat: .defense, value: stat.baseStat))
            case "special-attack":
                baseStats.append(BaseStats(stat: .specialAttack, value: stat.baseStat))
            case "special-defense":
                baseStats.append(BaseStats(stat: .specialDefense, value: stat.baseStat))
            case "speed":
                baseStats.append(BaseStats(stat: .speed, value: stat.baseStat))
            default:
                print("stats not found")
            }
        }
        return baseStats
    }
    
    var backgroundColor: UIColor {
        switch pokemonTypes.first {
        case .bug:
            return .bugLight
        case .dark:
            return .darkLight
        case .dragon:
            return .dragonLight
        case .electric:
            return .eletricLight
        case .fairy:
            return .fairyLight
        case .figthing:
            return .fightingLight
        case .fire:
            return .fireLight
        case .flying:
            return .flyingLight
        case .ghost:
            return .ghostLight
        case .grass:
            return .grassLight
        case .ground:
            return .groundLight
        case .ice:
            return .iceLight
        case .iron:
            return .steelLight
        case .normal:
            return .normalLight
        case .poison:
            return .poisonLight
        case .psychic:
            return .psychicLight
        case .rock:
            return .rockLight
        case .water:
            return .waterLight
        default:
            return .white
        }
    }
}
