//
//  Promo.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/9.
//

import Foundation

struct Promo: Codable {
    var promoCode: String
    var promoName: String
    var price: [Price]

    enum CodingKeys: String, CodingKey {
        case promoCode = "promoCode"
        case promoName = "promoName"
        case price = "price"
    }
}

struct Price: Codable {
    var productID: String
    var promoPrice: Int

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case promoPrice = "promoPrice"
    }
}
