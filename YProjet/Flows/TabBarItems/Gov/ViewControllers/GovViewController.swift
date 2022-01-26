//
//  GovViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import UIKit

class GovViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: GovViewModel!
    @IBOutlet weak var navigationView: NavigationView!
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.viewDelegate = self
        configureUI()
        setupTableView()
    }

    func configureUI() {
        navigationView.title = "Governance".localized
        navigationView.configure(showNotificationButton: true)
    }

    private func setupTableView() {
        tableView.registerNib(GovTableViewCell.self)
    }

    func bindViewModel() {}
}

// MARK: - DataSource & Delegates
extension GovViewController: UITableViewDataSource, UITableViewDelegate {

    enum Constants {
        static let rowHeight: CGFloat = 100.0
        static let headerHeight: CGFloat = 30.0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4 //viewModel.dataSource.object[section].numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return viewModel.dataSource.object[indexPath.section].cellForRow(tableView, indexPath: indexPath, viewDelegate: self)

        let cell = tableView.dequeue(type: GovTableViewCell.self, indexPath: indexPath)
        cell.configure()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

        // TODO: send proposal id here
        viewModel.showDetails()
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

extension GovViewController: NavigationViewDelegate {

}
