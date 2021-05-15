//
//  NewWalletCoordinator.swift
//  YProjet
//
//  Created by cristina.virlan on 13/05/2021.
//

import UIKit

class NewWalletCoordinator: Coordinator {
    override func start() {
        transition(to: .collectPhrase(NewWalletViewModel(
                                        coordinator: self)), type: .push, animated: true, completion: nil)
    }

    override func flowFinished() {
        pop(animated: true, completion: nil)
        childCoordinatorDidFinish(coordinator: self)
    }
}

extension NewWalletCoordinator: NewWalletCoordinatorProtocol {
    func confirmPhrase() {
        transition(to: .confirmPhrase(NewWalletViewModel(
                                        coordinator: self)), type: .push, animated: true, completion: nil)
    }
}
