//
//  CartDetailViewController.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/10.
//

import UIKit

protocol CartDetailViewDelegate {
    func updateCart(cart: Cart)
}

class CartDetailViewController: UIViewController, UpdateCartViewDelegate {
    
    var delegate: CartDetailViewDelegate?
    var cart: Cart?
    var product: Product?
    var optionSelectedIndexPath = IndexPath()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet var updateCartView: UpdateCartView!
    var dimView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.label.withAlphaComponent(0.5)
        view.isHidden = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUpdateCartView()
        
        if let cart = cart {
            headerView.setView(cart: cart)
        }
    }
    
    func setupUpdateCartView() {
        dimView.frame = view.frame
        view.addSubview(dimView)
        updateCartView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: 250)
        updateCartView.delegate = self
        updateCartView.cart = cart
        updateCartView.product = product
        updateCartView.setupView()
        view.addSubview(updateCartView)
    }
    
    func closeButtonTapped() {
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, animations: {
            self.updateCartView.frame = CGRect(x: 0, y: self.view.frame.height, width: self.view.frame.width, height: 250)
            self.dimView.isHidden = true
        }, completion: nil)
    }
    
    func updateButtonTapped(cart: Cart) {
        self.cart = cart
        tableView.reloadData()
        delegate?.updateCart(cart: cart)
    }
    
}

extension CartDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(CartDetailPriceTableViewCell.self)", for: indexPath) as! CartDetailPriceTableViewCell
            if let cart = cart {
                cell.configureCell(cart: cart)
            }
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(CartDetailOptionTableViewCell.self)", for: indexPath) as! CartDetailOptionTableViewCell
            if let cart = cart {
                cell.configureCell(cart: cart)
            }
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row != 1 { return }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, animations: {
            self.dimView.isHidden = false
            self.updateCartView.frame = CGRect(x: 0, y: self.view.frame.height - 250, width: self.view.frame.width, height: 250)
        }, completion: nil)
        
    }
    
}

extension CartDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product?.options.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(OptionCollectionViewCell.self)", for: indexPath) as! OptionCollectionViewCell
        if let text = product?.options[indexPath.row] {
            var isSelect = false
            if text == cart?.option {
                isSelect = true
                self.optionSelectedIndexPath = indexPath
            }
            cell.configureCell(text: text, isSelect: isSelect)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath != optionSelectedIndexPath {
            let oldSelectedCell = collectionView.cellForItem(at: optionSelectedIndexPath) as! OptionCollectionViewCell
            oldSelectedCell.configureCell(isSelect: false)
            
            optionSelectedIndexPath = indexPath
            let newSelectedCell = collectionView.cellForItem(at: optionSelectedIndexPath) as! OptionCollectionViewCell
            newSelectedCell.configureCell(isSelect: true)
            
            updateCartView.cart?.option = product?.options[indexPath.row]
        }
    }
    
}
