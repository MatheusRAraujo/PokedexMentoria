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

class FeedbackViewController: UIViewController {
    
    // Variables
    let feedBack: Feedback
    
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            feedbackImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.defaultSpacing),
            feedbackImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            feedbackImageView.widthAnchor.constraint(equalToConstant: Constants.imageSize),
            feedbackImageView.heightAnchor.constraint(equalToConstant: Constants.imageSize),
            
            titleLabel.topAnchor.constraint(equalTo: feedbackImageView.bottomAnchor, constant: Constants.defaultSpacing),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.titleToTextSpacing),
            textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            confirmButton.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: Constants.defaultSpacing),
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
            confirmButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight)
        ])
    }

}

extension FeedbackViewController {
    enum Constants {
        static let imageSize: CGFloat = 100
        static let defaultSpacing: CGFloat = 90
        static let titleToTextSpacing: CGFloat = 30
        static let buttonWidth: CGFloat = 110
        static let buttonHeight: CGFloat = 50
    }
}