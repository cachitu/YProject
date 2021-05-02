//
//  YWelcomeVC.swift
//  YProjet
//
//  Created by Calin Chitu on 06.04.2021.
//

import UIKit

class WelcomeViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    @IBOutlet weak var tableView: UITableView!
    @IBAction func settingsAction(_ sender: Any) {
        viewModel.showSettings()
    }

    var viewModel: WelcomeViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func bindViewModel() {}
}

extension WelcomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CreateWalletTableViewCell.cellID, for: indexPath) as? CreateWalletTableViewCell else { fatalError("Could not dequeue cell with id \(CreateWalletTableViewCell.cellID)") }
        return cell
    }
}

extension WelcomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.createWallet()
    }
}
