//
//  WalletViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 26.01.2022.
//

import Foundation

protocol WalletCoordinatorProtocol: Coordinator {
    func showSettings()
}

class WalletViewModel: BaseViewModel, CoordinableViewModel {
    weak var coordinator: WalletCoordinatorProtocol?

    required init(coordinator: WalletCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init()

    }

    func pop(animated: Bool) {
        coordinator?.pop(animated: animated, completion: nil)
    }

    func showSettings() {
        coordinator?.showSettings()
    }
}
