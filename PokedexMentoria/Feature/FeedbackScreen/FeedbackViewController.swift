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
        button.setTitle("Ok.", for: .normal)
        button.setTitleColor(.black, for: .selected)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(confirmButtonPressed), for: .touchUpOutside)
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
        view.backgroundColor = .yellow
    }
    
    // methods
    @objc private func confirmButtonPressed() {
        navigationController?.popViewController(animated: true)
    }

}
