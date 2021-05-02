//
//  WelcomeViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import Foundation
import RxSwift
import RxRelay

protocol WelcomeCoordinatorProtocol: Coordinator {
    //TODO: add wallet type param
    func createWallet()
    func showSettings()
}

class WelcomeViewModel: BaseViewModel, CoordinableViewModel  {
    let dataSource = DataSourceStateObject<[CustomTableSection]>(with: [])
    weak var coordinator: WelcomeCoordinatorProtocol?

    required init(coordinator: WelcomeCoordinatorProtocol) {
        self.coordinator = coordinator
    }

    func pop(animated: Bool) {
        coordinator?.pop(animated: animated, completion: nil)
    }
}

// Navigation
extension WelcomeViewModel {
    func createWallet() {
        coordinator?.createWallet()
    }

    func showSettings() {
        coordinator?.showSettings()
    }
}
