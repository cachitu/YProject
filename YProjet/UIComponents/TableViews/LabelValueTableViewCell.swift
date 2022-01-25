//
//  LabelValueTableViewCell.swift
//  YProjet
//
//  Created by cristina.virlan on 25.01.2022.
//

import UIKit

class LabelValueTableViewCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!

    // TODO
    func configure() {
        leftLabel.text = "Some Label"
        rightLabel.text = "Value"

        leftLabel.textColor = .customBlue
        rightLabel.textColor = .customBlue
    }
}

