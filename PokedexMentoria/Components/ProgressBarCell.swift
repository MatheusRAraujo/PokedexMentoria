//
//  ProgressBarCell.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 26/04/23.
//

import UIKit

final class ProgressBarCell: UITableViewCell {
    
    static let identifier = "progress_bar_cell"
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statsValue: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.trackTintColor = UIColor(red: 211/255, green: 211/255, blue: 211/255, alpha: 0.5)
        progressView.layer.borderWidth = 0.5
        progressView.layer.cornerRadius = 5.0
        progressView.clipsToBounds = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    func setUpProgressBar(stats: BaseStats) {
        makeLayout()
        self.title.text = stats.stat.rawValue
        self.progressView.progress = stats.progress
        self.progressView.tintColor = stats.color
        self.statsValue.text = stats.stringValue
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private func makeLayout() {
        addSubview(title)
        addSubview(progressView)
        addSubview(statsValue)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            statsValue.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2),
            statsValue.leadingAnchor.constraint(equalTo: leadingAnchor),
            statsValue.widthAnchor.constraint(equalToConstant: 40),
            statsValue.heightAnchor.constraint(equalToConstant: 15),
            
            progressView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2),
            progressView.leadingAnchor.constraint(equalTo: statsValue.trailingAnchor, constant: 2),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            progressView.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
}
