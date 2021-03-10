//
//  UpdateCartView.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/10.
//

import UIKit

protocol UpdateCartViewDelegate {
    func closeButtonTapped()
    func updateButtonTapped(cart: Cart)
}

class UpdateCartView: UIView {
    
    var delegate: UpdateCartViewDelegate?
    var cart: Cart?
    var product: Product?
    
    @IBOutlet weak var optionTitleLabel: UILabel!
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel! {
        didSet {
            quantityLabel.layer.borderColor = UIColor.label.cgColor
            quantityLabel.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var closeButton: UIButton! {
        didSet {
            closeButton.clipsToBounds = true
            closeButton.layer.cornerRadius = closeButton.frame.width / 2
            closeButton.layer.borderColor = UIColor.label.cgColor
            closeButton.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var minusButton: UIButton! {
        didSet {
            minusButton.layer.borderColor = UIColor.label.cgColor
            minusButton.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var plusButton: UIButton! {
        didSet {
            plusButton.layer.borderColor = UIColor.label.cgColor
            plusButton.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var updateCartButton: UIButton! {
        didSet {
            updateCartButton.layer.borderColor = UIColor.label.cgColor
            updateCartButton.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var optionsCollectionView: UICollectionView!
    
    func setupView() {
        if let option = cart?.option {
            optionLabel.text = option
        } else {
            optionTitleLabel.isHidden = true
            optionLabel.isHidden = true
        }
        if let quantity = cart?.quantity {
            quantityLabel.text = "\(quantity)"
        } else {
            quantityLabel.text = "0"
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        delegate?.closeButtonTapped()
    }
    
    @IBAction func minusButtonTapped(_ sender: Any) {
        guard let quantity = cart?.quantity else { return }
        if quantity > 1 {
            cart?.quantity -= 1
            quantityLabel.text = "\(quantity - 1)"
        }
    }
    
    @IBAction func plusButtonTapped(_ sender: Any) {
        guard let quantity = cart?.quantity else { return }
        cart?.quantity += 1
        quantityLabel.text = "\(quantity + 1)"
    }
    
    @IBAction func updateCartButtonTapped(_ sender: Any) {
        guard let cart = cart else { return }
        delegate?.updateButtonTapped(cart: cart)
    }
    
}
