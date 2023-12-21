////
////  OnBoardingMainViewController.swift
////  YouDrive
////
////  Created by sangam pokharel on 20/12/2023.
////
//




import UIKit

class OnBoardingMainViewController:UIPageViewController {
    
    let skipButton = UIButton()
    let moveButton = UIButton()
    let stackView = UIStackView()
    let pageControl = UIPageControl()
    
    
    
    let initialPage = 0
    let pages = [
        OnBoardingViewController(image: "onBoarding_first", title: "Welcome to YouDrive", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
        OnBoardingViewController(image: "onBoarding_second", title: "Pre-BookingLorem Ipsum is simpply", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "),
        OnBoardingViewController(image: "onBoarding_third", title: "Driver rights to your location", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "),
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        setViewControllers([pages[initialPage]], direction: .forward, animated: true,completion: nil)
        
        self.dataSource = self
        self.delegate = self
        
    }
    
    func changeButtonImage(image:String) {
        moveButton.setImage(UIImage(systemName:image), for: .normal)
    }
    
    @objc func handleSkipBtn() {
        pageControl.currentPage = pages.count - 1
        setViewControllers([pages[pages.count - 1]], direction: .forward, animated: true, completion: nil)
        UIView.animate(withDuration: 0.5) {
            self.changeButtonImage(image: "checkmark")
            self.skipButton.alpha = 0
        }
    }
    @objc func moveToNext() {
        
        
        if moveButton.currentImage ==  UIImage(systemName: "checkmark") {
            // navigate to sign in
            
            let signInVC = SignInViewController()
            navigationController?.pushViewController(signInVC, animated: true)
            
            
            
        }else{
            pageControl.currentPage += 1
            guard let currentPage = viewControllers?[0] else { return }
            guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return }
            
            setViewControllers([nextPage], direction: .forward, animated: true, completion: nil)
            
            let lastPage = pageControl.currentPage == pages.count - 1
            if lastPage {
                UIView.animate(withDuration: 0.5) {
                    self.changeButtonImage(image: "checkmark")
                    self.skipButton.alpha = 0
                }
                
                
            }
        }
        
        
        
        
    }
    
    
}

extension OnBoardingMainViewController {
    func style() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 5
        
        skipButton.setTitle("Skip", for: .normal)
        skipButton.titleLabel?.font = UIFont.customFont(.medium, size: 16)
        skipButton.addTarget(self, action: #selector(handleSkipBtn), for: .touchUpInside)
        
        moveButton.translatesAutoresizingMaskIntoConstraints = false
        moveButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        moveButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        moveButton.backgroundColor = .appYellowColor
        moveButton.tintColor = .appBlackColor
        moveButton.layer.cornerRadius = 30
        moveButton.addTarget(self, action: #selector(moveToNext), for: .touchUpInside)
        changeButtonImage(image: "chevron.right")
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .appYellowColor
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        pageControl.pageIndicatorTintColor = .white
        
    }
    func layout() {
        view.addSubview(stackView)
        view.addSubview(pageControl)
        stackView.addArrangedSubview(moveButton)
        stackView.addArrangedSubview(skipButton)
        
        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: stackView.topAnchor,constant: -30),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -40),
        ])
        
    }
}

extension OnBoardingMainViewController:UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        guard let currentIndex = pages.firstIndex(of: viewController as! OnBoardingViewController) else { return nil }
        
        if currentIndex == 0 {
            return nil              // wrap to last
        } else {
            
            return pages[currentIndex - 1]  // go previous
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pages.firstIndex(of: viewController as! OnBoardingViewController) else { return nil }
        
        if currentIndex < pages.count - 1 {
            
            return pages[currentIndex + 1]  // go next
        } else {
            return nil         // wrap to first
        }
    }
    
    
}


extension OnBoardingMainViewController: UIPageViewControllerDelegate {
    
    // How we keep our pageControl in sync with viewControllers
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else { return }
        guard let currentIndex = pages.firstIndex(of: viewControllers[0] as! OnBoardingViewController) else { return }
        
        pageControl.currentPage = currentIndex
        
        let lastPage = pageControl.currentPage == pages.count - 1
        if lastPage {
            UIView.animate(withDuration: 0.5) {
                self.changeButtonImage(image: "checkmark")
                self.skipButton.alpha = 0
            }
            
        }else {
            UIView.animate(withDuration: 0.5) {
                self.changeButtonImage(image: "chevron.right")
                self.skipButton.alpha = 1
            }
            
        }
    }
    
    
}



