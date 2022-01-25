//
//  CustomButton.swift
//  YProjet
//
//  Created by cristina.virlan on 15/05/2021.
//

import UIKit

class CustomButton: UIButton {

    enum Style {
        case generic(fillColor: UIColor? = .systemBlue, textColor: UIColor? = .white)
        case delete
        case bordered(fillColor: UIColor? = .clear, textColor: UIColor? = .white, borderColor: UIColor? = .white)
        case withOpacity(alpha: CGFloat? = 0.2)
    }

    var style: Style = .generic() {
        didSet {
            configure()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func configure() {
        titleLabel?.font = UIFont(name: "Aeonik-Bold", size: 15.0)
        switch style {
        case let .generic(fillColor, textColor):
            backgroundColor = fillColor
            setTitleColor(textColor, for: .normal)

        case .delete:
            backgroundColor = .clear
            setTitleColor(.customRed, for: .normal)
            layer.borderColor = UIColor.customRed.cgColor
            layer.borderWidth = 2.0

        case let .bordered(fillColor, textColor, borderColor):
            backgroundColor = fillColor
            setTitleColor(textColor, for: .normal)
            layer.borderColor = borderColor?.cgColor
            layer.borderWidth = 2.0

        case let .withOpacity(alpha):
            backgroundColor = UIColor.white.withAlphaComponent(alpha ?? 0.2)
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10.0
    }
}
