//
//  Product.swift
//  SneakersStoreAppp
//
//  Created by Zhanel Amralina on 10/15/24.
//

import UIKit

struct Product: Equatable{
    let title: String
    let definition: String
    let image: UIImage?
    let price: String
    var isAddedToCart: Bool
    
    init(title: String, definition: String, image: UIImage?, price: String, isAddedToCart: Bool) {
        self.title = title
        self.definition = definition
        self.image = image
        self.price = price
        self.isAddedToCart = isAddedToCart
    }
}
