//
//  Authorization.swift
//  SneakersStoreAppp
//
//  Created by Zhanel Amralina on 10/15/24.
//

//
//  Authorization.swift
//  SneakersStroreUIKit
//
//  Created by Тулеби Берик on 01.06.2023.
//

import UIKit

class AuthorizationView: UIViewController {
    
    private let topTitle: UILabel = {
        let label = UILabel()
        label.text = "Welcome back!"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17)
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        label.textColor = Colors.authTitle
        return label
    }()
    
    private let userTextFiled = CustomTextField(fieldType: .email)
    private let passwordTextFiled = CustomTextField(fieldType: .password)
    
    private let signInButton = CustomButton(title: "Sign in" , backgroundColor: Colors.generalButton, cornerRadius: 25, font: .systemFont(ofSize: 17))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        customNavigationBar()
        setUI()
        setActions()
    }
    
    func setUI() {
        [topTitle, userTextFiled, passwordTextFiled, signInButton].forEach {self.view.addSubview($0)}
        
        topTitle.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 65)
        userTextFiled.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 140, paddingLeft: 16, paddingRight: 16, height: 48)
        passwordTextFiled.anchor(top: userTextFiled.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16, height: 48)
        signInButton.anchor(left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingLeft: 16, paddingBottom: 58, paddingRight: 16, height: 54)
        
    }
    
    func setActions() {
        self.signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    
    @objc func didTapSignIn() {
        let loginRequest = LoginUserRequest(
            email: self.userTextFiled.text ?? "",
            password: self.passwordTextFiled.text ?? ""
        )
        
        if !Validator.isValidEmail(for: loginRequest.email){
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        if !Validator.isPasswordValid(for: loginRequest.password){
            AlertManager.showInvalidPasswordAlert(on: self)
            return
        }
        
        AuthService.shared.signIn(with: loginRequest) { error in
            if let error = error {
                AlertManager.showSignInErrorAlert(on: self, with: error)
                return
            }
            
            if let sceneDelegate = self.view.window?.windowScene?.delegate as?
                SceneDelegate {
                sceneDelegate.checkAuthentication()
            }
        }
    }
    
    func customNavigationBar() {
        let appearance = UINavigationBarAppearance()
            appearance.backButtonAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
    }
}
