//
//  TabBarComponent.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 03/03/23.
//

import UIKit

final class TabBarComponent: UIViewController {
    
    var currentIndex: Int = 1
    
    private lazy var segmentController: UISegmentedControl = {
        let segment = UISegmentedControl(items: titles)
        segment.selectedSegmentIndex = 0
        segment.tintColor = UIColor.black
        segment.backgroundColor = UIColor.white
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.addTarget(self, action: #selector(segmentValueChange(sender:)), for: .valueChanged)
        return segment
    }()
    
    private lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.setViewControllers([viewControllers[0]], direction: .forward, animated: true)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        return pageViewController
    }()
    
    private var pageView: UIView {
        pageViewController.view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLayout()
    }
    
    private let viewControllers: [UIViewController]
    private let titles: [String]
    
    init(viewControllersWithTitle: [String : UIViewController] ) {
        self.titles = viewControllersWithTitle.keys.compactMap{$0}
        self.viewControllers = viewControllersWithTitle.values.compactMap { $0 }
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Methods
    
    private func makeLayout() {
        view.addSubview(segmentController)
        pageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageView)
        addChild(pageViewController)
        
        NSLayoutConstraint.activate([
            segmentController.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            segmentController.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            segmentController.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),

            pageView.topAnchor.constraint(equalTo: segmentController.bottomAnchor),
            pageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            pageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            pageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func segmentValueChange(sender: UISegmentedControl) {
        let nextIndex = sender.selectedSegmentIndex
        if nextIndex < currentIndex {
            pageViewController.setViewControllers([viewControllers[nextIndex]], direction: .reverse, animated: true)
        } else {
            pageViewController.setViewControllers([viewControllers[nextIndex]], direction: .forward, animated: true)
        }
        currentIndex = nextIndex
    }
    
}

extension TabBarComponent: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let actualIndex = viewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = actualIndex + 1
        
        guard nextIndex < viewControllers.count else {
            return viewControllers.first }
        guard viewControllers.count > nextIndex else { return nil }
        
        return viewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let actualIndex = viewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = actualIndex - 1
        
        guard previousIndex >= 0  else {
            return viewControllers.last }
        guard viewControllers.count > previousIndex else { return nil }
        
        return viewControllers[previousIndex]
    }
    
}

extension TabBarComponent: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let vc = pendingViewControllers.first else { return }
        let nextIndex = viewControllers.firstIndex(of: vc) ?? 0
        segmentController.selectedSegmentIndex = nextIndex
    }
}
