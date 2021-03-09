//
//  Product.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/9.
//

import Foundation

struct Product: Codable {
    var productID: String
    var name: String
    var image: String
    var option: String?
    var price: Int
    var options: [String]

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case name = "name"
        case image = "image"
        case option = "option"
        case price = "price"
        case options = "options"
    }
}
