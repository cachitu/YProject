//
//  TabBarCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import RxSwift
import UIKit

enum Tab: Int {
    case home, swap, staking, gov
}

class TabBarCoordinator: Coordinator {
    private let disposeBag = DisposeBag()

    private lazy var homeCoordinator: HomeCoordinator = {
        return HomeCoordinator(parentCoordinator: self)
    }()

    //TODO: declaere the rest of coordinators

    private var tabBarViewController: MainTabBarViewController?

    override init(parentCoordinator: Coordinator?, navigationController: BaseNavigationController = BaseNavigationController()) {
        super.init(parentCoordinator: parentCoordinator, navigationController: navigationController)
        navigationController.setNavigationBarHidden(true, animated: false)
    }

    override func start() {
        let tabBarController: MainTabBarViewController = UIStoryboard.storyboard(.mainTabBar).instantiateViewController()

        tabBarViewController = tabBarController

        homeCoordinator.navigationController.tabBarItem =
            UITabBarItem(title: "Home".localized,
                         image: Images.TabBarIcons.home.image,
                         tag: Tab.home.rawValue)

        //TODO: the same for the rest of coordinators

        tabBarController.setViewControllers([homeCoordinator.navigationController//,
                                             //SwapCoordinator.navigationController,
                                             //...
                                                ], animated: true)
        homeCoordinator.start()

        //TODO: the same for the rest of coordinators

        navigationController.setViewControllers([tabBarController], animated: false)
    }

    override func childCoordinatorDidFinish(coordinator: Coordinator) {
        parentCoordinator?.childCoordinatorDidFinish(coordinator: self)
    }

    func switchToTab(selected: Tab) {
        tabBarViewController?.selectTab(selected)
    }
}
