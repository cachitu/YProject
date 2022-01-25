//
//  StakingDelegateTableViewCell.swift
//  YProjet
//
//  Created by cristina.virlan on 25.01.2022.
//

import UIKit

class StakingDelegateTableViewCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var validatorImageView: UIImageView!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!

    // TODO
    func configure() {
        validatorImageView.image = UIImage(named: "validator-icon") //TODO: from API
        leftLabel.text = "0base.vc"
        rightLabel.text = "0.500000 LUNA"

        leftLabel.textColor = .customBlue
        rightLabel.textColor = .customBlue
    }
}
