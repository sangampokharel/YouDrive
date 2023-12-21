//
//  FormTextField.swift
//  YouDrive
//
//  Created by sangam pokharel on 21/12/2023.
//

import UIKit

class FormTextField:UIView {
    
    let formTitleLabel = UILabel()
    let textField = UITextField()
    let errorMessageLabel = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 300, height: 80)
    }
    
}

extension FormTextField {
    func style() {
        formTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        formTitleLabel.font = UIFont.customFont(.medium, size: 14)
        formTitleLabel.textColor = .appSubTitleTextColor
        
        textField.backgroundColor = .appTextFieldColor
        textField.layer.cornerRadius = 5
        // Set up padding
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        textField.rightView = paddingView
        textField.rightViewMode = .always
        
    }
    
    func layout(){
        addSubview(formTitleLabel)
        addSubview(textField)
        addSubview(errorMessageLabel)
        
        NSLayoutConstraint.activate([
            formTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            formTitleLabel.topAnchor.constraint(equalTo:topAnchor),
            
            textField.topAnchor.constraint(equalTo: formTitleLabel.bottomAnchor,constant: 5),
            textField.leadingAnchor.constraint(equalTo: formTitleLabel.leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: 50)
            
            
            
        ])
        
        
    }
}
