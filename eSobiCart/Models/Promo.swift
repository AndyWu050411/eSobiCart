//
//  Promo.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/9.
//

import Foundation

struct Promo: Codable {
    let promoCode: String?
    let promoName: String?
    let price: [Price]?

    enum CodingKeys: String, CodingKey {
        case promoCode = "promoCode"
        case promoName = "promoName"
        case price = "price"
    }
}

struct Price: Codable {
    let productID: String?
    let promoPrice: Int?

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case promoPrice = "promoPrice"
    }
}
