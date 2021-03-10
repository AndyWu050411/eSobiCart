//
//  CartDetailOptionTableViewCell.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/10.
//

import UIKit

class CartDetailOptionTableViewCell: UITableViewCell {

    @IBOutlet weak var optionTitleLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    func configureCell(cart: Cart) {
        if cart.option == nil {
            optionTitleLabel.isHidden = true
            optionLabel.isHidden = true
        } else {
            optionLabel.text = cart.option
        }
        quantityLabel.text = "\(cart.quantity)"
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
