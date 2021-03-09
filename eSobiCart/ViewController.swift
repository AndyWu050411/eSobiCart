//
//  ViewController.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/9.
//

import UIKit

class ViewController: UIViewController {

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
                print(result)
            }
            
        }.resume()
    }
    
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


class JsonData: Decodable {
    
}
