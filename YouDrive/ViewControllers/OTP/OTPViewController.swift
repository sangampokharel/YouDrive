//
//  OTPViewController.swift
//  YouDrive
//
//  Created by sangam pokharel on 21/12/2023.
//

import UIKit

class OTPViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
    let logoImageView = UIImageView()
    
    let stackView = UIStackView()
    let mobileLogoImageView = UIImageView()
    let codeSentMsgLabel = UILabel()
    let didntReceiveLabel = UILabel()
    var verifyBtn:UIButton!
    
    let otpFieldStackView = UIStackView()
    
    var phoneField:UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setupKeyboardDismissRecognizer()
        view.backgroundColor = .appBlackColor
    }
    
    @objc func textFieldDidChange(_ textField: UITextField){
        
    }
    
    @objc func handleVerifyAction() {
        let createProfileVC = CreateProfileViewController()
        navigationController?.pushViewController(createProfileVC, animated: true)
    }
    
}

extension OTPViewController {
    func style() {
        verifyBtn = customButton(title: "Verify")
        verifyBtn.addTarget(self, action: #selector(handleVerifyAction), for: .touchUpInside)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.alignment = .center
        
        otpFieldStackView.axis = .horizontal
        otpFieldStackView.spacing = 20
        otpFieldStackView.alignment = .fill
        
        logoImageView.image = UIImage(named: "signin-logo")
        
        mobileLogoImageView.image = UIImage(named: "opt-phone")
        mobileLogoImageView.contentMode = .scaleAspectFit
        
        let first = NSAttributedString(string: "Code is sent to ", attributes: [.font:UIFont.customFont(.light, size: 16), .foregroundColor:UIColor.appSubTitleTextColor])
        let second = NSAttributedString(string: "+251-9762511608", attributes: [.font:UIFont.customFont(.medium, size: 16), .foregroundColor:UIColor.white])
        let codeSendAttributed = NSMutableAttributedString()
        codeSendAttributed.append(first)
        codeSendAttributed.append(second)
        
        codeSentMsgLabel.attributedText = codeSendAttributed
        
        let firstPart = NSAttributedString(string: "Didn't receive code? ", attributes: [.font:UIFont.customFont(.medium, size: 16),.foregroundColor: UIColor.appSubTitleTextColor])
        let secondPart = NSAttributedString(string: "Request again", attributes: [.font:UIFont.customFont(.medium, size: 16),.foregroundColor: UIColor.white])
        
        let requestAgainMutableAttributed = NSMutableAttributedString()
        requestAgainMutableAttributed.append(firstPart)
        requestAgainMutableAttributed.append(secondPart)
        
        didntReceiveLabel.attributedText = requestAgainMutableAttributed
        
    }
    
    func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(logoImageView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(mobileLogoImageView)
        stackView.addArrangedSubview(codeSentMsgLabel)
        stackView.addArrangedSubview(otpFieldStackView)
        stackView.addArrangedSubview(didntReceiveLabel)
        stackView.addArrangedSubview(verifyBtn)
        
        for i in 1...4 {
            phoneField = UITextField()
            phoneField.translatesAutoresizingMaskIntoConstraints = false
            phoneField.backgroundColor = .appTextFieldColor
            phoneField.layer.borderWidth = 0.5
            phoneField.layer.borderColor = UIColor.white.cgColor
            phoneField.layer.cornerRadius = 5
            phoneField.textAlignment = .center
            phoneField.keyboardType = .numberPad
            phoneField.tag = i
            phoneField.font = UIFont.customFont(.medium, size: 18)
            phoneField.widthAnchor.constraint(equalToConstant: 50).isActive = true
            phoneField.heightAnchor.constraint(equalToConstant: 55).isActive = true
            phoneField.addTarget(self, action: #selector(self.textFieldDidChange(_:)), for: .editingChanged)
            
            otpFieldStackView.addArrangedSubview(phoneField)
        }
        
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 30),
            
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -20),
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor,constant: 30),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor,constant: -40),
            
            verifyBtn.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            verifyBtn.heightAnchor.constraint(equalToConstant: 55)
            
            
            
        ])
    }
}

