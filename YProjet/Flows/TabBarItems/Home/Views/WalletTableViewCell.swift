//
//  WalletTableViewCell.swift
//  YProjet
//
//  Created by cristina.virlan on 24/05/2021.
//

import UIKit

class WalletTableViewCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var walletImageView: UIImageView!
    @IBOutlet weak var walletNameLabel: UILabel!
    @IBOutlet weak var walletAddressLabel: UILabel!
    @IBOutlet weak var walletBalanceLabel: UILabel!
    @IBOutlet weak var roundedView: UIView!

    override func willMove(toSuperview newSuperview: UIView?) {
        roundedView.layer.cornerRadius = 10
        roundedView.layer.shadowRadius = 5
        roundedView.layer.shadowOpacity = 0.02
    }

    // TODO
    func configure() {
        walletImageView.image = Images.WalletTypes.cosmos.image
        walletNameLabel.text = "Cosmos"
        walletAddressLabel.text = "cosmos1o489…vqpzknvklxjhsiurV"
        walletBalanceLabel.text = "$23,872.88"
    }
}
