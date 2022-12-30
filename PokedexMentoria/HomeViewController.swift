//
//  HomeViewController.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 23/12/22.
//

import UIKit

protocol HomeCoordinatorDelegate: DidFinishCoordinatorDelegate {
    func goToFirstView()
    func goToSecondView()
}

class HomeViewController: ViewController {
    
    private var homeCoordinatorDelegate: HomeCoordinatorDelegate? {
        coordinatorDelegate as? HomeCoordinatorDelegate
    }
    
    private lazy var customView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitle("Present", for: .normal)
        button.addTarget(self, action: #selector(presentScreen), for: .touchUpInside)
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .gray
        button.setTitle("Push", for: .normal)
        button.addTarget(self, action: #selector(pushScreen), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        makeLayout()
    }
    
    @objc private func presentScreen() {
        print("present button tapped")
        homeCoordinatorDelegate?.goToFirstView()
    }
    
    @objc private func pushScreen() {
        print("Push button pressed")
        homeCoordinatorDelegate?.goToSecondView()
    }
    
    func makeLayout() {
        customView.addSubview(presentButton)
        customView.addSubview(pushButton)
        view.addSubview(customView)
        
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            customView.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        NSLayoutConstraint.activate([
            presentButton.topAnchor.constraint(equalTo: customView.topAnchor, constant: 20),
            presentButton.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 10),
            presentButton.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10),
            presentButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
            pushButton.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 10),
            pushButton.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10),
            pushButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }

}

