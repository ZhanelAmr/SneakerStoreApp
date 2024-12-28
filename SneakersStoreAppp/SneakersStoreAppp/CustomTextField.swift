//
//  CustomTextField.swift
//  SneakersStoreAppp
//
//  Created by Zhanel Amralina on 10/15/24.
//

import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType {
        case email
        case password
        case repPassword
    }
    
    private let authFieldType: CustomTextFieldType
    
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: self.frame.size.height))
        
        switch fieldType {
        case .email:
            self.placeholder = "Username"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
            
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
            
        case .repPassword:
            self.placeholder = "Repeat password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


//class CustomTextField: UITextField {
//
//    var title: String?
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    convenience init(title: String) {
//        self.init(frame: CGRect.zero)
//    }
//
//    convenience init(title: String? = nil, backgroundColor: UIColor? = nil) {
//        self.init(frame: CGRect.zero)
//        self.placeholder = title
//        self.borderStyle = .roundedRect
//        self.backgroundColor = backgroundColor
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implementedd")
//    }
//}
