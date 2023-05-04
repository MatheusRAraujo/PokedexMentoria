//
//  StatsViewController.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 26/04/23.
//

import UIKit

final class StatsViewController: UIViewController {
    
    // MARK: - UI Elements
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProgressBarCell.self, forCellReuseIdentifier: ProgressBarCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorColor = .clear
        return tableView
    }()
    
    // MARK: - Variables
    
    var stats: [BaseStats] = []
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
    }
    
    func makeLayout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
}

extension StatsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        stats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProgressBarCell.identifier, for: indexPath) as? ProgressBarCell else { return UITableViewCell() }
        cell.setUpProgressBar(stats: stats[indexPath.row])
        return cell
    }
    
}

extension StatsViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        UITableView.automaticDimension
        return 55
    }
    
    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

extension StatsViewController: StatsViewDelegate {
    
    func setUpStats(baseStatus: [BaseStats]) {
        self.stats = baseStatus
        self.tableView.reloadData()
    }
    
}
