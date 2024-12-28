//
//  Registration.swift
//  SneakersStoreAppp
//
//  Created by Zhanel Amralina on 10/15/24.
//

import UIKit

class RegistrationView: UIViewController {
    
    private let topTitle: UILabel = {
        let label = UILabel()
        label.text = "New User"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17)
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        label.textColor = Colors.authTitle
        return label
    }()
    
    private let userTextFiled = CustomTextField(fieldType: .email)
    private let passwordTextFiled = CustomTextField(fieldType: .password)
    private let repPasswordTextFiled = CustomTextField(fieldType: .repPassword)
    
    private let signUpButton = CustomButton(title: "Sign up" , backgroundColor: Colors.generalButton, cornerRadius: 25, font: .systemFont(ofSize: 17))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        customNavigationBar()
        setUI()
        setActions()
    }
    
    func setUI() {
        [topTitle, userTextFiled, passwordTextFiled, repPasswordTextFiled, signUpButton].forEach {self.view.addSubview($0)}
        
        topTitle.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 65)
        userTextFiled.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 140, paddingLeft: 16, paddingRight: 16, height: 48)
        passwordTextFiled.anchor(top: userTextFiled.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16, height: 48)
        repPasswordTextFiled.anchor(top: passwordTextFiled.bottomAnchor, left: self.view.leftAnchor, right: self.view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16, height: 48)
        signUpButton.anchor(left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingLeft: 16, paddingBottom: 58, paddingRight: 16, height: 54)
        
    }
    
    func customNavigationBar() {
        let appearance = UINavigationBarAppearance()
            appearance.backButtonAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.clear]
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.standardAppearance = appearance
    }
    
    private func setActions() {
        self.signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
    }
    
    @objc func didTapSignUp() {
            let registerUserRequest = RegisterUserRequest(
                email: self.userTextFiled.text ?? "",
                password: self.passwordTextFiled.text ?? "",
                repPassword: self.repPasswordTextFiled.text ?? ""
            )
            
            if !Validator.isValidEmail(for: registerUserRequest.email){
                AlertManager.showInvalidEmailAlert(on: self)
                return
            }
            if !Validator.isPasswordValid(for: registerUserRequest.password){
                AlertManager.showInvalidPasswordAlert(on: self)
                return
            }
            
            if registerUserRequest.password != registerUserRequest.repPassword{
                AlertManager.showInvalidrepPasswordeAlert(on: self)
                return
        }
        AuthService.shared.registerUser(with: registerUserRequest) { [weak self]
            wasRegistered, error in
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showRegistrationErrorAlert(on: self, with: error)
                return
            }
            
            if wasRegistered {
                if let sceneDelegate = self.view.window?.windowScene?.delegate as? SceneDelegate {
                    sceneDelegate.checkAuthentication()
                }
            } else {
                AlertManager.showRegistrationErrorAlert(on: self)
            }
        }
    }
}
