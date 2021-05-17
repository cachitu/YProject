//
//  SettingsCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 17/05/2021.
//

import UIKit

class SettingsCoordinator: Coordinator {

    //private var changePasswordCoordinator: ChangePasswordCoordinator?

    override func start() {
        transition(to: .showSettings(SettingsViewModel(coordinator: self)), type: .push, animated: true, completion: nil)
    }

    override func flowFinished() {
        pop(animated: true, completion: nil)
        childCoordinatorDidFinish(coordinator: self)
    }

    override func childCoordinatorDidFinish(coordinator: Coordinator) {
//        switch coordinator {
//        case is ChangePasswordCoordinator:
//            changePasswordCoordinator = nil
//        default:
//            break
//        }
    }
}

extension SettingsCoordinator: SettingsCoordinatorProtocol {
    func showChangePassword() {

    }

    func showHome() {
        // Go to Wallet - Home (Welcome / My Wallets)
        // Welcome: if no wallet
        // My Wallets - if there is at least one wallet
    }
}
