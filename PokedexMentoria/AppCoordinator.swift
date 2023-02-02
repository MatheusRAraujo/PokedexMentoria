//
//  AppCoordinator.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 23/12/22.
//

import UIKit

final class AppCoordinator {
    
    let homeCoordinator = HomeCoordinator()
    
    func start() -> UIViewController {
        let tabBar = UITabBarController()
        
        let homeNavigationController = homeCoordinator.start()
        homeNavigationController.tabBarItem = UITabBarItem(title: "Home",
                                                     image: UIImage(systemName: "house"),
                                                     selectedImage: UIImage(systemName: "house.fill"))
        
        let seachViewController = UIViewController()
        seachViewController.tabBarItem = UITabBarItem(title: "Busca",
                                            image: UIImage(systemName: "magnifyingglass"),
                                            selectedImage: nil )
        
        let teamBuildViewController = UIViewController()
        teamBuildViewController.tabBarItem = UITabBarItem(title: "Times",
                                                          image: UIImage(systemName: "person.3"),
                                                          selectedImage: UIImage(systemName: "person.3.fill"))
        
        let settingsViewController = UIViewController()
        settingsViewController.tabBarItem = UITabBarItem(title: "Configurações",
                                                         image: UIImage(systemName: "gear"),
                                                         selectedImage: nil)
        
        
        tabBar.setViewControllers([homeNavigationController, seachViewController, teamBuildViewController, settingsViewController],
                                  animated: true)
        tabBar.tabBar.backgroundColor = .white
//        viewController = tabBar
        return tabBar
    }
    
}
