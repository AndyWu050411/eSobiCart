//
//  Cart.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/9.
//

import Foundation

struct Cart: Codable {
    var productID: String
    var name: String
    var image: String
    var option: String?
    var quantity: Int
    var price: Int

    enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case name = "name"
        case image = "image"
        case option = "option"
        case quantity = "quantity"
        case price = "price"
    }
}
