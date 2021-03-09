//
//  ImageService.swift
//  eSobiCart
//
//  Created by AndyWu on 2021/3/9.
//

import UIKit

class ImageService {
    static let shared = ImageService()
    
    let imageCache = NSCache<NSURL, UIImage>()
    
    func fetchImage(with url: URL, completion: @escaping (UIImage?) -> Void) {
        if let image = imageCache.object(forKey: url as NSURL) {
            completion(image)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                self.imageCache.setObject(image, forKey: url as NSURL)
                completion(image)
            } else {
                completion(nil)
            }
        }.resume()
    }
    
}
