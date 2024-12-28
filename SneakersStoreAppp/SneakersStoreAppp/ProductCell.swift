//
//  ProductCell.swift
//  SneakersStoreAppp
//
//  Created by Zhanel Amralina on 10/15/24.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    public let definitonLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .left
        return label
    }()
    
    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    public let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        return label
    }()
    
    private let actionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to Cart", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.backgroundColor = Colors.generalButton
        button.layer.cornerRadius = 20
       // button.addTarget(ProductCell.self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    public var isAddedToCart = false {
        didSet {
            let title = isAddedToCart ? "Remove" : "Add to Cart"
            actionButton.setTitle(title, for: .normal)
        }
    }
    
     var addButtonTapped: (() -> Void)?
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        backgroundColor = .white
        [titleLabel, imageView, priceLabel, actionButton, definitonLabel].forEach { contentView.addSubview($0) }
        
        imageView.anchor(top: self.contentView.topAnchor, left: self.contentView.leftAnchor, right: self.contentView.rightAnchor)
        titleLabel.anchor(top: imageView.bottomAnchor, left: self.contentView.leftAnchor, right: self.contentView.rightAnchor)
        definitonLabel.anchor(top: titleLabel.bottomAnchor, left: self.contentView.leftAnchor, right: self.contentView.rightAnchor, paddingTop: 2)
        priceLabel.anchor(top: definitonLabel.bottomAnchor, left: self.contentView.leftAnchor, right: self.contentView.rightAnchor, paddingTop: 4)
        actionButton.anchor(top: priceLabel.bottomAnchor , left: self.contentView.leftAnchor, bottom: self.contentView.bottomAnchor, right: self.contentView.rightAnchor,paddingTop: 8, height: 40)
    }
    
    // MARK: - Button Action
    
    @objc private func buttonTapped() {
        isAddedToCart.toggle()
        addButtonTapped?()
    }
}

//if product.isAddedToCart {
//    actionButton.setTitle("Remove", for: .normal)
//    actionButton.backgroundColor = .red
//} else {
//    actionButton.setTitle("Add to Cart", for: .normal)
//    actionButton.backgroundColor = .green
//}
