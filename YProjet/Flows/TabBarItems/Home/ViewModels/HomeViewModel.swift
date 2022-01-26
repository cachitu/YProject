//
//  HomeViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import Foundation
import RxSwift

protocol HomeCoordinatorProtocol: Coordinator {
    func showWalletDetails()
}

class HomeViewModel: BaseViewModel, CoordinableViewModel  {
    weak var coordinator: HomeCoordinatorProtocol?

    required init(coordinator: HomeCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init()

    }

    func pop(animated: Bool) {
        coordinator?.pop(animated: animated, completion: nil)
    }
}

// Navigation
extension HomeViewModel {
    func showWalletDetails() {
        coordinator?.showWalletDetails()
    }
}
