//
//  StyleKit.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import UIKit

class StyleKit {
    
    static func applyRegularLabelStyle(label: UILabel, fontSize: CGFloat = 14, color: UIColor = .darkText) {
        label.textColor = color
        label.font = UIFont.regularAppFont(of: fontSize)
    }
    
    static func applyMediumLabelStyle(label: UILabel, fontSize: CGFloat = 14, color: UIColor = .darkGray) {
        label.textColor = color
        label.font = UIFont.mediumAppFont(of: fontSize)
    }
    
    static func applyBoldLabelStyle(label: UILabel, fontSize: CGFloat = 20, color: UIColor = .darkText) {
        label.textColor = color
        label.font = UIFont.boldAppFont(of: fontSize)
    }
    
    static func applyRoundCornersAndShadowAroundView(view: UIView, cornerRadius: CGFloat = 7.0, shadowColor: UIColor = .darkText, shadowRadius: CGFloat = 10.0, shadowOpacity: Float = 0.3, shadowOffset: CGSize = .zero) {
        view.layer.cornerRadius = cornerRadius
        view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.layer.cornerRadius).cgPath
        view.layer.shadowColor = shadowColor.cgColor
        view.layer.shadowRadius = shadowRadius
        view.layer.shadowOpacity = shadowOpacity
        view.layer.shadowOffset = shadowOffset
        view.layer.masksToBounds = false
    }
   
    static func applyRoundCornerTheme(button: UIButton, fontSize: CGFloat = 14.0, title: String? = nil, cornerRadius: CGFloat = 7.0) {
        //Title
        if title != nil {
            button.setTitle(title, for: .normal)
        }
        button.backgroundColor = .appButtonBackground
        button.setTitleColor(.appLabel, for: .normal)
        //FONT
        button.titleLabel?.font = .mediumAppFont(of: fontSize)
        button.layer.cornerRadius = cornerRadius
        button.layer.masksToBounds = true
    }
    
    static func applyRoundCorners(view: UIView, corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        view.layer.mask = mask
    }
    
}
