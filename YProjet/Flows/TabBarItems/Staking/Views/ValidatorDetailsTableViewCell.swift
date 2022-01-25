//
//  ValidatorDetailsTableViewCell.swift
//  YProjet
//
//  Created by cristina.virlan on 25.01.2022.
//

import UIKit

class ValidatorDetailsTableViewCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var rightValueLabel: UILabel!
    @IBOutlet weak var roundedView: UIView!
    
    @IBOutlet weak var bottomLabelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftLabelsSpacingConstraint: NSLayoutConstraint!

    // TO DO: for testing UI
    // Voting power cell -> multiple details
    // Commission cell -> not multiple details (on one row)
    let multipleDetailsCell = true

    override func willMove(toSuperview newSuperview: UIView?) {
        roundedView.layer.cornerRadius = 10
        roundedView.layer.shadowRadius = 5
        roundedView.layer.shadowOpacity = 0.02
    }

    // TODO
    func configure() {
        topLabel.text = "Voting power"
        rightValueLabel.text = "4.37%"

        if multipleDetailsCell {
            bottomLabel.text = "13,222,097.000000 Luna"
            bottomLabelHeightConstraint.constant = 18.0
            leftLabelsSpacingConstraint.constant = 6.0
        } else {
            bottomLabel.text = ""
            bottomLabelHeightConstraint.constant = 0.0
            leftLabelsSpacingConstraint.constant = 12.0
        }

        topLabel.textColor = .customBlue
        bottomLabel.textColor = .customBlue
        rightValueLabel.textColor = .customBlue
    }
}

