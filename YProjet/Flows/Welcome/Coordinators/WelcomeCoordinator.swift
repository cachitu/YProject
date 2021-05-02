//
//  WelcomeCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import Foundation

class WelcomeCoordinator: Coordinator {
    private var createWalletCoordinator: CreateWalletCoordinator?

    override func start() {
        transition(to: .welcome(WelcomeViewModel(coordinator: self)), type: .navigationRoot, animated: true, completion: nil)
    }

    override func flowFinished() {
        pop(animated: true, completion: nil)
        parentCoordinator?.childCoordinatorDidFinish(coordinator: self)
    }

    override func childCoordinatorDidFinish(coordinator: Coordinator) {
        switch coordinator {
        case is CreateWalletCoordinator:
            createWalletCoordinator = nil
        default:
            break
        }
    }
}

extension WelcomeCoordinator: WelcomeCoordinatorProtocol {
    func createWallet() {
        createWalletCoordinator = CreateWalletCoordinator(parentCoordinator: self, navigationController: self.navigationController)
        createWalletCoordinator?.start()
    }

    func showSettings() {

    }
}
