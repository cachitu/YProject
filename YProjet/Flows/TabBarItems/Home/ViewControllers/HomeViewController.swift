//
//  HomeViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

class HomeViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: HomeViewModel!
    private var initialHeight: CGFloat = 0

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func bindViewModel() {}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let homeTableViewController = segue.destination as? HomeTableViewController else {
            fatalError("HomeViewController always expects a HomeTableViewController as content!")
        }
        homeTableViewController.viewModel = viewModel
        homeTableViewController.scrollViewHandler = { [weak self] offset in
            self?.scrollViewDidScroll(offset: offset)
        }
    }

    func scrollViewDidScroll(offset: CGFloat) {
        //topViewHeightConstraint.constant = max(initialHeight - offset, 0)
    }
}
