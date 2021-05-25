//
//  SettingsViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 17/05/2021.
//

import UIKit

class SettingsViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    @IBOutlet weak var navigationView: NavigationView!
    @IBOutlet weak var disconnectButton: CustomButton!
    @IBOutlet weak var deleteWalletButton: CustomButton!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func disconnectAction(_ sender: Any) {
        viewModel.disconnect()
    }

    @IBAction func deleteWalletAction(_ sender: Any) {
        viewModel.deleteWallet()
    }

    var viewModel: SettingsViewModel!

    // MARK: Constants
    private enum Constants {
        static let heightForRow: CGFloat = 60.0
        static let heightForFooterInSection: CGFloat = 0.1
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.viewDelegate = self
        configureUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.tabBarController?.tabBar.isHidden = false
    }

    private func configureUI() {
        navigationView.title = "wallet name"
        navigationView.configure(showBackButton: true, showNotificationButton: true) 

        disconnectButton.setTitle("Disconnect".localized, for: .normal)
        disconnectButton.style = CustomButton.Style.generic(fillColor: .customBlue, textColor: .white)

        deleteWalletButton.setTitle("Delete Wallet".localized, for: .normal)
        deleteWalletButton.style = CustomButton.Style.delete
    }

    func bindViewModel() {}
}

extension SettingsViewController: NavigationViewDelegate {
    func backAction() {
        viewModel.pop(animated: true)
    }

    func notificationAction() {

    }
}

// MARK: Table View
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModel.dataSource[indexPath.row]
        let cell = tableView.dequeue(type: SettingsChangeTableViewCell.self, indexPath: indexPath)
        cell.setup(for: item)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.heightForRow
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return Constants.heightForFooterInSection
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

