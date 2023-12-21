//
//  CreateProfileViewController.swift
//  YouDrive
//
//  Created by sangam pokharel on 21/12/2023.
//

import UIKit

class CreateProfileViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
    let imageView = UIImageView()
    let cameraImageView = UIImageView()
    
    let firstNameField = FormTextField()
    let lastNameField = FormTextField()
    let emailField = FormTextField()
    let addressField = FormTextField()
    let phoneNumberField = FormTextField()
    
    let firstLastNameStackView = UIStackView()
    let verticalStackView = UIStackView()
    
    var saveInformationButton:UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setupKeyboardDismissRecognizer()
        
        view.backgroundColor = .appBlackColor
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + 20, right: 0)
            scrollView.contentInset = contentInset
            scrollView.scrollIndicatorInsets = contentInset
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        let contentInset = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
        scrollView.scrollIndicatorInsets = contentInset
    }
    
}

extension CreateProfileViewController {
    func style() {
        firstNameField.formTitleLabel.text = "First Name"
        lastNameField.formTitleLabel.text = "Last Name"
        emailField.formTitleLabel.text = "Email"
        addressField.formTitleLabel.text = "Address"
        phoneNumberField.formTitleLabel.text = "Phone Number"
        
        emailField.textField.keyboardType = .emailAddress
        phoneNumberField.textField.keyboardType = .numberPad
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        cameraImageView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.image = UIImage(named: "default-profile")
        cameraImageView.image = UIImage(named: "camera-profile")
        
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 25
        
        firstLastNameStackView.spacing = 8
        firstLastNameStackView.distribution = .fillEqually
        
        saveInformationButton = customButton(title: "save information")
        saveInformationButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        
    }
    
    func layout(){
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(cameraImageView)
        scrollView.addSubview(verticalStackView)
        scrollView.addSubview(saveInformationButton)
        
        firstLastNameStackView.addArrangedSubview(firstNameField)
        firstLastNameStackView.addArrangedSubview(lastNameField)
        
        verticalStackView.addArrangedSubview(firstLastNameStackView)
        verticalStackView.addArrangedSubview(emailField)
        verticalStackView.addArrangedSubview(addressField)
        verticalStackView.addArrangedSubview(phoneNumberField)
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 50),
            
            cameraImageView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor,constant: 10),
            cameraImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 10),
            
            verticalStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 40),
            verticalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -20),
            verticalStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor,constant: -40),
            
            saveInformationButton.topAnchor.constraint(equalTo: verticalStackView.bottomAnchor,constant: 25),
            saveInformationButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 20),
            saveInformationButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -20),
            saveInformationButton.heightAnchor.constraint(equalToConstant: 55),
            saveInformationButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
            
            
            
        ])
        
    }
}
