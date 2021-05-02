//
//  CreateWalletCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

class CreateWalletCoordinator: Coordinator {
    override func start() {
        transition(to: .createWallet(CreateWalletViewModel(coordinator: self)), type: .push, animated: true, completion: nil)
    }

    override func flowFinished() {
        pop(animated: true, completion: nil)
        childCoordinatorDidFinish(coordinator: self)
    }
}

extension CreateWalletCoordinator: CreateWalletCoordinatorProtocol {
    func createNewWallet() {

    }

    func importWallet() {
        transition(to: .importWallet(CreateWalletViewModel(coordinator: self)), type: .push, animated: true, completion: nil)
    }

    func watchWallet() {
        transition(to: .watchWallet(CreateWalletViewModel(coordinator: self)), type: .push, animated: true, completion: nil)
    }
}
