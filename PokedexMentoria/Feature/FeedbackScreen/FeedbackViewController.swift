//
//  FeedbackViewController.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 27/01/23.
//

import UIKit

struct Feedback {
    let image: UIImage
    let title: String
    let text: String
}

final class FeedbackViewController: UIViewController {
    
    // Variables
    private let feedBack: Feedback
    
    private lazy var feedbackImageView: UIImageView = {
        let imageView = UIImageView(image: feedBack.image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = feedBack.title
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = feedBack.text
        return label
    }()
    
    private lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Ok", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.black, for: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(confirmButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // inits
    init(feedback: Feedback) {
        self.feedBack = feedback
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    // life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        buildViewHierarchy()
    }
    
    // methods
    @objc private func confirmButtonPressed() {
        dismiss(animated: true)
    }
    
    private func buildViewHierarchy() {
        view.addSubview(feedbackImageView)
        view.addSubview(titleLabel)
        view.addSubview(textLabel)
        view.addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            feedbackImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: .defaultSpacing),
            feedbackImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            feedbackImageView.widthAnchor.constraint(equalToConstant: .imageSize),
            feedbackImageView.heightAnchor.constraint(equalToConstant: .imageSize),
            
            titleLabel.topAnchor.constraint(equalTo: feedbackImageView.bottomAnchor, constant: .defaultSpacing),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .titleToTextSpacing),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            confirmButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: .defaultSpacing),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: .buttonWidth),
            confirmButton.heightAnchor.constraint(equalToConstant: .buttonHeight)
        ])
    }

}
