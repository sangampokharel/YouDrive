//
//  UIViewController.swift
//  YouDrive
//
//  Created by sangam pokharel on 20/12/2023.
//

import UIKit


extension UIViewController {
    
    func setupKeyboardDismissRecognizer() {
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleSingleTap(_:)))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapRecognizer)
    }
    
    func customButton(title:String)->UIButton {
        let button = UIButton()
        button.backgroundColor = .appYellowColor
        button.setTitle(title.uppercased(), for: .normal)
        button.setTitleColor(.appBlackColor, for: .normal)
        button.titleLabel?.font = UIFont.customFont(.medium, size: 16)
        button.layer.cornerRadius = 5
        return button
        
    }
    
    @objc private func handleSingleTap(_ recognizer: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}
