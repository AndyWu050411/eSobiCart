//
//  HeaderView.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/10.
//

import UIKit

class HeaderView: UIView {

    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    

    func setView(cart: Cart) {
        if let url = URL(string: "https://gist.githubusercontent.com/Gary-Pan/285e1bfc13a2118abc2579d657d610ab/raw/82dfe9d89c7cda39ca0257cb5ad1d364951a2958/" + cart.image) {
            downloadImage(from: url)
        }
        titleLabel.text = cart.name
    }
    
    func downloadImage(from url: URL) {
        ImageService.shared.fetchImage(with: url) { (image) in
            if let image = image {
                DispatchQueue.main.async {
                    self.headerImageView.image = image
                }
            }
        }
    }
    
}
