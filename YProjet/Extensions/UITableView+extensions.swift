//
//  UITableView+extensions.swift
//  YProjet
//
//  Created by cristina.virlan on 17/05/2021.
//

import UIKit

extension UITableView {

    func registerNib<T: ReusableCell>(_ cell: T.Type) {
        register(cell.nib, forCellReuseIdentifier: cell.identifier)
    }

    func registerHeaderNib<T: ReusableCell>(_ cell: T.Type) {
        register(cell.nib, forHeaderFooterViewReuseIdentifier: cell.identifier)
    }

    func dequeue<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("A cell with this identifier could not be found")
        }
        return cell
    }

    func dequeue<T: UITableViewHeaderFooterView>(type: T.Type) -> T {
        guard let headerView = dequeueReusableHeaderFooterView(withIdentifier: String(describing: T.self)) as? T else {
            fatalError("A cell with this identifier could not be found")
        }
        return headerView
    }

}
