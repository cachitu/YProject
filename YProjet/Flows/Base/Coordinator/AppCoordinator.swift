//
//  AppCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

class AppCoordinator: Coordinator {

    weak var window: UIWindow?

    private var welcomeCoordinator: WelcomeCoordinator?
    private var tabBarCoordinator: TabBarCoordinator?

    // The restored selected tab index for UITabBarController.
    var restoredSelectedTab: Int = 0 {
        didSet {
            if let tab = Tab(rawValue: restoredSelectedTab) {
                tabBarCoordinator?.switchToTab(selected: tab)
            }
        }
    }

    required init(window: UIWindow) {
        self.window = window
        super.init(parentCoordinator: nil)
    }

    override func start() {
        showRootViewController()
    }

    override func childCoordinatorDidFinish(coordinator: Coordinator) {
        showRootViewController()
    }
}

private extension AppCoordinator {

    func showRootViewController() {
        // Dismissing all the viewControllers above current rootViewController before adding the new rootViewController
        window?.rootViewController?.dismiss(animated: false, completion: nil)

        welcomeCoordinator = WelcomeCoordinator(parentCoordinator: self, navigationController: navigationController)
        welcomeCoordinator?.start()
        
//        if !isUserLogged {
//            accountAccessCoordinator = AccessAccountCoordinator(parentCoordinator: self, navigationController: navigationController)
//            accountAccessCoordinator?.start()
//
//            tabBarCoordinator = nil
//        } else {
//            tabBarCoordinator = TabBarCoordinator(parentCoordinator: self, navigationController: navigationController)
//            tabBarCoordinator?.start()
//
//            accountAccessCoordinator = nil
//        }
        window?.rootViewController = navigationController
    }
}

