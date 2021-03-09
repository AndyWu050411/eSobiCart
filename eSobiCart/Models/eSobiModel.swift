//
//  eSobiModel.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/9.
//

import Foundation

struct eSobiModel: Codable {
    let cart: [Cart]?
    let promo: [Promo]?
    let products: [Product]?

    enum CodingKeys: String, CodingKey {
        case cart = "cart"
        case promo = "promo"
        case products = "products"
    }
}
