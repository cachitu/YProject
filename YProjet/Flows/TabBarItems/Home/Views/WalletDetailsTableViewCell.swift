//
//  WalletDetailsTableViewCell.swift
//  YProjet
//
//  Created by cristina.virlan on 26.01.2022.
//

import UIKit

class WalletDetailsTableViewCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var walletImageView: UIImageView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightNumberLabel: UILabel!
    @IBOutlet weak var rightValueLabel: UILabel!
    @IBOutlet weak var roundedView: UIView!

    override func willMove(toSuperview newSuperview: UIView?) {
        roundedView.layer.cornerRadius = 10
        roundedView.layer.shadowRadius = 5
        roundedView.layer.shadowOpacity = 0.02
    }

    // TODO
    func configure() {
        walletImageView.image = Images.WalletTypes.cosmos.image
        leftLabel.text = "Luna"
        rightNumberLabel.text = "1.0000000"
        rightValueLabel.text = "$6.448756"
    }
}

