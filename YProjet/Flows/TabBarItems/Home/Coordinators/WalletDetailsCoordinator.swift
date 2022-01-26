//
//  WalletDetailsCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 26.01.2022.
//

import UIKit

class WalletDetailsCoordinator: Coordinator {

    private var settingsCoordinator: SettingsCoordinator?

    override func start() {
        showWalletDetails(type: .push)
    }

    func showWalletDetails(type: SceneTransitionType) {
        transition(to: .wallet(WalletViewModel(coordinator: self)), type: type, animated: true, completion: nil)
    }

    override func childCoordinatorDidFinish(coordinator: Coordinator) {
        switch coordinator {
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

extension WalletDetailsCoordinator: WalletCoordinatorProtocol {
    
}
