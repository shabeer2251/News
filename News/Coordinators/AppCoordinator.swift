//
//  AppCoordinator.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import UIKit

enum AppTransition {
    case mainScreen
    case fullNewsScreen(news: News)
}

class AppCoordinator {
    private let window: UIWindow
    private var rootViewController: UINavigationController
    
    // MARK: initialization
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
    }
    
    // MARK: Coordinator methods
    func start() {
        window.rootViewController = rootViewController
        rootViewController.navigationBar.isHidden = true
        performTransition(transition: .mainScreen)
        window.makeKeyAndVisible()
    }
    
    func performTransition(transition: AppTransition) {
        switch transition {
        case .mainScreen:
            let viewModel = HomeViewModel(delegate: self)
            let viewController = HomeViewController(viewModel: viewModel)
            rootViewController.pushViewController(viewController, animated: true)
        case .fullNewsScreen(let news):
            let viewModel = FullNewsViewModel(news: news)
            let viewController = FullNewsViewController(viewModel: viewModel)
            rootViewController.present(viewController, animated: true, completion: nil)
        }
    }

}

extension AppCoordinator: HomeViewnavigationDelegate {
    func handleSeeFullNewsTapped(news: News) {
        performTransition(transition: .fullNewsScreen(news: news))
    }
}
