//
//  ViewController.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 30/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    weak var coordinatorDelegate: Coordinator?
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        coordinatorDelegate?.didFinish()
    }
    
    deinit {
        #if DEBUG
        print("\(Self.self) desalocado")
        #endif
    }

}
