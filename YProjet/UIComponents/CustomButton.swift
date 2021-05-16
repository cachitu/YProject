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
        //case cancel
        //case delete
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
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 10.0
    }
}
