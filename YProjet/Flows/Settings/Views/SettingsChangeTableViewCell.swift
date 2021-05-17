//
//  SettingsChangeTableViewCell.swift
//  YProjet
//
//  Created by cristina.virlan on 17/05/2021.
//

import UIKit

protocol SettingsChangeCellDelegate: ViewDelegate {
    func changeCurrency()
    func useBioAuthentication(value: Bool)
}

class SettingsChangeTableViewCell: UITableViewCell, ReusableCell {
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!

    @IBOutlet weak var bioSwitch: UISwitch!

    @IBAction func bioSwitchAction(_ sender: UISwitch) {
        delegate?.useBioAuthentication(value: sender.isOn)
    }

    weak var delegate: SettingsChangeCellDelegate?

    // TODO: add settings obj as param
    func setup(for cellType: SettingsViewModel.SettingsType) {
        switch cellType {
        case .biometric:
            leftLabel.text = "Use Bio Authorization".localized
            rightLabel.text = nil
            bioSwitch.isHidden = false
            bioSwitch.isOn = false

        case .changePassword:
            leftLabel.text = "Change Password".localized
            rightLabel.text = nil
            bioSwitch.isHidden = true

        case .changeCurrency:
            leftLabel.text = "Change currency".localized
            rightLabel.text = "USD"
            bioSwitch.isHidden = true
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        leftLabel.text = nil
        rightLabel.text = nil
        bioSwitch.isHidden = true
    }
}
