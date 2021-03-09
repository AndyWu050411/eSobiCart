//
//  ProductTableViewCell.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/9.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(cart: Cart) {
        if let url = URL(string: "https://gist.githubusercontent.com/Gary-Pan/285e1bfc13a2118abc2579d657d610ab/raw/82dfe9d89c7cda39ca0257cb5ad1d364951a2958/" + cart.image) {
            downloadImage(from: url)
        }
        titleLabel.text = cart.name
        optionLabel.text = cart.option
        priceLabel.text = "$\(cart.price * cart.quantity)"
        quantityLabel.text = "\(cart.quantity)"
    }
    
    override func prepareForReuse() {
        productImageView.image = nil
        titleLabel.text = ""
        optionLabel.text = ""
        priceLabel.text = ""
        quantityLabel.text = ""
    }
    
    func downloadImage(from url: URL) {
        ImageService.shared.fetchImage(with: url) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    self.productImageView.image = image
                }
            }
        }
    }

}
