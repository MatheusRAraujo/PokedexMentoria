//
//  PokemonAbilitiesViewController.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 31/03/23.
//

import UIKit

final class PokemonAbilitiesViewController: UIViewController {
    
    
    // UI Elements
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PokemonAbilityCell.self, forCellReuseIdentifier: PokemonAbilityCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    // Variables
    var abilities: [String]
    
    // Initializers
    init(abilities: [String]) {
        self.abilities = abilities
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
        //        tableView.reloadData()
    }
    
    private func makeLayout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension PokemonAbilitiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        abilities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonAbilityCell.identifier, for: indexPath) as? PokemonAbilityCell else { return UITableViewCell() }
        cell.setUp(abilityName: abilities[indexPath.row])
        return cell
    }
    
}

extension PokemonAbilitiesViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
}

extension PokemonAbilitiesViewController: AbilitiesDetailsViewDelegate {
    func setUpAbilities(abilities: [String]) {
        self.abilities = abilities
        tableView.reloadData()
    }
    
    
}
