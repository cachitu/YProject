//
//  GovTableViewCell.swift
//  YProjet
//
//  Created by cristina.virlan on 25/05/2021.
//

import UIKit

class GovTableViewCell: UITableViewCell, ReusableCell {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var roundedView: UIView!

    // TODO: this should come from the model (just for testing UI)
    var isActive = true
    var status = "Passed" //"Rejected"

    override func willMove(toSuperview newSuperview: UIView?) {
        roundedView.layer.cornerRadius = 10
        roundedView.layer.shadowRadius = 5
        roundedView.layer.shadowOpacity = 0.02
    }

    // TODO
    func configure() {
        numberLabel.text = "#25"
        titleLabel.text = "Luna Mission - Funding $Atom"
        descriptionLabel.text = "The Cosmos Hub (ATOM) community is lorem ipsum"

        // TODO: replace this (just for testing UI)
        if isActive {
            statusLabel.text = "6d 23h 12m" // expiry - current date
            statusLabel.textColor = .lightLilac
            statusLabel.font = UIFont(name: "Aeonik-Bold", size: 15.0)
            roundedView.backgroundColor = UIColor.white
            titleLabel.textColor = .customBlue
            descriptionLabel.textColor = .customBlue
        } else {
            statusLabel.text = status
            roundedView.backgroundColor = UIColor.white.withAlphaComponent(0.4)
            statusLabel.font = UIFont(name: "Aeonik", size: 15.0)
            titleLabel.textColor = .lightLilac
            descriptionLabel.textColor = .lightLilac

            if status == "Passed" {
                statusLabel.textColor = .customGreen
            } else {
                statusLabel.textColor = .customRed
            }
        }
    }
}



