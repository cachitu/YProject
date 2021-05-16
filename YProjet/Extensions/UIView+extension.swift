//
//  UIView+extension.swift
//  YProjet
//
//  Created by cristina.virlan on 16/05/2021.
//

import UIKit

extension UIView {

    static func viewFromNib(withOwner: UIView, bundle: Bundle) -> UIView {
        let nib = UINib(nibName: "\(type(of: withOwner))", bundle: bundle)
        let view = nib.instantiate(withOwner: withOwner, options: nil).first as! UIView
        return view
    }

    func loadFromNib(withOwner: UIView) -> UIView {
        let bundle = Bundle.main
        let view = UIView.viewFromNib(withOwner: withOwner, bundle: bundle)
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.backgroundColor = UIColor.clear
        return view
    }

}
