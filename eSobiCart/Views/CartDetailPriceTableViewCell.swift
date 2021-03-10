//
//  CartDetailPriceTableViewCell.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/10.
//

import UIKit

class CartDetailPriceTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    
    func configureCell(cart: Cart) {
        let price = cart.price * cart.quantity
        priceLabel.text = "$" + NumberHelper().addComma(number: price)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
