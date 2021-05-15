//
//  YWalletCreateVC.swift
//  YProjet
//
//  Created by Calin Chitu on 07.04.2021.
//

import UIKit

class CreateWalletViewController: BaseViewController, BindableType, StoryboardIdentifiable {
    @IBOutlet weak var networkLogoImageView: UIImageView!
    @IBOutlet weak var networkNameLabel: UILabel!
    @IBOutlet weak var createView: UIView!
    @IBOutlet weak var importView: UIView!
    @IBOutlet weak var watchView: UIView!
    
    @IBAction func backAction(_ sender: Any) {
        viewModel.pop(animated: true)
    }

    @IBAction func newWalletAction(_ sender: Any) {
        viewModel.createNewWallet()
    }
    
    @IBAction func importWalletAction(_ sender: Any) {
        viewModel.importWallet()
    }

    @IBAction func watchWalletAction(_ sender: Any) {
        viewModel.watchWallet()
    }

    var viewModel: CreateWalletViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createView.layer.cornerRadius = 10
        importView.layer.cornerRadius = 10
        watchView.layer.cornerRadius = 10
    }

    func bindViewModel() {}
}
