//
//  HomeTableViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

//import RxRelay
import RxSwift
import UIKit

class HomeTableViewController: BaseTableViewController, StoryboardIdentifiable {

    var viewModel: HomeViewModel!
    var scrollViewHandler: ((CGFloat) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }

    private func setupTableView() {
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 25
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollViewHandler?(scrollView.contentOffset.y)
    }

    override func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        scrollViewHandler?(scrollView.contentOffset.y)
    }

    private func setupRefreshControl() {
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(reloadContent), for: .valueChanged)
    }

    @objc private func reloadContent() {

    }
}
