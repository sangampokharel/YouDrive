//
//  SignInViewController.swift
//  YouDrive
//
//  Created by sangam pokharel on 20/12/2023.
//

import UIKit

class SignInViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let imageView = UIImageView()
    let stackView = UIStackView()
    let signInLabel = UILabel()
    let numberTextFieldContainer = UIStackView()
    let verticalDividerContainer = UIView()
    let countryCodeLabel = UILabel()
    let numberTexfield = UITextField()
    
    var continueBtn:UIButton!
    let privacyPolicyLabel = UILabel()
    
    let orSignInWith = UILabel()
    let buttonStackView = UIStackView()
    
    var facebookBtn:UIButton!
    var googleBtn:UIButton!
    var appleBtn:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardDismissRecognizer()
        style()
        layout()
        
        
        
        
    }
    
    func imageButton(image:String)->UIButton{
        
        let button = UIButton()
        button.setImage(UIImage(named: image), for: .normal)
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.appVerticalBorderLight.cgColor
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 76).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }
    
    
    
}

extension SignInViewController {
    func style(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "signin-logo")
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        
        signInLabel.text = "Sign in with mobile number"
        signInLabel.font = UIFont.customFont(.medium, size: 18)
        signInLabel.textColor = .white
        
        numberTextFieldContainer.axis = .horizontal
        numberTextFieldContainer.alignment = .fill
        numberTextFieldContainer.distribution = .fill
        numberTextFieldContainer.spacing = 8
        numberTextFieldContainer.isLayoutMarginsRelativeArrangement = true
        numberTextFieldContainer.layoutMargins = UIEdgeInsets(top: 10, left: 16, bottom: 10, right: 16)
        numberTextFieldContainer.backgroundColor = .appTextFieldColor
        numberTextFieldContainer.translatesAutoresizingMaskIntoConstraints = false
        numberTextFieldContainer.layer.borderWidth = 0.25
        numberTextFieldContainer.layer.borderColor = UIColor.white.cgColor
        numberTextFieldContainer.layer.cornerRadius = 5
        numberTextFieldContainer.clipsToBounds = true
        
        countryCodeLabel.text = "+251"
        countryCodeLabel.font = UIFont.customFont(.medium, size: 18)
        countryCodeLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        numberTexfield.setContentHuggingPriority(.defaultLow, for: .horizontal)
        numberTexfield.font = UIFont.customFont(.medium, size: 18)
        numberTexfield.keyboardType = .numberPad
        
        verticalDividerContainer.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        verticalDividerContainer.backgroundColor = .appVerticalBorderLight
        
        continueBtn = customButton(title: "continue")
        continueBtn.translatesAutoresizingMaskIntoConstraints = false
        
        
        let first = NSAttributedString(string: "By creating new account, you agree to our ", attributes: [
            .font:UIFont.customFont(.regular, size: 14),
            .foregroundColor: UIColor.appSubTitleTextColor
        ])
        let second = NSAttributedString(string: " Terms & Conditions ", attributes: [
            .font:UIFont.customFont(.regular, size: 14),
            .foregroundColor: UIColor.white
        ])
        let third = NSAttributedString(string: "&", attributes: [
            .font:UIFont.customFont(.regular, size: 14),
            .foregroundColor: UIColor.appSubTitleTextColor
        ])
        
        let fourth = NSAttributedString(string: " Privacy Policy ", attributes: [
            .font:UIFont.customFont(.regular, size: 14),
            .foregroundColor: UIColor.white
        ])
        
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(first)
        mutableAttributedString.append(NSAttributedString(string: "\n"))
        mutableAttributedString.append(second)
        mutableAttributedString.append(third)
        mutableAttributedString.append(fourth)
        privacyPolicyLabel.attributedText = mutableAttributedString
        privacyPolicyLabel.numberOfLines = 0
        privacyPolicyLabel.textAlignment = .center
        
        orSignInWith.text = "Or Sign In With"
        orSignInWith.font = UIFont.customFont(.medium, size: 16)
        orSignInWith.translatesAutoresizingMaskIntoConstraints = false
        orSignInWith.textColor = .white
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 16
        
        facebookBtn = imageButton(image: "facebook")
        googleBtn = imageButton(image: "google")
        appleBtn = imageButton(image: "apple")
        
        
    }
    
    func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(signInLabel)
        stackView.addArrangedSubview(numberTextFieldContainer)
        stackView.addArrangedSubview(continueBtn)
        stackView.addArrangedSubview(privacyPolicyLabel)
        
        numberTextFieldContainer.addArrangedSubview(countryCodeLabel)
        numberTextFieldContainer.addArrangedSubview(verticalDividerContainer)
        numberTextFieldContainer.addArrangedSubview(numberTexfield)
        
        scrollView.addSubview(orSignInWith)
        scrollView.addSubview(buttonStackView)
        
        buttonStackView.addArrangedSubview(facebookBtn)
        buttonStackView.addArrangedSubview(googleBtn)
        buttonStackView.addArrangedSubview(appleBtn)
        
        
        
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 50),
            imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -20),
            stackView.topAnchor.constraint(equalTo: imageView.bottomAnchor,constant: 40),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor,constant: -40),
            
            numberTextFieldContainer.heightAnchor.constraint(equalToConstant: 55),
            verticalDividerContainer.widthAnchor.constraint(equalToConstant: 2),
            continueBtn.heightAnchor.constraint(equalToConstant: 55),
            
            orSignInWith.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            orSignInWith.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 50),
            
            buttonStackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            buttonStackView.topAnchor.constraint(equalTo: orSignInWith.bottomAnchor,constant: 50),

            
            
        ])
    }
}
