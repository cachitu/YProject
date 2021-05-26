//
//  StakingViewController.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import UIKit

class StakingViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    var viewModel: StakingViewModel!
    @IBOutlet weak var navigationView: NavigationView!
    @IBOutlet weak var validatorsLabel: UILabel!
    @IBOutlet weak var orderByLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBAction func orderAction(_ sender: UIButton) {

    }
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var arrowImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.viewDelegate = self
        setupTableView()
        configureUI()
    }

    private func configureUI() {
        navigationView.title = "Staking".localized
        navigationView.configure(showNotificationButton: true, showSettingsButton: true)
        validatorsLabel.text = "Validators".localized
        orderByLabel.text = "Order by".localized + ": "

        // TODO: need to define order values
        orderButton.setTitle("Delegation return".localized.addRightWhitespaces(), for: .normal) 
    }

    private func setupTableView() {
        tableView.registerNib(StakingTableViewCell.self)
    }

    func bindViewModel() {}
}

// MARK: - DataSource & Delegates
extension StakingViewController: UITableViewDataSource, UITableViewDelegate {

    enum Constants {
        static let rowHeight: CGFloat = 70.0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //viewModel.dataSource.object[section].numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return viewModel.dataSource.object[indexPath.section].cellForRow(tableView, indexPath: indexPath, viewDelegate: self)

        let cell = tableView.dequeue(type: StakingTableViewCell.self, indexPath: indexPath)
        cell.configure()
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)


    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.rowHeight
    }
}

extension StakingViewController: NavigationViewDelegate {

}

