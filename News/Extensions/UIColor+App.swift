//
//  UIColor+App.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//


import UIKit
import RealmSwift

extension UIColor {
    static var appBackground: UIColor {
            return UIColor { (traits) -> UIColor in
                // Return one of two colors depending on light or dark mode
                return traits.userInterfaceStyle == .dark ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) : #colorLiteral(red: 0.1371955276, green: 0.1390233338, blue: 0.1723983288, alpha: 1)
            }
    }
    
    static var appContentBox: UIColor {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ?  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            }
    }
    
    static var appLabel: UIColor {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ? #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            }
    }
    
    static var appButtonBackground: UIColor {
            return UIColor { (traits) -> UIColor in
                return traits.userInterfaceStyle == .dark ?  #colorLiteral(red: 0.8605346084, green: 0.8606794477, blue: 0.8605156541, alpha: 1) : #colorLiteral(red: 0.08819996566, green: 0.09384011477, blue: 0.1042785272, alpha: 1)
            }
    }
    
}

extension List {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
