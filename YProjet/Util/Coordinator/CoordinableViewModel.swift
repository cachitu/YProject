//
//  CoordinableViewModel.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import Foundation

protocol CoordinableViewModel {
    associatedtype ViewModelCoordinatorProtocol
    var coordinator: ViewModelCoordinatorProtocol? { get }
}
