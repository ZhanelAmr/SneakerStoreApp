//
//  CustomButton.swift
//  SneakersStoreAppp
//
//  Created by Zhanel Amralina on 10/15/24.
//

import UIKit

class CustomButton: UIButton {
    var title: String?
    var color: UIColor?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(title: String) {
        self.init(frame: CGRect.zero)
    }
    
    convenience init(title: String? = nil, backgroundColor: UIColor? = nil, cornerRadius: CGFloat? = nil, font: UIFont? = nil) {
        self.init(frame: CGRect.zero)
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        self.backgroundColor = backgroundColor
        
        self.titleLabel?.font = font
        
        if let cornerRadius = cornerRadius {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    convenience init(color: UIColor) {
        self.init(frame: CGRect.zero)
        self.color = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implementedd")
    }
    
}
