//
//  WalletImportVC.swift
//  YProjet
//
//  Created by Calin Chitu on 07.04.2021.
//

import UIKit

class ImportWalletViewController: BaseViewController, BindableType, StoryboardIdentifiable {

    @IBOutlet weak var networkImageLogo: UIImageView!
    @IBOutlet weak var mnemonicTextView: UITextView!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var navigationView: NavigationView!
    @IBOutlet weak var pasteButton: UIButton!

    @IBAction func pasteAction(_ sender: UIButton) {
        if let pasteString = UIPasteboard.general.string {
            mnemonicTextView.text = pasteString
        }
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
        pasteButton.setTitle("    " + "Paste phrase".localized, for: .normal)
        navigationView.title = "Import Wallet".localized
        navigationView.configure(showBackButton: true)
    }
    
    func bindViewModel() {}
}

extension ImportWalletViewController: NavigationViewDelegate {
    func backAction() {
        viewModel.pop(animated: true)
    }
}
