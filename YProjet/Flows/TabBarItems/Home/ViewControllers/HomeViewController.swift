//
//  HomeViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import UIKit

class HomeViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: HomeViewModel!
    @IBOutlet weak var navigationView: NavigationView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.viewDelegate = self
        setupTableView()
        configureUI()
    }

    func configureUI() {
        navigationView.title = "My Wallets".localized
        navigationView.configure(showNotificationButton: true, showSettingsButton: true)
    }

    func bindViewModel() {}

    private func setupTableView() {
        tableView.registerNib(WalletTableViewCell.self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let homeTableViewController = segue.destination as? HomeTableViewController else {
            fatalError("HomeViewController always expects a HomeTableViewController as content!")
        }
        homeTableViewController.viewModel = viewModel
    }
}

// MARK: - DataSource & Delegates
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {

    enum Constants {
        static let rowHeight: CGFloat = 100.0
        static let headerHeight: CGFloat = 30.0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //viewModel.dataSource.object[section].numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return viewModel.dataSource.object[indexPath.section].cellForRow(tableView, indexPath: indexPath, viewDelegate: self)

        let cell = tableView.dequeue(type: WalletTableViewCell.self, indexPath: indexPath)
        cell.configure()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        // TODO: send wallet id
        viewModel.showWalletDetails()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.headerHeight
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension HomeViewController: NavigationViewDelegate {
    func notificationAction() {

    }

    func settingsAction() {
        viewModel.showSettings()
    }
}

