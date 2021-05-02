//
//  HomeViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import Foundation
import RxSwift

protocol HomeCoordinatorProtocol: Coordinator {

}

class HomeViewModel: BaseViewModel, CoordinableViewModel  {
    weak var coordinator: HomeCoordinatorProtocol?

    required init(coordinator: HomeCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init()

    }
}
