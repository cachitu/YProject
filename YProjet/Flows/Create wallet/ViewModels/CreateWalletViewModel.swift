//
//  CreateWalletViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import Foundation
import RxSwift
import RxRelay

protocol CreateWalletCoordinatorProtocol: Coordinator {
    func createNewWallet()
    func importWallet()
    func watchWallet()
}

class CreateWalletViewModel: BaseViewModel, CoordinableViewModel  {
    let dataSource = DataSourceStateObject<[CustomTableSection]>(with: [])
    weak var coordinator: CreateWalletCoordinatorProtocol?

    required init(coordinator: CreateWalletCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init()
    }

    func pop(animated: Bool) {
        coordinator?.pop(animated: animated, completion: nil)
    }
}

// Navigation
extension CreateWalletViewModel {
    func createNewWallet() {
        coordinator?.createNewWallet()
    }

    func importWallet() {
        coordinator?.importWallet()
    }

    func watchWallet() {
        coordinator?.watchWallet()
    }
}
