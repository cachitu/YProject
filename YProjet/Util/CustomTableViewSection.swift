//
//  CustomTableViewSection.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

/// The ViewDelegate is used only for the CustomTableSections, to make sure they are implemented in a viewController
protocol ViewDelegate: UIViewController { }

protocol CustomTableSection {
    var numberOfRows: Int { get }
    var heightForRow: CGFloat { get }

    func cellForRow(_ tableView: UITableView, indexPath: IndexPath, viewDelegate: ViewDelegate?) -> UITableViewCell
    func getDelegate<T>(_ viewDelegate: ViewDelegate?) -> T?
}

extension CustomTableSection {
    func getDelegate<T>(_ viewDelegate: ViewDelegate?) -> T? {
        return viewDelegate as? T
    }
}
