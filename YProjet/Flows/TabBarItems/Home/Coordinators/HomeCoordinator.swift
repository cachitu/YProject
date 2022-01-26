//
//  HomeCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

class HomeCoordinator: Coordinator {

    private var walletDetailsCoordinator: WalletDetailsCoordinator?
    private var settingsCoordinator: SettingsCoordinator?

    override func start() {
        showHome(type: .navigationRoot)
    }

    func showHome(type: SceneTransitionType) {
        transition(to: .home(HomeViewModel(coordinator: self)), type: type, animated: true, completion: nil)
    }

    override func childCoordinatorDidFinish(coordinator: Coordinator) {
        switch coordinator {
        case is WalletDetailsCoordinator:
            walletDetailsCoordinator = nil
        case is SettingsCoordinator:
            settingsCoordinator = nil
        default:
            break
        }
    }

    override func flowFinished() {
        pop(animated: true, completion: nil)
        parentCoordinator?.childCoordinatorDidFinish(coordinator: self)
    }
}

extension HomeCoordinator: HomeCoordinatorProtocol {
    func showWalletDetails() {
        walletDetailsCoordinator = WalletDetailsCoordinator(parentCoordinator: self, navigationController: navigationController)
        walletDetailsCoordinator?.start()
    }

}

