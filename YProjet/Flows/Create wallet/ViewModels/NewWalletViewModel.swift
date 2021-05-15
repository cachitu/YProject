//
//  NewWalletViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 13/05/2021.
//

import Foundation
import RxSwift
import RxRelay

protocol NewWalletCoordinatorProtocol: Coordinator {
    func confirmPhrase()
}

class NewWalletViewModel: BaseViewModel, CoordinableViewModel  {
    let dataSource = DataSourceStateObject<[CustomTableSection]>(with: [])
    weak var coordinator: NewWalletCoordinatorProtocol?

    required init(coordinator: NewWalletCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init()
    }

    func pop(animated: Bool) {
        coordinator?.pop(animated: animated, completion: nil)
    }
}

// Navigation
extension NewWalletViewModel {
    func confirmPhrase() {
        coordinator?.confirmPhrase()
    }
}
