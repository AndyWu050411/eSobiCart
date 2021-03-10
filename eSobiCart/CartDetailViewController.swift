//
//  CartDetailViewController.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/10.
//

import UIKit

class CartDetailViewController: UIViewController {

    var cart: Cart?
    var product: Product?
    
    @IBOutlet weak var headerView: HeaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let cart = cart {
            headerView.setView(cart: cart)
        }
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
    }
    
}
