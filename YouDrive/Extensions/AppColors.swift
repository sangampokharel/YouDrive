//
//  AppColors.swift
//  YouDrive
//
//  Created by sangam pokharel on 20/12/2023.
//

import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static let appBlackColor = UIColor(hex: "#000002")
    static let appYellowColor = UIColor(hex: "#FBB136")
    static let appSubTitleTextColor = UIColor(hex: "#A4A2A2")
    static let appTextFieldColor = UIColor(hex: "#444444")
    static let appVerticalBorderLight = UIColor(hex: "#D6DBDF")
    
    
    
    
}
