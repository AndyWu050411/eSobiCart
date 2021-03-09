//
//  eSobiModel.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/9.
//

import Foundation

struct eSobiModel: Codable {
    var carts: [Cart]
    var promos: [Promo]
    var products: [Product]

    enum CodingKeys: String, CodingKey {
        case carts = "cart"
        case promos = "promo"
        case products = "products"
    }
}
