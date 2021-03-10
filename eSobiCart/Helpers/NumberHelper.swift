//
//  NumberHelper.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/10.
//

import Foundation

class NumberHelper {
    
    func addComma(number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(from: NSNumber(value:number)) ?? ""
    }
    
}
