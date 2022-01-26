//
//  WalletDetailsViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 26.01.2022.
//

import UIKit

class WalletDetailsViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: WalletViewModel!
    @IBOutlet weak var navigationView: NavigationView!
    @IBOutlet weak var tableView: UITableView!

    // TODO: for testing UI
    var noMoney = false

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.viewDelegate = self
        setupTableView()
        configureUI()
    }

    func configureUI() {
        navigationView.configure(showBackButton: true, showNotificationButton: true)
    }

    private func setupTableView() {
        tableView.registerNib(LabelValueTableViewCell.self)
        tableView.registerNib(WalletDetailsTableViewCell.self)
        tableView.registerNib(TransactionTableViewCell.self)
    }

    func bindViewModel() {}

}

// MARK: - DataSource & Delegates
extension WalletDetailsViewController: UITableViewDataSource, UITableViewDelegate {

    enum Sections: Int, CaseIterable {
        case walletSummary
        case walletDetails
        case transactionsHeader
        case walletTransactions
    }

    enum Constants {
        static let smallRowHeight: CGFloat = 30.0
        static let bigRowHeight: CGFloat = 70.0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        if noMoney {
            return 1
        } else {
            return Sections.allCases.count
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case Sections.walletSummary.rawValue:
            return 4
        case Sections.walletDetails.rawValue:
            return 2
        case Sections.transactionsHeader.rawValue:
            return 1
        case Sections.walletTransactions.rawValue:
            return 3
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return viewModel.dataSource.object[indexPath.section].cellForRow(tableView, indexPath: indexPath, viewDelegate: self)

        switch indexPath.section {

        case Sections.walletSummary.rawValue:
            let cell = tableView.dequeue(type: LabelValueTableViewCell.self, indexPath: indexPath)

            if noMoney {
                cell.configure(rightString: "0")
            } else {
                cell.configure()
            }
            return cell

        case Sections.walletDetails.rawValue:
            let cell = tableView.dequeue(type: WalletDetailsTableViewCell.self, indexPath: indexPath)
            cell.configure()
            return cell

        case Sections.transactionsHeader.rawValue:
            let cell = tableView.dequeue(type: LabelValueTableViewCell.self, indexPath: indexPath)
            cell.configure(labelStyle: .bold, leftString: "Transaction History", rightString: "")
            return cell

        case Sections.walletTransactions.rawValue:
            let cell = tableView.dequeue(type: TransactionTableViewCell.self, indexPath: indexPath)
            cell.configure()
            return cell

        default:
            return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case Sections.walletSummary.rawValue, Sections.transactionsHeader.rawValue:
            return Constants.smallRowHeight
        case Sections.walletDetails.rawValue, Sections.walletTransactions.rawValue:
            return Constants.bigRowHeight
        default:
            return 0.0
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension WalletDetailsViewController: NavigationViewDelegate {
    func notificationAction() {

    }

    func backAction() {
        viewModel.pop(animated: true)
    }
}
