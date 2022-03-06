//
//  YWalletWatchVC.swift
//  YProjet
//
//  Created by Calin Chitu on 07.04.2021.
//

import UIKit

class WatchWalletViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    @IBOutlet weak var networkLogoImage: UIImageView!
    @IBOutlet weak var networkLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var navigationView: NavigationView!

    @IBAction func qrScanAction(_ sender: UIButton) {

    }

    @IBAction func pasteAction(_ sender: UIButton) {

    }

    @IBAction func confirmAction(_ sender: Any) {
    }

    var viewModel: CreateWalletViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationView.viewDelegate = self
        configureUI()
    }

    private func configureUI() {
        confirmButton.layer.cornerRadius = 10
        navigationView.title = "Watch Wallet".localized
        navigationView.configure(showBackButton: true)
    }

    func bindViewModel() {}
}

extension WatchWalletViewController: NavigationViewDelegate {
    func backAction() {
        viewModel.pop(animated: true)
    }
}
