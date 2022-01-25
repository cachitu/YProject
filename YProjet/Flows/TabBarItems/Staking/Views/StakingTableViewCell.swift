//
//  StakingTableViewCell.swift
//  YProjet
//
//  Created by cristina.virlan on 26/05/2021.
//

import UIKit

class StakingTableViewCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var walletImageView: UIImageView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var roundedView: UIView!

    override func willMove(toSuperview newSuperview: UIView?) {
        roundedView.layer.cornerRadius = 10
        roundedView.layer.shadowRadius = 5
        roundedView.layer.shadowOpacity = 0.02
    }

    // TODO
    func configure() {
        walletImageView.image = Images.WalletTypes.cosmos.image
        leftLabel.text = "Name"
        rightLabel.text = "Value"
    }
}

