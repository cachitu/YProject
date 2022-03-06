//
//  TabBarCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import RxSwift
import UIKit

enum Tab: Int {
    case home, staking, gov
}

class TabBarCoordinator: Coordinator {
    private let disposeBag = DisposeBag()

    private lazy var homeCoordinator: HomeCoordinator = {
        return HomeCoordinator(parentCoordinator: self)
    }()

    private lazy var stakingCoordinator: StakingCoordinator = {
        return StakingCoordinator(parentCoordinator: self)
    }()

    private lazy var govCoordinator: GovCoordinator = {
        return GovCoordinator(parentCoordinator: self)
    }()

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

        stakingCoordinator.navigationController.tabBarItem =
            UITabBarItem(title: "Staking".localized,
                         image: Images.TabBarIcons.staking.image,
                         tag: Tab.staking.rawValue)

        govCoordinator.navigationController.tabBarItem =
            UITabBarItem(title: "Gov".localized,
                         image: Images.TabBarIcons.gov.image,
                         tag: Tab.gov.rawValue)

        tabBarController.setViewControllers([homeCoordinator.navigationController,
                                             stakingCoordinator.navigationController,
                                             govCoordinator.navigationController
                                                ], animated: true)
        homeCoordinator.start()
        stakingCoordinator.start()
        govCoordinator.start()

        navigationController.setViewControllers([tabBarController], animated: false)
    }

    override func childCoordinatorDidFinish(coordinator: Coordinator) {
        parentCoordinator?.childCoordinatorDidFinish(coordinator: self)
    }

    func switchToTab(selected: Tab) {
        tabBarViewController?.selectTab(selected)
    }
}
