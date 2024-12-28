//
//  WelcomePage.swift
//  SneakersStoreAppp
//
//  Created by Zhanel Amralina on 10/15/24.
//

import UIKit

class WelcomePage: UIViewController {
    
    private let imageOne: UIImageView = {
        let image = UIImage(named: "ellipse1")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let imageTwo: UIImageView = {
        let image = UIImage(named: "ellipse2")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let imageVector: UIImageView = {
        let image = UIImage(named: "vector4")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleBottom: UILabel = {
        let label = UILabel()
        label.text = "Welcome to the biggest\nsneakers store app"
        label.numberOfLines = 2
        label.textColor = Colors.welcomePage
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let haveAccButton: UIButton = {
        let button = UIButton()
        button.setTitle("I already have an account", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        return button
    }()
    
    let signUpButton = CustomButton(title: "Sign up" , backgroundColor: Colors.generalButton, cornerRadius: 25, font: .systemFont(ofSize: 17))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setUI()
        setActions()
    }
    
    func setUI() {
        [imageOne, imageTwo, imageVector, titleBottom, signUpButton, haveAccButton].forEach { self.view.addSubview($0) }
        
        imageOne.anchor(top: self.view.topAnchor, right: self.view.rightAnchor, paddingTop: 247)
        imageTwo.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, paddingTop: 312)
        imageVector.anchor(top: self.view.topAnchor, left: self.view.leftAnchor)
        titleBottom.anchor(left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingBottom: 198)
        signUpButton.anchor(top: titleBottom.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor,paddingTop: 24, paddingLeft: 16, paddingRight: 16, height: 54)
        haveAccButton.anchor(top: signUpButton.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 24)
    }
    
    
    //MARK: - setActions
    private func setActions() {
        self.signUpButton.addTarget(self, action: #selector(handleSignUpButton), for: .touchUpInside)
        self.haveAccButton.addTarget(self, action: #selector(handleHaveAccButton), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc private func handleSignUpButton() {
        let destinationViewController = RegistrationView()
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
    @objc private func handleHaveAccButton() {
        let destinationViewController = AuthorizationView()
        navigationController?.pushViewController(destinationViewController, animated: true)
    }
    
}
