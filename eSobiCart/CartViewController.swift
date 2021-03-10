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
//        guard let url = URL(string: urlString) else { return }
        let url = NSURL.fileURL(withPath: Bundle.main.path(forResource: "data", ofType: "json")!, isDirectory: true)
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
    
    func checkPromo(_ code: String) {
        guard let promos = eSobiData?.promos else { return }
        
        var usedPromo: Promo?
        for promo in promos {
            if code == promo.promoCode {
                usedPromo = promo
                break
            }
        }
        
        if usedPromo == nil {
            let alert = UIAlertController(title: nil, message: "無此優惠碼", preferredStyle: .alert)
            let confirm = UIAlertAction(title: "確認", style: .default)
            alert.addAction(confirm)
            present(alert, animated: true, completion: nil)
        } else {
            // set promo button
            promoButton.setTitle(usedPromo?.promoName, for: .normal)
            promoButton.isEnabled = false
            promoButton.layer.borderWidth = 0
            
            // set price
            if let carts = eSobiData?.carts, let prices = usedPromo?.prices {
                for i in 0..<carts.count {
                    prices.forEach {
                        if $0.productID == carts[i].productID {
                            eSobiData?.carts[i].price = $0.promoPrice
                        }
                    }
                }
            }
            self.tableView.reloadData()
            self.totalPriceLabel.text = "$\(self.countTotalPrice())"
        }
    }
    
    @IBAction func promoButtonTapped(_ sender: Any) {
        let alert = UIAlertController(title: "", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField) in
            textField.placeholder = "請輸入優惠碼"
            textField.keyboardType = .asciiCapable
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let confirm = UIAlertAction(title: "確認", style: .default) { (_) in
            if let text = alert.textFields?.first?.text {
                self.checkPromo(text)
            }
        }
        alert.addAction(cancel)
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
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
