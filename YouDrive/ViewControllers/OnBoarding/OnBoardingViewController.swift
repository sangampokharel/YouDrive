//
//  OnBoardingViewController.swift
//  YouDrive
//
//  Created by sangam pokharel on 20/12/2023.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let mainStackView = UIStackView()
    
    
    var image:String?
    var mainTitle:String?
    var mainDescription: String?
    
    
    
    init(image:String,title:String,description:String) {
        super.init(nibName: nil, bundle: nil)
        self.image = image
        self.mainTitle = title
        self.mainDescription = description
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    
}

extension OnBoardingViewController {
    func style() {
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.spacing = 40
        if let image = self.image{
            imageView.image = UIImage(named: image)
            
        }
        
        
        titleLabel.text = mainTitle
        titleLabel.font = UIFont.customFont(.medium, size: 20)
        titleLabel.textColor = .white
        
        
        descriptionLabel.text = mainDescription
        descriptionLabel.font = UIFont.customFont(.medium, size: 15)
        descriptionLabel.textColor = .appSubTitleTextColor
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
    }
    
    func layout() {
        view.addSubview(mainStackView)
        
        mainStackView.addArrangedSubview(imageView)
        mainStackView.addArrangedSubview(titleLabel)
        mainStackView.addArrangedSubview(descriptionLabel)
        
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor,constant: -60),
        ])
    }
}
