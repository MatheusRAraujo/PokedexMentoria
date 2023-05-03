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
        label.text = "Titulo da barra"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.setProgress(0.4, animated: true)
        progressView.trackTintColor = .lightGray
        progressView.tintColor = .orange
        
        progressView.layer.borderWidth = 0.5
        progressView.layer.cornerRadius = 5.0
        progressView.clipsToBounds = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    func setUpProgressBar(title: String, progressValue: Float) {
        makeLayout()
        self.title.text = title
        self.progressView.progress = progressValue
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.subviews.forEach { $0.removeFromSuperview() }
    }
    
    private func makeLayout() {
        addSubview(title)
        addSubview(progressView)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.widthAnchor.constraint(equalToConstant: 120),
            
            progressView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 15)
        ])
    }
    
}
