//
//  Cart.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/9.
//

import Foundation

struct Cart: Codable {
    let productID: String?
    let name: String?
    let image: String?
    let option: String?
    let quantity: Int?
    let price: Int?

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case name = "name"
        case image = "image"
        case option = "option"
        case quantity = "quantity"
        case price = "price"
    }
}
