//
//  CartViewController.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/9.
//

import UIKit

class CartViewController: UIViewController {

    var eSobiData: eSobiModel?
    
    // ib
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var promoButton: UIButton! {
        didSet {
            promoButton.layer.borderColor = UIColor.label.cgColor
            promoButton.layer.borderWidth = 1
        }
    }
    @IBOutlet weak var buyButton: UIButton! {
        didSet {
            buyButton.layer.borderColor = UIColor.label.cgColor
            buyButton.layer.borderWidth = 1
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }

    func fetchData() {
        let urlString = "https://gist.githubusercontent.com/Gary-Pan/285e1bfc13a2118abc2579d657d610ab/raw/82dfe9d89c7cda39ca0257cb5ad1d364951a2958/data.json"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let decoder = JSONDecoder()
            if let data = data, let result = try? decoder.decode(eSobiModel.self, from: data) {
                self.eSobiData = result
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.totalPriceLabel.text = "$\(self.countTotalPrice())"
                }
            }

        }.resume()
    }
    
    func countTotalPrice() -> Int {
        guard let carts = eSobiData?.carts else { return 0 }
        var total = 0
        for cart in carts {
            total += cart.price * cart.quantity
        }
        return total
    }
    
    @IBAction func promoButtonTapped(_ sender: Any) {
    }
    
    @IBAction func buyButtonTapped(_ sender: Any) {
    }
    
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eSobiData?.carts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(ProductTableViewCell.self)", for: indexPath) as! ProductTableViewCell
        if let cart = eSobiData?.carts[indexPath.row] {
            cell.configureCell(cart: cart)
        }
        
        return cell
    }
}
