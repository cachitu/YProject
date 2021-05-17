//
//  SettingsViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 17/05/2021.
//

import Foundation

protocol SettingsCoordinatorProtocol: Coordinator {
    func showChangePassword()
    func showHome()
}

class SettingsViewModel: BaseViewModel, CoordinableViewModel  {
    let dataSource: [SettingsType] = [.biometric, .changePassword, .changeCurrency]
    weak var coordinator: SettingsCoordinatorProtocol?

    enum SettingsType: Int, CaseIterable {
        case biometric
        case changePassword
        case changeCurrency
    }

    func cellType(for indexPath: IndexPath) -> SettingsType? {
        return SettingsType(rawValue: indexPath.row)
    }

    //var walletObj: Wallet

    required init(coordinator: SettingsCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init()
    }

    func pop(animated: Bool) {
        coordinator?.pop(animated: animated, completion: nil)
    }
}

// Navigation
extension SettingsViewModel {
    func changePassword() {
        coordinator?.showChangePassword()
    }

    func disconnect() {
        // disconnect logic and
        coordinator?.showHome()
    }

    func deleteWallet() {
        // delete wallet logic and
        coordinator?.showHome()
    }
}
