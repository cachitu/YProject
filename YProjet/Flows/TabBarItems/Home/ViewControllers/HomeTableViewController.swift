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
//        viewModel.refreshSprintContent(showSkeleton: false)
//        viewModel.refreshMyProfileCard(showSkeleton: false)
    }
}

// MARK: - Monitors
private extension HomeTableViewController {
    func performBatchUpdates() {
        DispatchQueue.main.async { [weak tableView] in
            tableView?.beginUpdates()
            tableView?.endUpdates()
        }
    }

    func monitorCombinedDataSources() {
//        Observable.zip(viewModel.sprintDataSource.state, viewModel.userService.userDetail)
//            .observeOn(MainScheduler.instance)
//            .subscribe { [weak self] _, _ in
//                self?.tableView.refreshControl?.endRefreshing()
//            }.disposed(by: disposeBag)
    }

    func monitorDataSource() {
//        viewModel.sprintDataSource.state
//            .observeOn(MainScheduler.instance)
//            .subscribe(onNext: { [weak self] state in
//                guard let self = self else { return }
//
//                switch state {
//                case .initial:
//                    self.mySprintCell.changeState(to: .loading)
//                case .loading:
//                    self.mySprintCell.changeState(to: .loading)
//                case .dataChanged(let items):
//                    self.mySprintCell.configure(with: items)
//                    self.performBatchUpdates()
//                case .error(let error):
//                    if case Errors.Unwrapping.emptyValue = error {
//                        self.mySprintCell.changeState(to: .empty)
//                    } else {
//                        self.mySprintCell.changeState(to: .error)
//                    }
//                }
//            }).disposed(by: disposeBag)
    }

    func showNoInternetView(_ show: Bool) {
//        view.subviews.first(where: { $0 is NoContentView })?.removeFromSuperview()
//        if show {
//            let noContentView = NoContentView(frame: view.bounds)
//            noContentView.setup(with: .noInternet)
//            view.addSubview(noContentView)
//            view.bringSubviewToFront(noContentView)
//        }
//        view.isUserInteractionEnabled = !show
//        tableView.showsVerticalScrollIndicator = !show
    }
}
