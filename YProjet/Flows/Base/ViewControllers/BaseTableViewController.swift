//
//  BaseTableViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import RxSwift
import UIKit

class BaseTableViewController: UITableViewController {

    var logoutDisposeBag = DisposeBag()
    let disposeBag = DisposeBag()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
}

