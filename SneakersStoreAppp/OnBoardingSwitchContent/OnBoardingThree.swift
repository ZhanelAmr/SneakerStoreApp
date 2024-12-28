//
//  OnBoardingThree.swift
//  SneakersStoreAppp
//
//  Created by Zhanel Amralina on 10/15/24.
//

import UIKit

class OnBoardingThree: UIViewController {
    
    private let imageOne: UIImageView = {
        let image = UIImage(named: "image5")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let imageTwo: UIImageView = {
        let image = UIImage(named: "image6")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let imageVector: UIImageView = {
        let image = UIImage(named: "vector3")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let backImage: UIImageView = {
        let image = UIImage(named: "background3")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleBottom: UILabel = {
        let label = UILabel()
        label.text = "Fast shipping"
        label.textColor = Colors.onBoardingText
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private let definition: UILabel = {
        let label = UILabel()
        label.text = "Get all of your desired sneakers in one place."
        label.textColor = Colors.onBoardingText
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
    
    private func setUI() {
        [imageTwo, imageOne, imageVector, backImage, titleBottom, definition].forEach { self.view.addSubview($0) }
        
        imageOne.anchor(top: self.view.topAnchor, right: self.view.rightAnchor, paddingTop: 87)
        imageTwo.anchor(top: self.view.topAnchor, left: self.view.leftAnchor)
        imageVector.anchor(top: self.view.topAnchor, left: self.view.leftAnchor,paddingTop: 460)
        backImage.anchor(left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor)
        titleBottom.anchor(left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingBottom: 174)
        definition.anchor(left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingBottom: 136)
        //titleBottom.centerX(in: self.view)
    }
}
