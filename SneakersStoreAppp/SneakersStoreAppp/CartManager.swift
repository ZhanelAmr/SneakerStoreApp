//
//  CartManager.swift
//  SneakersStoreAppp
//
//  Created by Zhanel Amralina on 10/15/24.
//

import UIKit


class CartManager {
    static let shared = CartManager()
    private var cartItems: [Product] = []

    private init() {}
    
    func addToCart(product: Product) {
        cartItems.append(product)
    }

    func removeFromCart(product: Product) {
        if let index = cartItems.firstIndex(where: { $0.title == product.title }) {
            cartItems.remove(at: index)
        }
    }

    func getCartItems() -> [Product] {
        return cartItems
    }
}
