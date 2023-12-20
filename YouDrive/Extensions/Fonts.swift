//
//  Fonts.swift
//  YouDrive
//
//  Created by sangam pokharel on 20/12/2023.
//
//
//100-300: Light (Thin)
//400: Regular (Normal)
//500: Medium
//600-700: Bold
//800-900: Extra Bold or Black

import UIKit

extension UIFont {
    enum CustomFont: String {
        
      
        
        case regular = "Heebo-Regular"
        case bold = "Heebo-Bold"
        case light = "Heebo-Light"
        case medium = "Heebo-Medium"
        case semibold = "Heebo-SemiBold"
        // Add more cases for different styles if needed
    }

    static func customFont(_ type: CustomFont, size: CGFloat) -> UIFont {
        return UIFont(name: type.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
