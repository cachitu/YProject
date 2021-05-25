//
//  GovViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import Foundation

protocol GovCoordinatorProtocol: Coordinator {
    func showDetails()
}

class GovViewModel: BaseViewModel, CoordinableViewModel  {
    weak var coordinator: GovCoordinatorProtocol?

    required init(coordinator: GovCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init()

    }

    func pop(animated: Bool) {
        coordinator?.pop(animated: animated, completion: nil)
    }
}

// Navigation
extension GovViewModel {
    func showDetails() {
        coordinator?.showDetails()
    }
}
