//
//  Product.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/9.
//

import Foundation

struct Product: Codable {
    let productID: String?
    let name: String?
    let image: String?
    let option: String?
    let price: Int?
    let options: [String]?

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case name = "name"
        case image = "image"
        case option = "option"
        case price = "price"
        case options = "options"
    }
}
