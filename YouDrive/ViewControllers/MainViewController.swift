//
//  ViewController.swift
//  YouDrive
//
//  Created by sangam pokharel on 20/12/2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let onBoardingVC = OnBoardingMainViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChild(onBoardingVC)
        view.addSubview(onBoardingVC.view)
        onBoardingVC.didMove(toParent: self)
    }
    
    
    
}

