//
//  GovViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import Foundation

protocol GovCoordinatorProtocol: Coordinator {

}

class GovViewModel: BaseViewModel, CoordinableViewModel  {
    weak var coordinator: GovCoordinatorProtocol?

    required init(coordinator: GovCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init()

    }
}

// Navigation
extension GovViewModel {

}
