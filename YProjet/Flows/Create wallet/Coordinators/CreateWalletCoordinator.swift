//
//  CreateWalletCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

class CreateWalletCoordinator: Coordinator {

    private var newWalletCoordinator: NewWalletCoordinator?

    override func start() {
        transition(to: .createWallet(CreateWalletViewModel(coordinator: self)), type: .push, animated: true, completion: nil)
    }

    override func flowFinished() {
        pop(animated: true, completion: nil)
        childCoordinatorDidFinish(coordinator: self)
    }

    override func childCoordinatorDidFinish(coordinator: Coordinator) {
        switch coordinator {
        case is NewWalletCoordinator:
            newWalletCoordinator = nil
        default:
            break
        }
    }
}

extension CreateWalletCoordinator: CreateWalletCoordinatorProtocol {
    func createNewWallet() {
        newWalletCoordinator = NewWalletCoordinator(parentCoordinator: self, navigationController: self.navigationController)
        newWalletCoordinator?.start()
    }

    func importWallet() {
        transition(to: .importWallet(CreateWalletViewModel(coordinator: self)), type: .push, animated: true, completion: nil)
    }

    func watchWallet() {
        transition(to: .watchWallet(CreateWalletViewModel(coordinator: self)), type: .push, animated: true, completion: nil)
    }
}
