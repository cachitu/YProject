//
//  LabelValueTableViewCell.swift
//  YProjet
//
//  Created by cristina.virlan on 25.01.2022.
//

import UIKit

enum LabelStyle {
    case bold
    case normal
}

class LabelValueTableViewCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!

    // TODO
    func configure(labelStyle: LabelStyle = .normal, leftString: String? = "Left Label", rightString: String? = "Right Value") {
        switch labelStyle {
        case .bold:
            leftLabel.font = UIFont(name: "Aeonik-Bold", size: 15.0)
        case .normal:
            leftLabel.font = UIFont(name: "Aeonik", size: 15.0)
        }
        leftLabel.text = leftString
        rightLabel.text = rightString
        leftLabel.textColor = .customBlue
        rightLabel.textColor = .customBlue

        isUserInteractionEnabled = false
    }
}

