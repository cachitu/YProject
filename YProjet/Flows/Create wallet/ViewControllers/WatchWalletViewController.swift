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
    
    @IBAction func backAction(_ sender: Any) {
        viewModel.pop(animated: true)
    }
    
    @IBAction func confirmAction(_ sender: Any) {
    }

    var viewModel: CreateWalletViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmButton.layer.cornerRadius = 10
    }

    func bindViewModel() {}
}
